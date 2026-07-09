// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Canvas
// DO NOT EDIT MANUALLY

package we;

/**
 * Describes a drawable area.
 */
extern class Canvas {
	/**
	 * Get the canvas pixels per inch (DPI).
	 */
	public static function GetDPI():Float;
	/**
	 * Scaling factor between physical and logical size.
	 */
	public static function GetDPIScaling():Float;
	/**
	 * A custom scaling factor on top of the DPI scaling.
	 */
	public static function GetCustomScaling():Float;
	/**
	 * Sets a custom scaling factor that will be applied on top of DPI scaling.
	 */
	public static function SetCustomScaling(value:Float):Void;
	/**
	 * Get the canvas width in pixels.
	 */
	public static function GetPhysicalWidth():Int;
	/**
	 * Get the canvas height in pixels.
	 */
	public static function GetPhysicalHeight():Int;
	/**
	 * Get the canvas width in dpi scaled units.
	 */
	public static function GetLogicalWidth():Float;
	/**
	 * Get the canvas height in dpi scaled units.
	 */
	public static function GetLogicalHeight():Float;
}

extern class CanvasGlobals {

	/**
	 * Creates a Canvas object. In practice you obtain the active canvas from
	 * the application (e.g. `application:GetCanvas()`) instead of constructing
	 * one.
	 */
	public static function Canvas():Canvas;

}