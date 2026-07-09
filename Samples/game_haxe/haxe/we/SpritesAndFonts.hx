// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Sprites and Fonts
// DO NOT EDIT MANUALLY

package we;

import we.Audio.Sound;
import we.Audio.SoundInstance;
import we.MathTypes.WEVector;
import we.Texture.WETexture;

enum abstract ImageGradientType(Int) from Int to Int {
	public static inline var None = 0;
	public static inline var Linear = 1;
	public static inline var LinearReflected = 2;
	public static inline var Circular = 3;
}

/**
 * Render images on the screen.
 */
extern class Sprite {
	public var Params:ImageParams;
	public var Anim:SpriteAnim;
	/**
	 * Sets the rendering parameters (position, size, color, …) for the sprite.
	 */
	public static function SetParams(effects:ImageParams):Void;
	/**
	 * Returns the sprite's rendering parameters.
	 */
	public static function GetParams():ImageParams;
	/**
	 * Sets the animation helper that drives this sprite.
	 */
	public static function SetAnim(anim:SpriteAnim):Void;
	/**
	 * Returns the sprite's animation helper.
	 */
	public static function GetAnim():SpriteAnim;
	/**
	 * Sets the base color texture.
	 */
	public static function SetTexture(texture:WETexture):Void;
	/**
	 * Returns the base color texture.
	 */
	public static function GetTexture():WETexture;
	/**
	 * Sets the mask texture (multiplied with the base color).
	 */
	public static function SetMaskTexture(texture:WETexture):Void;
	/**
	 * Returns the mask texture.
	 */
	public static function GetMaskTexture():WETexture;
	/**
	 * Sets the background texture (used by the background effect).
	 */
	public static function SetBackgroundTexture(texture:WETexture):Void;
	/**
	 * Returns the background texture.
	 */
	public static function GetBackgroundTexture():WETexture;
	/**
	 * Shows or hides the sprite.
	 */
	public static function SetHidden(value:Bool):Void;
	/**
	 * Returns whether the sprite is hidden.
	 */
	public static function IsHidden():Bool;
}

