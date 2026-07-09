#!/usr/bin/env python3
"""generate_haxe_externs.py - Complete final version
Usage:
    python3 generate_haxe_externs.py           # -> ./haxe_externs/ (one file per topic)
    python3 generate_haxe_externs.py <dir>      # -> <dir>/
    python3 generate_haxe_externs.py --single   # -> ./WickedEngine.hx
"""
 
import argparse, os, re, sys, textwrap
from collections import OrderedDict
 
HERE     = os.path.dirname(os.path.abspath(__file__))
DOC_FILE = os.path.join(os.path.dirname(HERE), "ScriptingAPI-Documentation.md")
API_START = "## Utility Tools"
PACKAGE   = "we"

LUA_TO_HAXE = {
    "number":"Float","string":"String","boolean":"Bool","bool":"Bool",
    "integer":"Int","int":"Int","table":"Dynamic","any":"Dynamic",
    "nil":"Void","void":"Void","function":"Dynamic","thread":"Dynamic",
    "entity":"Int", 
}
 
# Haxe 标准库冲突名称 → 重命名为 WE 前缀
RENAME = {
    "Texture": "WETexture",
    "Vector":  "WEVector",    # 可选：如果和 haxe.ds.Vector 冲突再加
}
KNOWN = set()
 
RESERVED = {
    "class","static","public","private","function","var","new","return",
    "if","else","while","for","do","switch","case","default","break",
    "continue","true","false","null","import","package","using","typedef",
    "enum","abstract","interface","implements","extends","cast","override",
    "inline","extern","dynamic","trace","untyped","in","is","end","type",
}
 
# ── helpers ──────────────────────────────────────────────────────────────────

TYPE_ALIAS = {
    "Entity": "Int",
}

def cvt(s):
    if not s: return "Dynamic"
    s = s.strip().rstrip("?")
    if not s: return "Dynamic"
    parts = [p.strip().rstrip("?") for p in s.split("|")]
    non_nil = [p for p in parts if p not in ("nil", "")]
    if not non_nil: return "Dynamic"
    if len(non_nil) > 1: return "Dynamic"
    b = non_nil[0]
    m = re.match(r"^(\w+)\[\]$", b)
    if m: return f"Array<{cvt(m.group(1))}>"
    if re.match(r"^table<", b): return "Dynamic"
    if b.startswith("fun("): return "Dynamic"
    lo = b.lower()
    if lo in LUA_TO_HAXE: return LUA_TO_HAXE[lo]
    if b in TYPE_ALIAS: return TYPE_ALIAS[b]   # ← 加这一行
    if b and b[0].isupper():
        b = RENAME.get(b, b)
        KNOWN.add(b); return b
    return "Dynamic"
 
def safe(s):
    """Guarantee non-empty Haxe type."""
    r = s if s and s.strip() else "Dynamic"
    return r if r else "Dynamic"
 
def ident(s):
    s = re.sub(r"[^a-zA-Z0-9_]", "_", s)
    return s + "_" if s in RESERVED else s

def fmt_param(name, typ):
    if name.startswith("?"):
        return f"?{ident(name[1:])}:{safe(typ)}"
    return f"{ident(name)}:{safe(typ)}"
 
def dox(text, ind="\t"):
    if not text or not text.strip(): return ""
    ls = ([f"{ind}/**"]
          + [f"{ind} * {l.strip()}" for l in text.strip().splitlines()]
          + [f"{ind} */"])
    return "\n".join(ls)
 
def ret_str(r):
    """Always emit return type, including :Void."""
    return f":{safe(r)}"
 
# ── data model ───────────────────────────────────────────────────────────────
 
class Field:
    def __init__(self, name, typ, doc=""):
        self.name = name
        self.typ  = safe(typ)
        self.doc  = doc
 
class Method:
    def __init__(self, name, params=None, ret="Void", doc=""):
        self.name   = name
        self.params = params or []
        self.ret    = safe(ret)
        self.doc    = doc
 
class Const:
    def __init__(self, name, typ, val, doc=""):
        self.name = name
        self.typ  = safe(typ)
        self.val  = val
        self.doc  = doc
 
