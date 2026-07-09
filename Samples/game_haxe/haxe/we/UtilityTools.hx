// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Utility Tools
// DO NOT EDIT MANUALLY

package we;

/**
 * Severity levels for backlog/console log messages.
 */
enum abstract LogLevel(Int) from Int to Int {
	public static inline var None = 0;
	public static inline var Default = 1;
	public static inline var Warning = 2;
	public static inline var Error = 3;
	public static inline var Success = 4;
}

extern class UtilityToolsGlobals {

	/**
	 * Send a signal globally. This can wake up processes if there are any
	 * waiting on the same signal name.
	 */
	public static function signal(name:String):Void;

	/**
	 * Wait until a specified signal arrives.
	 */
	public static function waitSignal(name:String):Void;

	/**
	 * Start a new process.
	 */
	public static function runProcess(func:Dynamic):Bool;

	/**
	 * Stop and remove all processes.
	 */
	public static function killProcesses():Void;

	/**
	 * Stop and remove a single process, identified by its coroutine.
	 */
	public static function killProcess(co:Dynamic):Void;

	/**
	 * Stop and remove all processes started from the given script PID.
	 */
	public static function killProcessPID(pid:Int):Void;

	/**
	 * Stop and remove all processes started from the given script file.
	 */
	public static function killProcessFile(file:String):Void;

	/**
	 * Wait until some time has passed (to be used from inside a process).
	 */
	public static function waitSeconds(seconds:Float):Void;

	/**
	 * Get reflection data from object.
	 */
	public static function getprops(object:Dynamic):Void;

	/**
	 * Get the length of a table.
	 */
	public static function len(object:Dynamic):Int;

	/**
	 * Post table contents to the backlog.
	 */
	public static function backlog_post_list(list:Dynamic):Void;

	/**
	 * Modifies the logging level.
	 */
	public static function backlog_setlevel(level:LogLevel):Void;

	/**
	 * Wait for a fixed update step to be called (to be used from inside a
	 * process).
	 */
	public static function fixedupdate():Void;

	/**
	 * Wait for variable update step to be called (to be used from inside a
	 * process).
	 */
	public static function update():Void;

	/**
	 * Wait for a render step to be called (to be used from inside a process).
	 */
	public static function render():Void;

	/**
	 * Returns the delta time in seconds (time passed since previous update()).
	 */
	public static function getDeltaTime():Float;

	/**
	 * Linear interpolation.
	 */
	public static function lerp(a:Float, b:Float, t:Float):Float;

	/**
	 * Inverse linear interpolation.
	 */
	public static function inverse_lerp(a:Float, b:Float, t:Float):Float;

	/**
	 * Inverse linear interpolation.
	 */
	public static function inverselerp(a:Float, b:Float, t:Float):Float;

	/**
	 * Clamp x between min and max.
	 */
	public static function clamp(x:Float, min:Float, max:Float):Float;

	/**
	 * Clamp x between 0 and 1.
	 */
	public static function saturate(x:Float):Float;

	/**
	 * Round x to nearest integer.
	 */
	public static function round(x:Float):Float;

	/**
	 * Executes a binary LUA file.
	 */
	public static function dobinaryfile(filename:String):Void;

	/**
	 * Compiles a text LUA file (filename_src) into a binary LUA file
	 * (filename_dst).
	 */
	public static function compilebinaryfile(filename_src:String, dilename_dst:String):Void;

	/**
	 * Returns true if current application is the editor, false otherwise.
	 */
	public static function IsThisEditor():Bool;

	/**
	 * Returns control to the editor and kills running scripts.
	 */
	public static function ReturnToEditor():Void;

	/**
	 * Returns true if this is a debug build, false otherwise.
	 */
	public static function IsThisDebugBuild():Bool;

	/**
	 * Returns whether platform windows.
	 */
	public static function IsPlatformWindows():Bool;

	/**
	 * Returns whether platform linux.
	 */
	public static function IsPlatformLinux():Bool;

	/**
	 * Returns whether platform macos.
	 */
	public static function IsPlatformMACOS():Bool;

	/**
	 * Returns whether platform ios.
	 */
	public static function IsPlatformIOS():Bool;

	/**
	 * Returns whether platform ps5.
	 */
	public static function IsPlatformPS5():Bool;

	/**
	 * Returns whether platform xbox.
	 */
	public static function IsPlatformXBOX():Bool;

	/**
	 * Returns whether a file exists at the given path.
	 */
	public static function FileExists(name:String):Bool;

	/**
	 * Returns whether a directory exists at the given path.
	 */
	public static function DirectoryExists(name:String):Bool;

	/**
	 * Creates a directory at the given path (including parent directories).
	 */
	public static function DirectoryCreate(name:String):Void;

	/**
	 * Returns a path that files can be safely saved to on every platform. This
	 * is the base directory for such a path; files should be saved into an
	 * application-specific named folder within it.
	 */
	public static function GetSaveDataPath():String;

	/**
	 * Returns the engine major version number.
	 */
	public static function GetVersionMajor():Int;

	/**
	 * Returns the engine minor version number.
	 */
	public static function GetVersionMinor():Int;

	/**
	 * Returns the engine revision version number.
	 */
	public static function GetVersionRevision():Int;

	/**
	 * Returns the full engine version string.
	 */
	public static function GetVersionString():String;

	/**
	 * Returns the engine credits text.
	 */
	public static function GetCreditsString():String;

	/**
	 * Returns the engine supporters text.
	 */
	public static function GetSupportersString():String;

	/**
	 * Returns the file path of the currently running script
	 * (empty string if not available).
	 */
	public static function script_file():String;

	/**
	 * Returns the directory of the currently running script
	 * (empty string if not available).
	 */
	public static function script_dir():String;

	/**
	 * Returns the process id (PID) of the currently running script
	 * (0 if not available).
	 */
	public static function script_pid():Int;

}