// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Texture
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;

/**
 * Gradient shapes for texturehelper.CreateGradientTexture.
 */
enum abstract GradientType(Int) from Int to Int {
	public static inline var Linear = 0;
	public static inline var Circular = 1;
	public static inline var Angular = 2;
}

/**
 * Modifier flags for texturehelper.CreateGradientTexture (combine with
 * bitwise or).
 */
enum abstract GradientFlags(Int) from Int to Int {
	public static inline var None = 0;
	public static inline var Inverse = 1;
	public static inline var Smoothstep = 1;
	public static inline var PerlinNoise = 1;
	public static inline var R16Unorm = 1;
}

/**
 * A 2D texture image, loaded from file or created procedurally.
 */
extern class WETexture {
}

/**
 * A global utility object for creating textures programmatically. It
 * shares the `Texture` type, so the handles it returns expose the query
 * methods above.
 */
extern class TextureHelper {
	/**
	 * Returns the built-in Wicked Engine logo texture.
	 */
	public static function GetLogo():WETexture;
	/**
	 * Creates a gradient texture from the given parameters.
	 */
	public static function CreateGradientTexture(type_:GradientType, ?width:Int, ?height:Int, ?uv_start:WEVector, ?uv_end:WEVector, ?flags:GradientFlags, ?swizzle:String, ?perlin_scale:Float, ?perlin_seed:Int, ?perlin_octaves:Int, ?perlin_persistence:Float):WETexture;
	/**
	 * Creates a lens distortion normal map (16-bit precision).
	 */
	public static function CreateLensDistortionNormalMap(?width:Int, ?height:Int, ?uv_start:WEVector, ?radius:Float, ?squish:Float, ?blend:Float, ?edge_smoothness:Float):WETexture;
}

extern class TextureGlobals {

	/**
	 * Creates a texture. With a filename, loads the image from file; with no
	 * argument, returns an empty (invalid) texture handle.
	 */
	public static function Texture(?filename:String):WETexture;

	/**
	 * Returns whether the texture contains valid data (was created or loaded
	 * successfully).
	 */
	public static function IsValid():Bool;

	/**
	 * Returns the width of the texture in pixels.
	 */
	public static function GetWidth():Int;

	/**
	 * Returns the height of the texture in pixels.
	 */
	public static function GetHeight():Int;

	/**
	 * Returns the depth of the texture (for 3D/volume textures).
	 */
	public static function GetDepth():Int;

	/**
	 * Returns the number of slices in the texture array.
	 */
	public static function GetArraySize():Int;

	/**
	 * Saves the texture to a file. The extension in the filename selects the
	 * format and must be one of: .JPG, .PNG, .TGA, .BMP, .DDS.
	 */
	public static function Save(filename:String):Void;

	/**
	 * Sets the highest allowed texture asset resolution (only affects DDS
	 * textures that contain mipmaps).
	 */
	public static function SetTextureResolutionLimit(resolution:Int):Void;

	/**
	 * Returns the current texture resolution limit.
	 */
	public static function GetTextureResolutionLimit():Int;

}