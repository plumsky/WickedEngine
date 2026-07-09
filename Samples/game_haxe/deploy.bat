@echo off
REM deploy.bat - 编译 Haxe 并自动拷贝 startup.lua 到 exe 目录

echo === Compiling Haxe to Lua ===
haxe build.hxml

if %ERRORLEVEL% neq 0 (
    echo Compilation failed!
    pause
    exit /b %ERRORLEVEL%
)

echo === Copying startup.lua to EXE directory ===
REM 修改为你的 exe 实际路径
set EXE_DIR=D:\projects\WickedEngine\BUILD\x64\Release\Template_Windows
copy /Y out\startup.lua "%EXE_DIR%\startup.lua"
set EXE_DIR=D:\projects\WickedEngine\BUILD\x64\Debug\Template_Windows
copy /Y out\startup.lua "%EXE_DIR%\startup.lua"

echo === Done! startup.lua deployed. ===
pause
