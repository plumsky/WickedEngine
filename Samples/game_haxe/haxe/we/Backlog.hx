// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: BackLog
// DO NOT EDIT MANUALLY

package we;

extern class BacklogGlobals {

	/**
	 * Removes all entries from the backlog.
	 */
	public static function backlog_clear():Void;

	/**
	 * Posts a string to the backlog.
	 */
	public static function backlog_post(params:String):Void;

	/**
	 * Sets the font size of the backlog.
	 */
	public static function backlog_fontsize(size:Int):Void;

	/**
	 * Returns whether the backlog is currently active (visible).
	 */
	public static function backlog_isactive():Bool;

	/**
	 * Sets the row spacing of the backlog text.
	 */
	public static function backlog_fontrowspacing(spacing:Int):Void;

	/**
	 * Opens (shows) the backlog console.
	 */
	public static function backlog_open():Void;

	/**
	 * Disables and locks the backlog so the HOME key won't bring it up.
	 */
	public static function backlog_lock():Void;

	/**
	 * Unlocks the backlog so it can be toggled with the HOME key.
	 */
	public static function backlog_unlock():Void;

	/**
	 * Disables Lua code execution from the backlog.
	 */
	public static function backlog_blocklua():Void;

	/**
	 * Re-enables Lua code execution from the backlog.
	 */
	public static function backlog_unblocklua():Void;

	/**
	 * Flushes pending backlog messages immediately.
	 */
	public static function backlog_flush():Void;

	/**
	 * Sets the interval (in milliseconds) at which the backlog auto-flushes
	 * pending messages.
	 */
	public static function backlog_setautoflushinterval(milliseconds:Int):Void;

}