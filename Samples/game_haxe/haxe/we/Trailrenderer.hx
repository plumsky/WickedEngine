// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: TrailRenderer
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;
import we.Texture.WETexture;

/**
 * Renders a smooth ribbon trail through a series of points, e.g. for
 * projectiles or weapon swipes.
 */
extern class TrailRenderer {
	/**
	 * Adds a new point to the trail. Note: if rotation is not specified, then
	 * point will be camera facing, otherwise UP direction will be rotated.
	 */
	public static function AddPoint(pos:WEVector, ?width:Float, ?color:WEVector, ?rotationQuaternion:WEVector):Void;
	/**
	 * Cuts the trail at last point and starts a new trail. You can specify
	 * that this cut will create a loop of the previously added points.
	 */
	public static function Cut(?loop:Bool):Void;
	/**
	 * Applies fade for the whole trail continuously, and removes segments that
	 * can be removed due to faded.
	 */
	public static function Fade(amount:Float):Void;
	/**
	 * Removes all points and cuts from the trail.
	 */
	public static function Clear():Void;
	/**
	 * Returns the number of points in the trail.
	 */
	public static function GetPointCount():Int;
	/**
	 * Returns the position, width and color of the trail point at the given
	 * index.
	 */
	public static function GetPoint(index:Int):WEVector;
	/**
	 * Sets the point parameters on the specified index.
	 */
	public static function SetPoint(pos:WEVector, ?width:Float, ?color:WEVector):Void;
	/**
	 * Set blend mode of the whole trail.
	 */
	public static function SetBlendMode(blendmode:Int):Void;
	/**
	 * Returns the blend mode.
	 */
	public static function GetBlendMode():Int;
	/**
	 * Set the subdivision amount of the whole trail.
	 */
	public static function SetSubdivision(subdiv:Int):Void;
	/**
	 * Returns the subdivision.
	 */
	public static function GetSubdivision():Int;
	/**
	 * Set the width of the whole trail.
	 */
	public static function SetWidth(width:Float):Void;
	/**
	 * Returns the width.
	 */
	public static function GetWidth():Float;
	/**
	 * Set the color of the whole trail.
	 */
	public static function SetColor(color:WEVector):Void;
	/**
	 * Returns the color.
	 */
	public static function GetColor():WEVector;
	/**
	 * Set the texture of the whole trail.
	 */
	public static function SetTexture(tex:WETexture):Void;
	/**
	 * Returns the texture.
	 */
	public static function GetTexture():WETexture;
	/**
	 * Set the texture2 of the whole trail.
	 */
	public static function SetTexture2(tex:WETexture):Void;
	/**
	 * Returns the texture2.
	 */
	public static function GetTexture2():WETexture;
	/**
	 * Set the texture UV tiling multiply-add value of the whole trail.
	 */
	public static function SetTexMulAdd(tex:WETexture):Void;
	/**
	 * Returns the tex mul add.
	 */
	public static function GetTexMulAdd():WETexture;
	/**
	 * Set the texture2 UV tiling multiply-add value of the whole trail.
	 */
	public static function SetTexMulAdd2(tex:WETexture):Void;
	/**
	 * Returns the tex mul add2.
	 */
	public static function GetTexMulAdd2():WETexture;
	/**
	 * Sets the depth soften amount (default = 10).
	 */
	public static function SetDepthSoften(value:Float):Void;
}

extern class TrailrendererGlobals {

	/**
	 * Trail Renderer.
	 */
	public static function TrailRenderer():TrailRenderer;

}