class Cls:
    def __init__(self, name, parent=None, doc=""):
        self.name    = RENAME.get(name, name)   # ← 重命名
        self.parent  = RENAME.get(parent, parent) if parent else None
        self.doc     = doc
        self.fields  = []
        self.methods = []   # instance
        self.statics = []   # Class.Method style
        KNOWN.add(name)
 
    def hx(self):
        out = []
        if self.doc: out.append(dox(self.doc, ""))
        ext = f" extends {self.parent}" if self.parent else ""
        out.append(f"extern class {self.name}{ext} {{")
        body = []
 
        # constructor
        for m in self.methods:
            if m.name == "new":
                if m.doc: body.append(dox(m.doc, "\t"))
                ps = ", ".join(fmt_param(n, tp) for n, tp in m.params)
                body.append(f"\tpublic function new({ps}):Void;")
                break
 
        # fields
        for f in self.fields:
            if f.doc: body.append(dox(f.doc, "\t"))
            body.append(f"\tpublic var {ident(f.name)}:{safe(f.typ)};")
 
        # instance methods (grouped for overloads)
        grouped = OrderedDict()
        for m in self.methods:
            if m.name == "new": continue
            grouped.setdefault(m.name, []).append(m)
        for mname, overloads in grouped.items():
            primary = overloads[0]
            for ov in overloads[1:]:
                ps = ", ".join(fmt_param(n, tp) for n, tp in ov.params)
                body.append(f"\t@:overload(function({ps}){ret_str(ov.ret)} {{}})")
            if primary.doc: body.append(dox(primary.doc, "\t"))
            ps = ", ".join(fmt_param(n, tp) for n, tp in primary.params)
            body.append(f"\tpublic function {ident(primary.name)}({ps}){ret_str(primary.ret)};")
 
        # static methods (grouped for overloads)
        sgroup = OrderedDict()
        for m in self.statics:
            sgroup.setdefault(m.name, []).append(m)
        for mname, overloads in sgroup.items():
            primary = overloads[0]
            for ov in overloads[1:]:
                ps = ", ".join(fmt_param(n, tp) for n, tp in ov.params)
                body.append(f"\t@:overload(function({ps}){ret_str(ov.ret)} {{}})")
            if primary.doc: body.append(dox(primary.doc, "\t"))
            ps = ", ".join(fmt_param(n, tp) for n, tp in primary.params)
            body.append(
                f"\tpublic static function {ident(primary.name)}({ps}){ret_str(primary.ret)};")
 
        out.extend(body)
        out.append("}")
        return "\n".join(out)
 
class Enum:
    def __init__(self, name, vals=None, doc=""):
        self.name = name
        self.vals = vals or []
        self.doc  = doc
 
    def hx(self):
        out = []
        if self.doc: out.append(dox(self.doc, ""))
        out.append(f"enum abstract {self.name}(Int) from Int to Int {{")
        for k, v in self.vals:
            out.append(f"\tpublic static inline var {ident(k)} = {v};")
        out.append("}")
        return "\n".join(out)
 
# ── parser ───────────────────────────────────────────────────────────────────
 
