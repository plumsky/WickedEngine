// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Video
// DO NOT EDIT MANUALLY

package we;

/**
 * A video resource loaded from file.
 */
extern class Video {
	/**
	 * Returns true if the video was successfully created.
	 */
	public static function IsValid():Bool;
	/**
	 * Returns the duration seconds.
	 */
	public static function GetDurationSeconds():Float;
}

/**
 * A playing instance of a Video, with playback controls.
 */
extern class VideoInstance {
	/**
	 * Returns true if the video instance was successfully created.
	 */
	public static function IsValid():Bool;
	/**
	 * Play.
	 */
	public static function Play():Void;
	/**
	 * Pause.
	 */
	public static function Pause():Void;
	/**
	 * Stop.
	 */
	public static function Stop():Void;
	/**
	 * Sets whether playback loops when the video reaches the end.
	 */
	public static function SetLooped(looped:Bool):Void;
	/**
	 * Seek.
	 */
	public static function Seek(timerSeconds:Float):Void;
	/**
	 * Returns current video playback timer for this decoder instance in
	 * seconds.
	 */
	public static function GetCurrentTimer():Float;
	/**
	 * Returns true if the video playback has ended.
	 */
	public static function IsEnded():Bool;
}

extern class VideoGlobals {

	/**
	 * Loads an MP4 video file (currently only the H264 internal compression
	 * format is supported).
	 */
	public static function Video(filename:String):Video;

	/**
	 * Creates a decoder instance for the video data.
	 */
	public static function VideoInstance(video:Video):VideoInstance;

}