extern class ImageParams {
	public var Pos:WEVector;
	public var Size:WEVector;
	public var Pivot:WEVector;
	public var Color:WEVector;
	public var Opacity:Float;
	public var Fade:Float;
	public var Rotation:Float;
	public var TexOffset:WEVector;
	public var TexOffset2:WEVector;
	/**
	 * Returns the position.
	 */
	public static function GetPos():WEVector;
	/**
	 * Returns the size.
	 */
	public static function GetSize():WEVector;
	/**
	 * Returns the pivot point (rotation/scaling origin, in [0, 1] of the
	 * size).
	 */
	public static function GetPivot():WEVector;
	/**
	 * Returns the color/tint (RGBA).
	 */
	public static function GetColor():WEVector;
	/**
	 * Returns the opacity (alpha multiplier).
	 */
	public static function GetOpacity():Float;
	/**
	 * Returns the saturation.
	 */
	public static function GetSaturation():Float;
	/**
	 * Returns the fade amount (0: visible, 1: faded out).
	 */
	public static function GetFade():Float;
	/**
	 * Returns the rotation in radians.
	 */
	public static function GetRotation():Float;
	/**
	 * Returns the texture UV offset.
	 */
	public static function GetTexOffset():WEVector;
	/**
	 * Returns the secondary texture UV offset.
	 */
	public static function GetTexOffset2():WEVector;
	/**
	 * Returns the border soften amount.
	 */
	public static function GetBorderSoften():Float;
	/**
	 * Returns the draw rectangle (x, y, width, height) in texture pixels.
	 */
	public static function GetDrawRect():WEVector;
	/**
	 * Returns the secondary draw rectangle (x, y, width, height).
	 */
	public static function GetDrawRect2():WEVector;
	/**
	 * Returns whether the draw rectangle is enabled.
	 */
	public static function IsDrawRectEnabled():Bool;
	/**
	 * Returns whether the secondary draw rectangle is enabled.
	 */
	public static function IsDrawRect2Enabled():Bool;
	/**
	 * Returns whether horizontal mirroring is enabled.
	 */
	public static function IsMirrorEnabled():Bool;
	/**
	 * Returns whether the background blur is enabled.
	 */
	public static function IsBackgroundBlurEnabled():Bool;
	/**
	 * Returns whether the background is enabled.
	 */
	public static function IsBackgroundEnabled():Bool;
	/**
	 * Returns whether the distortion mask is enabled.
	 */
	public static function IsDistortionMaskEnabled():Bool;
	/**
	 * Sets the position.
	 */
	public static function SetPos(pos:WEVector):Void;
	/**
	 * Sets the size.
	 */
	public static function SetSize(size:WEVector):Void;
	/**
	 * Sets the pivot point (rotation/scaling origin, in [0, 1] of the size).
	 */
	public static function SetPivot(value:WEVector):Void;
	/**
	 * Sets the color/tint (RGBA).
	 */
	public static function SetColor(value:WEVector):Void;
	/**
	 * Sets the opacity (alpha multiplier).
	 */
	public static function SetOpacity(opacity:Float):Void;
	/**
	 * Sets the saturation.
	 */
	public static function SetSaturation(saturation:Float):Void;
	/**
	 * Sets the fade amount (0: visible, 1: faded out).
	 */
	public static function SetFade(fade:Float):Void;
	/**
	 * Sets the stencil test mode and reference value.
	 */
	public static function SetStencil(stencilMode:Int, stencilRef:Int):Void;
	/**
	 * Sets how the stencil reference value is interpreted.
	 */
	public static function SetStencilRefMode(stencilRefMode:Int):Void;
	/**
	 * Sets the blend mode (one of the BLENDMODE_* constants).
	 */
	public static function SetBlendMode(blendMode:Int):Void;
	/**
	 * Sets the sampling quality (one of the QUALITY_* constants).
	 */
	public static function SetQuality(quality:Int):Void;
	/**
	 * Sets the texture addressing mode (one of the SAMPLEMODE_* constants).
	 */
	public static function SetSampleMode(sampleMode:Int):Void;
	/**
	 * Sets the rotation in radians.
	 */
	public static function SetRotation(rotation:Float):Void;
	/**
	 * Sets the texture UV offset.
	 */
	public static function SetTexOffset(value:WEVector):Void;
	/**
	 * Sets the secondary texture UV offset.
	 */
	public static function SetTexOffset2(value:WEVector):Void;
	/**
	 * Sets the border soften amount.
	 */
	public static function SetBorderSoften(alpha:Float):Void;
	/**
	 * Enables the draw rectangle (x, y, width, height) in texture pixels.
	 */
	public static function EnableDrawRect(value:WEVector):Void;
	/**
	 * Enables the secondary draw rectangle (x, y, width, height).
	 */
	public static function EnableDrawRect2(value:WEVector):Void;
	/**
	 * Disables the draw rectangle.
	 */
	public static function DisableDrawRect():Void;
	/**
	 * Disables the secondary draw rectangle.
	 */
	public static function DisableDrawRect2():Void;
	/**
	 * Enables horizontal mirroring.
	 */
	public static function EnableMirror():Void;
	/**
	 * Disables horizontal mirroring.
	 */
	public static function DisableMirror():Void;
	/**
	 * Enables the background blur effect.
	 */
	public static function EnableBackgroundBlur():Void;
	/**
	 * Disables the background blur effect.
	 */
	public static function DisableBackgroundBlur():Void;
	/**
	 * Enables drawing the background.
	 */
	public static function EnableBackground():Void;
	/**
	 * Disables drawing the background.
	 */
	public static function DisableBackground():Void;
	/**
	 * Enables using the mask texture as a distortion mask.
	 */
	public static function EnableDistortionMask():Void;
	/**
	 * Disables the distortion mask.
	 */
	public static function DisableDistortionMask():Void;
	/**
	 * Sets the alpha range used when masking (start and end thresholds).
	 */
	public static function SetMaskAlphaRange(start:Float, end_:Float):Void;
	/**
	 * Returns the mask alpha range as start, end.
	 */
	public static function GetMaskAlphaRange():Float;
	/**
	 * Sets the direction of the angular softness effect.
	 */
	public static function SetAngularSoftnessDirection(value:WEVector):Void;
	/**
	 * Sets the inner angle of the angular softness effect.
	 */
	public static function SetAngularSoftnessInnerAngle(value:Float):Void;
	/**
	 * Sets the outer angle of the angular softness effect.
	 */
	public static function SetAngularSoftnessOuterAngle(value:Float):Void;
	/**
	 * Enables double-sided angular softness.
	 */
	public static function EnableAngularSoftnessDoubleSided():Void;
	/**
	 * Inverts the angular softness effect.
	 */
	public static function EnableAngularSoftnessInverse():Void;
	/**
	 * Disables double-sided angular softness.
	 */
	public static function DisableAngularSoftnessDoubleSided():Void;
	/**
	 * Disables inverted angular softness.
	 */
	public static function DisableAngularSoftnessInverse():Void;
	/**
	 * Enables rounded corners.
	 */
	public static function EnableCornerRounding():Void;
	/**
	 * Disables rounded corners.
	 */
	public static function DisableCornerRounding():Void;
	/**
	 * Sets the rounding of one corner (0-3) with a radius and segment count.
	 */
	public static function SetCornerRounding(corner:Int, rounding:Float, ?segments:Int):Void;
	/**
	 * Fills the image with a gradient between two UV coordinates.
	 */
	public static function SetGradient(type_:ImageGradientType, uv_start:WEVector, uv_end:WEVector, color:WEVector):Void;
}

