package;
 
import we.UtilityTools.UtilityToolsGlobals;
import we.Backlog.BacklogGlobals;
import we.SceneSystemUsingEntityComponentSystem.SceneSystemUsingEntityComponentSystemGlobals;
 
class Main {
 
    public static function main():Void {
 
        // 获取全局 Scene
        var scene = SceneSystemUsingEntityComponentSystemGlobals.GetScene();
 
        // 加载模型
        SceneSystemUsingEntityComponentSystemGlobals.LoadModel("assets/model.wiscene");
 
        // 打印到控制台
        BacklogGlobals.backlog_post("Hello from Haxe!");
 
        // 主循环
        UtilityToolsGlobals.runProcess(loop);
    }
 
    static function loop():Void {
        while (true) {
            UtilityToolsGlobals.update();
            BacklogGlobals.backlog_post("tick");
        }
    }
}