def parse(block):
    """Parse one Lua code block → list of Cls | Enum | Method | Const."""
    results      = []
    cur_cls      = None
    cur_enum     = None
    in_enum_body = False
    enum_entries = []
 
    pdoc      = []      # pending doc lines
    params    = []      # pending @param
    ret       = "Void"  # pending @return
    type_hint = None    # pending @type
 
    def flush():
        nonlocal pdoc, params, ret, type_hint
        pdoc = []; params = []; ret = "Void"; type_hint = None
 
    for raw in block.splitlines():
        s = raw.strip()
 
        # blank line
        if not s:
            flush(); continue
 
        # ── annotation / doc comment ──
        if s.startswith("---"):
            rest = s[3:].strip()
 
            m = re.match(r"^@class\s+(\w+)(?:\s*:\s*(\w+))?", rest)
            if m:
                if cur_cls: results.append(cur_cls)
                cur_cls = Cls(m.group(1), m.group(2), "\n".join(pdoc))
                flush(); continue
 
            m = re.match(r"^@enum\s+(\w+)", rest)
            if m:
                cur_enum = Enum(m.group(1), doc="\n".join(pdoc))
                in_enum_body = False; enum_entries = []
                flush(); continue
 
            m = re.match(r"^@field\s+(\w+)\s+(\S+)(?:\s+(.+))?", rest)
            if m:
                if cur_cls:
                    cur_cls.fields.append(
                        Field(m.group(1), cvt(m.group(2)), m.group(3) or ""))
                flush(); continue
 
            m = re.match(r"^@param\s+(\w+)(\?)?\s+(\S+)", rest)
            if m:
                pname    = m.group(1)
                optional = m.group(2) == "?"
                ptype    = cvt(m.group(3))
                entry    = ("?" + pname if optional else pname, ptype)
                params.append(entry)
 
            m = re.match(r"^@return\s+(\S+)", rest)
            if m:
                # only keep first @return (Haxe single return)
                if ret == "Void": ret = cvt(m.group(1))
                continue
 
            m = re.match(r"^@type\s+(\S+)", rest)
            if m:
                type_hint = cvt(m.group(1)); continue
 
            # skip all other @annotations
            if rest.startswith("@"): continue
 
            # plain doc text
            if rest: pdoc.append(rest)
            continue
 
        # ── inside enum body ──
        if in_enum_body:
            if "}" in s:
                in_enum_body = False
                if cur_enum:
                    cur_enum.vals = list(enum_entries)
                    results.append(cur_enum)
                    cur_enum = None
                flush(); continue
            m = re.match(r"^(\w+)\s*=\s*(-?\d+)", s)
            if m: enum_entries.append((m.group(1), m.group(2)))
            flush(); continue
 
        # ── enum table open: LogLevel = { ──
        if cur_enum and not in_enum_body:
            m = re.match(r"^\w+\s*=\s*\{", s)
            if m:
                in_enum_body = True; enum_entries = []
                inner = s[s.index("{") + 1:]
                for em in re.finditer(r"(\w+)\s*=\s*(-?\d+)", inner):
                    enum_entries.append((em.group(1), em.group(2)))
                if "}" in inner:
                    in_enum_body = False
                    cur_enum.vals = list(enum_entries)
                    results.append(cur_enum); cur_enum = None
                flush(); continue
 
        # ── function Class.Method(...) ──
        m = re.match(r"^function\s+(\w+)\.(\w+)\s*\(", s)
        if m:
            cls_name, meth_name = m.group(1), m.group(2)
            mi = Method(meth_name, list(params), ret, "\n".join(pdoc))
            if cur_cls and cur_cls.name == cls_name:
                cur_cls.statics.append(mi)
            else:
                results.append(mi)
            flush(); continue
 
        # ── function Name(...) global ──
        m = re.match(r"^function\s+(\w+)\s*\(", s)
        if m:
            fname = m.group(1)
            doc   = "\n".join(pdoc)
            if cur_cls and fname == cur_cls.name:
                cur_cls.methods.insert(0, Method("new", list(params), cur_cls.name, doc))
            else:
                results.append(Method(fname, list(params), ret, doc))
            flush(); continue
 
        # ── local X = {} → SKIP (LuaLS stub table init) ──
        if re.match(r"^local\s+\w+\s*=\s*\{\}", s):
            flush(); continue
 
        # ── global constant: NAME = value ──
        m = re.match(r"^([A-Za-z_]\w*)\s*=\s*(.+)$", s)
        if m and cur_cls is None and cur_enum is None and not in_enum_body:
            cname = m.group(1)
            cval  = m.group(2).strip().rstrip(",")
            if type_hint:
                ctype = type_hint
            elif re.match(r"^-?\d+$", cval):
                ctype = "Int"
            elif re.match(r"^-?[\d.]+$", cval):
                ctype = "Float"
            elif cval in ("true", "false"):
                ctype = "Bool"
            elif cval.startswith(('"', "'")):
                ctype = "String"
            else:
                ctype = "Dynamic"
            results.append(Const(cname, ctype, cval, "\n".join(pdoc)))
            flush(); continue
 
        # ── anything else (end, multiline func sig, etc.) → skip ──
        flush()
 
    # finalize open items
    if cur_cls:  results.append(cur_cls)
    if cur_enum and cur_enum.vals: results.append(cur_enum)
    return results
 
# ── doc extraction ───────────────────────────────────────────────────────────
 