/**
 * Animate Sprites easily with this helper.
 */
extern class SpriteAnim {
	public var Rot:Float;
	public var Rotation:Float;
	public var Opacity:Float;
	public var Fade:Float;
	public var Repeatable:Bool;
	public var Velocity:WEVector;
	public var ScaleX:Float;
	public var ScaleY:Float;
	public var MovingTexAnim:MovingTexAnim;
	public var DrawRecAnim:DrawRectAnim;
	/**
	 * Sets the per-second rotation offset used by the wobble effect.
	 */
	public static function SetRot(val:Float):Void;
	/**
	 * Sets the per-second rotation speed.
	 */
	public static function SetRotation(val:Float):Void;
	/**
	 * Sets the per-second opacity change.
	 */
	public static function SetOpacity(val:Float):Void;
	/**
	 * Sets the per-second fade change.
	 */
	public static function SetFade(val:Float):Void;
	/**
	 * Sets the wobble animation amount.
	 */
	public static function SetWobbleAnimAmount(val:Float):Void;
	/**
	 * Sets the wobble animation speed.
	 */
	public static function SetWobbleAnimSpeed(val:Float):Void;
	/**
	 * Sets whether the animation repeats.
	 */
	public static function SetRepeatable(val:Bool):Void;
	/**
	 * Sets the per-second position velocity.
	 */
	public static function SetVelocity(val:WEVector):Void;
	/**
	 * Sets the per-second horizontal scale change.
	 */
	public static function SetScaleX(val:Float):Void;
	/**
	 * Sets the per-second vertical scale change.
	 */
	public static function SetScaleY(val:Float):Void;
	/**
	 * Sets the moving-texture sub-animation.
	 */
	public static function SetMovingTexAnim(val:MovingTexAnim):Void;
	/**
	 * Sets the frame-by-frame draw-rectangle sub-animation.
	 */
	public static function SetDrawRecAnim(val:DrawRectAnim):Void;
	/**
	 * Returns the per-second rotation offset.
	 */
	public static function GetRot():Float;
	/**
	 * Returns the per-second rotation speed.
	 */
	public static function GetRotation():Float;
	/**
	 * Returns the per-second opacity change.
	 */
	public static function GetOpacity():Float;
	/**
	 * Returns the per-second fade change.
	 */
	public static function GetFade():Float;
	/**
	 * Returns whether the animation repeats.
	 */
	public static function GetRepeatable():Bool;
	/**
	 * Returns the per-second position velocity.
	 */
	public static function GetVelocity():WEVector;
	/**
	 * Returns the per-second horizontal scale change.
	 */
	public static function GetScaleX():Float;
	/**
	 * Returns the per-second vertical scale change.
	 */
	public static function GetScaleY():Float;
	/**
	 * Returns the moving-texture sub-animation.
	 */
	public static function GetMovingTexAnim():MovingTexAnim;
	/**
	 * Returns the frame-by-frame draw-rectangle sub-animation.
	 */
	public static function GetDrawRecAnim():DrawRectAnim;
}

/**
 * Scroll a sprite's texture continuously.
 */
extern class MovingTexAnim {
	public var SpeedX:Float;
	public var SpeedY:Float;
	/**
	 * Sets the horizontal scroll speed.
	 */
	public static function SetSpeedX(val:Float):Void;
	/**
	 * Sets the vertical scroll speed.
	 */
	public static function SetSpeedY(val:Float):Void;
	/**
	 * Returns the horizontal scroll speed.
	 */
	public static function GetSpeedX():Float;
	/**
	 * Returns the vertical scroll speed.
	 */
	public static function GetSpeedY():Float;
}

/**
 * Animate a sprite frame by frame from a sprite sheet.
 */
