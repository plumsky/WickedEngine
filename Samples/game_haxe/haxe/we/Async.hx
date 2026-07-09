// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Async
// DO NOT EDIT MANUALLY

package we;

/**
 * The Async object can be used for tracking or waiting for completion of
 * functions running on background threads.
 */
extern class Async {
	/**
	 * Wait for completion of async tasks on this tracker.
	 */
	public static function Wait():Void;
	/**
	 * Checks if all async tasks on this tracker have been completed.
	 */
	public static function IsCompleted():Bool;
}

extern class AsyncGlobals {

	/**
	 * Constructs a new Async tracker object.
	 */
	public static function Async():Async;

}