def extract():
    if not os.path.exists(DOC_FILE):
        sys.exit(f"error: {DOC_FILE} not found")
    raw = open(DOC_FILE, encoding="utf-8").read().splitlines()
    secs, idx, topic, started = [], {}, None, False
    i = 0
    while i < len(raw):
        line = raw[i]; s = line.strip()
        if not started:
            if s == API_START: started = True; topic = "Utility Tools"
            i += 1; continue
        m = re.match(r"^#{2,3}\s+(.+)$", line)
        if m: topic = m.group(1).strip()
        if s == "```lua":
            j = i + 1; buf = []
            while j < len(raw) and raw[j].strip() != "```":
                buf.append(raw[j]); j += 1
            block = textwrap.dedent("\n".join(buf)).rstrip()
            if "---@diagnostic disable" not in block and topic:
                if topic not in idx:
                    idx[topic] = len(secs)
                    secs.append((topic, []))
                secs[idx[topic]][1].append(block)
            i = j
        i += 1
    return secs
 
# ── render ───────────────────────────────────────────────────────────────────
 
def render_globals(items, cls_name):
    methods = [x for x in items if isinstance(x, Method)]
    consts  = [x for x in items if isinstance(x, Const)]
    if not methods and not consts: return ""
 
    grouped = OrderedDict()
    for m in methods:
        grouped.setdefault(m.name, []).append(m)
 
    out = [f"extern class {cls_name} {{", ""]
 
    for c in consts:
        if c.doc: out.append(dox(c.doc, "\t"))
        out.append(f"\tpublic static var {ident(c.name)}:{c.typ};")
        out.append("")
 
    for mname, overloads in grouped.items():
        primary = overloads[0]
        for ov in overloads[1:]:
            ps = ", ".join(fmt_param(n, tp) for n, tp in ov.params)
            out.append(f"\t@:overload(function({ps}){ret_str(ov.ret)} {{}})")
        if primary.doc: out.append(dox(primary.doc, "\t"))
        ps = ", ".join(fmt_param(n, tp) for n, tp in primary.params)
        out.append(
            f"\tpublic static function {ident(primary.name)}({ps}){ret_str(primary.ret)};")
        out.append("")
 
    out.append("}")
    return "\n".join(out)
 
def topic_name(h):
    return "".join(w.capitalize()
                   for w in re.sub(r"[^a-zA-Z0-9]+", " ", h).split())
 
# 所有已知跨文件类型，key=类名，value=所在文件的类名(同名则省略)
# 只要是 KNOWN 里出现的 class 都可能需要 import
def file_header(topic, imports=()):
    lines = [
        "// Auto-generated from WickedEngine ScriptingAPI-Documentation.md",
        f"// Topic: {topic}",
        "// DO NOT EDIT MANUALLY",
        "",
        f"package {PACKAGE};",
        "",
    ]
    for imp in sorted(imports):
        lines.append(f"import {PACKAGE}.{imp};")
    if imports:
        lines.append("")
    return "\n".join(lines)
 
# ── output ───────────────────────────────────────────────────────────────────
 