extern class DrawRectAnim {
	public var FrameRate:Float;
	public var FrameCount:Int;
	public var HorizontalFrameCount:Int;
	/**
	 * Sets the playback frame rate (frames per second).
	 */
	public static function SetFrameRate(val:Float):Void;
	/**
	 * Sets the total number of frames.
	 */
	public static function SetFrameCount(val:Int):Void;
	/**
	 * Sets the number of frames per row in the sprite sheet.
	 */
	public static function SetHorizontalFrameCount(val:Int):Void;
	/**
	 * Returns the playback frame rate.
	 */
	public static function GetFrameRate():Float;
	/**
	 * Returns the total number of frames.
	 */
	public static function GetFrameCount():Int;
	/**
	 * Returns the number of frames per row.
	 */
	public static function GetHorizontalFrameCount():Int;
}

/**
 * Render text with a custom font.
 */
extern class SpriteFont {
	public var Text:String;
	public var Size:Int;
	public var Pos:WEVector;
	public var Spacing:WEVector;
	public var Align:Int;
	public var Color:WEVector;
	public var ShadowColor:WEVector;
	public var Bolden:Float;
	public var Softness:Float;
	public var ShadowBolden:Float;
	public var ShadowSoftness:Float;
	public var ShadowOffset:WEVector;
	/**
	 * Sets the font style (typeface) by name, with an optional pixel size.
	 */
	public static function SetStyle(fontstyle:String, ?size:Int):Void;
	/**
	 * Sets the displayed text (empty string if omitted).
	 */
	public static function SetText(?text:String):Void;
	/**
	 * Sets the font size in pixels.
	 */
	public static function SetSize(size:Int):Void;
	/**
	 * Sets an additional uniform scale applied on top of the size.
	 */
	public static function SetScale(scale:Float):Void;
	/**
	 * Sets the screen position.
	 */
	public static function SetPos(pos:WEVector):Void;
	/**
	 * Sets the horizontal and vertical spacing between characters and lines.
	 */
	public static function SetSpacing(spacing:WEVector):Void;
	/**
	 * Sets the horizontal and (optional) vertical alignment.
	 */
	public static function SetAlign(halign:Int, ?valign:Int):Void;
	/**
	 * Sets the text color, as a Vector (RGBA) or a packed hex color code.
	 */
	public static function SetColor(color:WEVector):Void;
	/**
	 * Sets the shadow color, as a Vector (RGBA) or a packed hex color code.
	 */
	public static function SetShadowColor(shadowcolor:WEVector):Void;
	/**
	 * Sets how much the glyphs are bold.
	 */
	public static function SetBolden(value:Float):Void;
	/**
	 * Sets the glyph edge softness.
	 */
	public static function SetSoftness(value:Float):Void;
	/**
	 * Sets how much the shadow glyphs are bold.
	 */
	public static function SetShadowBolden(value:Float):Void;
	/**
	 * Sets the shadow edge softness.
	 */
	public static function SetShadowSoftness(value:Float):Void;
	/**
	 * Sets the shadow offset.
	 */
	public static function SetShadowOffset(value:WEVector):Void;
	/**
	 * Sets the width at which text wraps (<= 0 disables wrapping).
	 */
	public static function SetHorizontalWrapping(value:Float):Void;
	/**
	 * Shows or hides the text.
	 */
	public static function SetHidden(value:Bool):Void;
	/**
	 * Enables flipping the letters horizontally.
	 */
	public static function SetFlippedHorizontally(value:Bool):Void;
	/**
	 * Enables flipping the letters vertically.
	 */
	public static function SetFlippedVertically(value:Bool):Void;
	/**
	 * Returns the displayed text.
	 */
	public static function GetText():String;
	/**
	 * Returns the font size in pixels.
	 */
	public static function GetSize():Int;
	/**
	 * Returns the additional uniform scale.
	 */
	public static function GetScale():Float;
	/**
	 * Returns the screen position.
	 */
	public static function GetPos():WEVector;
	/**
	 * Returns the character and line spacing.
	 */
	public static function GetSpacing():WEVector;
	/**
	 * Returns the horizontal and vertical alignment.
	 */
	public static function GetAlign():Int;
	/**
	 * Returns the text color.
	 */
	public static function GetColor():WEVector;
	/**
	 * Returns the shadow color.
	 */
	public static function GetShadowColor():WEVector;
	/**
	 * Returns how much the glyphs are bold.
	 */
	public static function GetBolden():Float;
	/**
	 * Returns the glyph edge softness.
	 */
	public static function GetSoftness():Float;
	/**
	 * Returns how much the shadow glyphs are bold.
	 */
	public static function GetShadowBolden():Float;
	/**
	 * Returns the shadow edge softness.
	 */
	public static function GetShadowSoftness():Float;
	/**
	 * Returns the shadow offset.
	 */
	public static function GetShadowOffset():WEVector;
	/**
	 * Returns the wrapping width.
	 */
	public static function GetHorizontalWrapping():Float;
	/**
	 * Returns whether the text is hidden.
	 */
	public static function IsHidden():Bool;
	/**
	 * Returns whether the letters are flipped horizontally.
	 */
	public static function IsFlippedHorizontally():Bool;
	/**
	 * Returns whether the letters are flipped vertically.
	 */
	public static function IsFlippedVertically():Bool;
	/**
	 * Returns the rendered text width and height in a Vector's X and Y.
	 */
	public static function TextSize():WEVector;
	/**
	 * Sets the time to fully type the text, in seconds (0 disables
	 * typewriting).
	 */
	public static function SetTypewriterTime(value:Float):Void;
	/**
	 * Sets whether the typewriter animation restarts when finished.
	 */
	public static function SetTypewriterLooped(value:Bool):Void;
	/**
	 * Sets the character index the typewriter animation starts from.
	 */
	public static function SetTypewriterCharacterStart(value:Int):Void;
	/**
	 * Sets a sound effect played as each new letter appears.
	 */
	public static function SetTypewriterSound(sound:Sound, soundinstance:SoundInstance):Void;
	/**
	 * Resets the typewriter animation to the first character.
	 */
	public static function ResetTypewriter():Void;
	/**
	 * Finishes the typewriter animation immediately.
	 */
	public static function TypewriterFinish():Void;
	/**
	 * Returns whether the typewriter animation has finished.
	 */
	public static function IsTypewriterFinished():Bool;
}

extern class SpritesAndFontsGlobals {

	public static var STENCILMODE_DISABLED:Int;

	public static var STENCILMODE_EQUAL:Int;

	public static var STENCILMODE_LESS:Int;

	public static var STENCILMODE_LESSEQUAL:Int;

	public static var STENCILMODE_GREATER:Int;

	public static var STENCILMODE_GREATEREQUAL:Int;

	public static var STENCILMODE_NOT:Int;

	public static var STENCILMODE_ALWAYS:Int;

	public static var STENCILREFMODE_ENGINE:Int;

	public static var STENCILREFMODE_USER:Int;

	public static var STENCILREFMODE_ALL:Int;

	public static var SAMPLEMODE_CLAMP:Int;

	public static var SAMPLEMODE_WRAP:Int;

	public static var SAMPLEMODE_MIRROR:Int;

	public static var QUALITY_NEAREST:Int;

	public static var QUALITY_LINEAR:Int;

	public static var QUALITY_ANISOTROPIC:Int;

	public static var QUALITY_BICUBIC:Int;

	public static var BLENDMODE_OPAQUE:Int;

	public static var BLENDMODE_ALPHA:Int;

	public static var BLENDMODE_PREMULTIPLIED:Int;

	public static var BLENDMODE_ADDITIVE:Int;

	public static var WIFALIGN_LEFT:Int;

	public static var WIFALIGN_CENTER:Int;

	public static var WIFALIGN_RIGHT:Int;

	public static var WIFALIGN_TOP:Int;

	public static var WIFALIGN_BOTTOM:Int;

	/**
	 * Constructs a sprite, optionally from a texture and a mask texture file.
	 */
	public static function Sprite(?texture:String, ?maskTexture:String):Sprite;

	/**
	 * Constructs image parameters. Called with two numbers they are the width
	 * and height (at position 0, 0); called with three or four they are posX,
	 * posY, width and height. Defaults: pos (0, 0), size (100, 100).
	 */
	public static function ImageParams(posX:Float, posY:Float, width:Float, ?height:Float):ImageParams;

	/**
	 * Constructs a sprite animation helper.
	 */
	public static function SpriteAnim():SpriteAnim;

	/**
	 * Constructs a moving-texture animation, optionally with X and Y speeds.
	 */
	public static function MovingTexAnim(?speedX:Float, ?speedY:Float):MovingTexAnim;

	/**
	 * Constructs a frame-by-frame draw-rectangle animation.
	 */
	public static function DrawRectAnim():DrawRectAnim;

	/**
	 * Constructs a sprite font, optionally with initial text.
	 */
	public static function SpriteFont(?text:String):SpriteFont;

}