def generate_split(out_dir):
    os.makedirs(out_dir, exist_ok=True)
 
    # ── Pass 1: 解析所有 topic，建立 类型名 → 文件名 映射 ──────────────────
    all_topics = []
    type_to_file = {}   # "Vector" -> "MathTypes"  (topic_name, not filename)
 
    for topic, blocks in extract():
        all_r = []
        for b in blocks:
            all_r.extend(parse(b))
        fn = topic_name(topic)
        all_topics.append((topic, fn, all_r))
 
        for r in all_r:
            if isinstance(r, Cls):
                type_to_file[r.name] = fn
            elif isinstance(r, Enum):
                type_to_file[r.name] = fn
 
    # ── Pass 2: 生成文件 ────────────────────────────────────────────────────
    tc = te = tg = 0
 
    for topic, fn, all_r in all_topics:
        classes = [r for r in all_r if isinstance(r, Cls)]
        enums   = [r for r in all_r if isinstance(r, Enum)]
        globs   = [r for r in all_r if isinstance(r, (Method, Const))]
        if not classes and not enums and not globs:
            continue
 
        # 收集本文件定义的所有类型名
        local_types = set()
        for r in all_r:
            if isinstance(r, (Cls, Enum)):
                local_types.add(r.name)
 
        # 收集本文件用到的所有类型引用
        def collect_refs(typ):
            if typ and typ not in ("Void","Int","Float","Bool","String","Dynamic"):
                m = re.match(r"^Array<(\w+)>$", typ)
                if m: return {m.group(1)}
                if re.match(r"^\w+$", typ): return {typ}
            return set()
 
        used_types = set()
        for r in all_r:
            if isinstance(r, Cls):
                for f in r.fields:
                    used_types |= collect_refs(f.typ)
                if r.parent:
                    used_types.add(r.parent)
                for m in r.methods + r.statics:
                    used_types |= collect_refs(m.ret)
                    for _, tp in m.params:
                        used_types |= collect_refs(tp)
            elif isinstance(r, Method):
                used_types |= collect_refs(r.ret)
                for _, tp in r.params:
                    used_types |= collect_refs(tp)
 
        # 需要 import 的 = 用到的 - 本文件定义的 - 非引擎类型
        needed_imports = set()
        for typ in used_types:
            if typ in local_types:
                continue                      # 本文件定义，不需要 import
            if typ not in type_to_file:
                continue                      # 不是引擎类型（Haxe 内置等）
            src_file = type_to_file[typ]
            if src_file == fn:
                continue                      # 同文件（理论上已被 local_types 覆盖）
            needed_imports.add(typ)
 
        # 生成 import 行（按所在文件分组排序）
        import_lines = []
        for typ in sorted(needed_imports):
            src_file = type_to_file[typ]
            import_lines.append(f"import {PACKAGE}.{src_file}.{typ};")
 
        # 文件头
        header_lines = [
            "// Auto-generated from WickedEngine ScriptingAPI-Documentation.md",
            f"// Topic: {topic}",
            "// DO NOT EDIT MANUALLY",
            "",
            f"package {PACKAGE};",
            "",
        ]
        if import_lines:
            header_lines.extend(sorted(import_lines))
            header_lines.append("")
 
        parts = ["\n".join(header_lines)]
        for e in enums:   parts.append(e.hx()); parts.append(""); te += 1
        for c in classes: parts.append(c.hx()); parts.append(""); tc += 1
        if globs:
            gname = fn + "Globals"
            g = render_globals(globs, gname)
            if g: parts.append(g); tg += len(globs)
 
        out_fn = fn + ".hx"
        with open(os.path.join(out_dir, out_fn), "w", encoding="utf-8") as f:
            f.write("\n".join(parts))
        print(f"  {out_fn}  ({len(classes)} cls  {len(enums)} enum  {len(globs)} glob)")
 
    print(f"\nTotal: {tc} classes, {te} enums, {tg} globals")
 
 
def generate_single(out_path):
    all_c = []; all_e = []; all_g = []
    for _, blocks in extract():
        for b in blocks:
            for r in parse(b):
                if isinstance(r, Cls):    all_c.append(r)
                elif isinstance(r, Enum): all_e.append(r)
                else:                     all_g.append(r)
 
    parts = [
        "// Auto-generated from WickedEngine ScriptingAPI-Documentation.md",
        "// DO NOT EDIT", "", f"package {PACKAGE};", "",
    ]
    for e in all_e:   parts.append(e.hx()); parts.append("")
    for c in all_c:   parts.append(c.hx()); parts.append("")
    g = render_globals(all_g, "WickedGlobals")
    if g: parts.append(g)
 
    os.makedirs(os.path.dirname(os.path.abspath(out_path)), exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(parts))
    print(f"Done: {out_path}  ({len(all_c)} cls  {len(all_e)} enum  {len(all_g)} glob)")
 
 
def main():
    p = argparse.ArgumentParser(
        description="Generate Haxe extern declarations from WickedEngine Lua API docs")
    p.add_argument("output", nargs="?",
                   help="output dir (default) or .hx file (with --single)")
    p.add_argument("--single", action="store_true",
                   help="write one combined WickedEngine.hx instead of one file per topic")
    a = p.parse_args()
    if a.single:
        generate_single(a.output or os.path.join(HERE, "WickedEngine.hx"))
    else:
        generate_split(a.output or os.path.join(HERE, "haxe_externs"))
 
 
if __name__ == "__main__":
    main()
