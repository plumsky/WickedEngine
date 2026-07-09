// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: High Level Interface
// DO NOT EDIT MANUALLY

package we;

import we.Canvas.Canvas;
import we.MathTypes.Matrix;
import we.SceneSystemUsingEntityComponentSystem.Scene;
import we.SpritesAndFonts.Sprite;
import we.SpritesAndFonts.SpriteFont;
import we.Texture.WETexture;
import we.Video.VideoInstance;

/**
 * Fade transition styles used when switching render paths (see
 * Application.SetActivePath and Application.Fade).
 */
enum abstract FadeType(Int) from Int to Int {
	public static inline var FadeToColor = 0;
	public static inline var CrossFade = 1;
}

/**
 * Quality presets for AMD FidelityFX Super Resolution 2 (FSR2) temporal
 * upscaling.
 */
enum abstract FSR2_Preset(Int) from Int to Int {
	public static inline var Quality = 0;
	public static inline var Balanced = 1;
	public static inline var Performance = 2;
	public static inline var Ultra_Performance = 3;
	public static inline var Reinhard = 0;
	public static inline var ACES = 1;
}

/**
 * Tone mapping operator used for HDR to LDR conversion.
 */
enum abstract Tonemap(Int) from Int to Int {
	public static inline var Reinhard = 0;
	public static inline var ACES = 1;
}

/**
 * Controls how a fullscreen background image is fitted to the screen.
 */
enum abstract BackgroundMode(Int) from Int to Int {
	public static inline var Fill = 0;
	public static inline var Fit = 1;
	public static inline var Stretch = 2;
}

/**
 * This is the main entry point and manages the lifetime of the
 * application.
 */
extern class Application {
	/**
	 * Returns the active render path. The concrete type depends on what is
	 * currently active (a 3D path, a loading screen, etc.).
	 */
	public static function GetActivePath():Dynamic;
	/**
	 * Sets the active render path.
	 */
	public static function SetActivePath(path:RenderPath, ?fadeSeconds:Float, ?fadeColorR:Int, ?fadeColorG:Int, ?fadeColorB:Int, ?fadetype:FadeType):Void;
	/**
	 * Enable/disable frame skipping in fixed update.
	 */
	public static function SetFrameSkip(enabled:Bool):Void;
	/**
	 * Switch to fullscreen/windowed.
	 */
	public static function SetFullScreen(value:Bool):Void;
	/**
	 * Set target frame rate for fixed update and variable rate update when
	 * frame rate is locked.
	 */
	public static function SetTargetFrameRate(fps:Float):Void;
	/**
	 * If enabled, variable rate update will use a fixed delta time.
	 */
	public static function SetFrameRateLock(enabled:Bool):Void;
	/**
	 * If enabled, information display will be visible in the top left corner
	 * of the application.
	 */
	public static function SetInfoDisplay(active:Bool):Void;
	/**
	 * Toggle display of engine watermark, version number, etc. if info display
	 * is enabled.
	 */
	public static function SetWatermarkDisplay(active:Bool):Void;
	/**
	 * Toggle display of frame rate if info display is enabled.
	 */
	public static function SetFPSDisplay(active:Bool):Void;
	/**
	 * Toggle display of resolution if info display is enabled.
	 */
	public static function SetResolutionDisplay(active:Bool):Void;
	/**
	 * Toggle display of logical size of canvas if info display is enabled.
	 */
	public static function SetLogicalSizeDisplay(active:Bool):Void;
	/**
	 * Toggle display of output color space if info display is enabled.
	 */
	public static function SetColorSpaceDisplay(active:Bool):Void;
	/**
	 * Toggle display of active graphics pipeline count if info display is
	 * enabled.
	 */
	public static function SetPipelineCountDisplay(active:Bool):Void;
	/**
	 * Toggle display of heap allocation statistics if info display is enabled.
	 */
	public static function SetHeapAllocationCountDisplay(active:Bool):Void;
	/**
	 * Toggle display of video memory usage if info display is enabled.
	 */
	public static function SetVRAMUsageDisplay(active:Bool):Void;
	/**
	 * Toggle color grading helper display in the top left corner.
	 */
	public static function SetColorGradingHelper(value:Bool):Void;
	/**
	 * Returns whether HDR display output is supported on the current monitor.
	 */
	public static function IsHDRSupported():Bool;
	/**
	 * Sets HDR display mode (if monitor supports it).
	 */
	public static function SetHDR(bool:Bool):Void;
	/**
	 * Returns a copy of the application's current canvas.
	 */
	public static function GetCanvas():Canvas;
	/**
	 * Applies the specified canvas to the application.
	 */
	public static function SetCanvas(canvas:Canvas):Void;
	/**
	 * Closes the program.
	 */
	public static function Exit():Void;
	/**
	 * Returns true when fadeout is full (fadeout can be set when switching
	 * paths with SetActivePath()).
	 */
	public static function IsFaded():Void;
	/**
	 * Starts a fade transition over fadeSeconds to the given RGB color (each
	 * channel 0-255), using the given FadeType.
	 */
	public static function Fade(fadeSeconds:Float, ?fadeColorR:Int, fadeColorG:Int, fadeColorB:Int, fadetype:FadeType):Void;
	/**
	 * Starts a cross-fade transition over the given number of seconds,
	 * blending from the previous frame.
	 */
	public static function CrossFade(fadeSeconds:Float):Void;
}

/**
 * A RenderPath is a high level system that represents a part of the whole
 * application. It is responsible to handle high level rendering and logic
 * flow. A render path can be for example a loading screen, a menu screen,
 * or primary game screen, etc.
 */
extern class RenderPath {
	/**
	 * Returns the layer mask.
	 */
	public static function GetLayerMask():Int;
	/**
	 * Sets the layer mask.
	 */
	public static function SetLayerMask(mask:Int):Void;
}

/**
 * A 2D render path that holds Sprites and SpriteFonts, sorts them by
 * layer, and updates and renders them.
 */
extern class RenderPath2D extends RenderPath {
	/**
	 * Adds sprite.
	 */
	public static function AddSprite(sprite:Sprite, ?layer:String):Void;
	/**
	 * Adds video sprite.
	 */
	public static function AddVideoSprite(videoinstance:VideoInstance, sprite:Sprite, ?layer:String):Void;
	/**
	 * Adds font.
	 */
	public static function AddFont(font:SpriteFont, ?layer:String):Void;
	/**
	 * Removes font.
	 */
	public static function RemoveFont(font:SpriteFont):Void;
	/**
	 * Clear Sprites.
	 */
	public static function ClearSprites():Void;
	/**
	 * Clear Fonts.
	 */
	public static function ClearFonts():Void;
	/**
	 * Returns the sprite order.
	 */
	public static function GetSpriteOrder(sprite:Sprite):Int;
	/**
	 * Returns the font order.
	 */
	public static function GetFontOrder(font:SpriteFont):Int;
	/**
	 * Adds layer.
	 */
	public static function AddLayer(name:String):Void;
	/**
	 * Returns the layers.
	 */
	public static function GetLayers():Dynamic;
	/**
	 * Sets the layer order.
	 */
	public static function SetLayerOrder(name:String, order:Int):Void;
	/**
	 * Sets the sprite order.
	 */
	public static function SetSpriteOrder(sprite:Sprite, order:Int):Void;
	/**
	 * Sets the font order.
	 */
	public static function SetFontOrder(font:SpriteFont, order:Int):Void;
	/**
	 * Returns HDR scaling value used for SDR to HDR linear output mapping
	 * conversion (default: 9.0).
	 */
	public static function GetHDRScaling():Float;
	/**
	 * Sets HDR scaling value used for SDR to HDR linear output mapping
	 * conversion (default: 9.0).
	 */
	public static function SetHDRScaling(value:Float):Void;
	/**
	 * Copies everything from other renderpath into this.
	 */
	public static function CopyFrom(other:RenderPath):Void;
	/**
	 * Removes a sprite from the render path (or all sprites if none given).
	 */
	public static function RemoveSprite(?sprite:Sprite):Void;
}

/**
 * The default scene render path.
 * It inherits functions from RenderPath2D, so it can render a 2D overlay.
 */
extern class RenderPath3D extends RenderPath2D {
	/**
	 * Scale internal rendering resolution. This can provide major performance
	 * improvement when GPU rendering speed is the bottleneck.
	 */
	public static function SetResolutionScale(value:Float):Void;
	/**
	 * Sets up the ambient occlusion effect (possible values below).
	 */
	public static function SetAO(value:Int):Void;
	/**
	 * Applies AO power value if any AO is enabled.
	 */
	public static function SetAOPower(value:Float):Void;
	/**
	 * Sets max range for ray traced AO.
	 */
	public static function SetAORange(value:Float):Void;
	/**
	 * Enables or disables screen-space reflections (SSR).
	 */
	public static function SetSSREnabled(value:Bool):Void;
	/**
	 * Enables or disables screen-space global illumination (SSGI).
	 */
	public static function SetSSGIEnabled(value:Bool):Void;
	/**
	 * Enables or disables ray-traced diffuse global illumination (requires
	 * hardware ray tracing).
	 */
	public static function SetRaytracedDiffuseEnabled(value:Bool):Void;
	/**
	 * Enables or disables ray-traced reflections (requires hardware ray
	 * tracing).
	 */
	public static function SetRaytracedReflectionsEnabled(value:Bool):Void;
	/**
	 * Enables or disables shadow rendering for the scene.
	 */
	public static function SetShadowsEnabled(value:Bool):Void;
	/**
	 * Enables or disables planar and environment reflections.
	 */
	public static function SetReflectionsEnabled(value:Bool):Void;
	/**
	 * Controls the planar reflection render resolution and multisampling anti
	 * aliasing. msaaSampleCount must be a value from these: 1,2,4,8
	 */
	public static function SetPlanarReflectionQuality(resolutionScale:Float, msaaSampleCount:Int):Void;
	/**
	 * Enables or disables FXAA (fast approximate anti-aliasing).
	 */
	public static function SetFXAAEnabled(value:Bool):Void;
	/**
	 * Enables or disables the bloom post-process effect.
	 */
	public static function SetBloomEnabled(value:Bool):Void;
	/**
	 * Sets the bloom threshold.
	 */
	public static function SetBloomThreshold(value:Float):Void;
	/**
	 * Enables or disables color grading.
	 */
	public static function SetColorGradingEnabled(value:Bool):Void;
	/**
	 * Enables or disables volume lights.
	 */
	public static function SetVolumeLightsEnabled(value:Bool):Void;
	/**
	 * Enables or disables light shafts.
	 */
	public static function SetLightShaftsEnabled(value:Bool):Void;
	/**
	 * Enables or disables lens flare.
	 */
	public static function SetLensFlareEnabled(value:Bool):Void;
	/**
	 * Enables or disables motion blur.
	 */
	public static function SetMotionBlurEnabled(value:Bool):Void;
	/**
	 * Sets the motion blur strength.
	 */
	public static function SetMotionBlurStrength(value:Float):Void;
	/**
	 * Enables or disables dither.
	 */
	public static function SetDitherEnabled(value:Bool):Void;
	/**
	 * Enables or disables depth of field.
	 */
	public static function SetDepthOfFieldEnabled(value:Bool):Void;
	/**
	 * Sets the depth of field strength.
	 */
	public static function SetDepthOfFieldStrength(value:Float):Void;
	/**
	 * Sets the light shafts strength.
	 */
	public static function SetLightShaftsStrength(value:Float):Void;
	/**
	 * Sets the msaasample count.
	 */
	public static function SetMSAASampleCount(count:Int):Void;
	/**
	 * Enables or disables crtfilter.
	 */
	public static function SetCRTFilterEnabled(value:Bool):Void;
	/**
	 * Enables or disables sharpen filter.
	 */
	public static function SetSharpenFilterEnabled(value:Bool):Void;
	/**
	 * Sets the sharpen filter amount.
	 */
	public static function SetSharpenFilterAmount(value:Float):Void;
	/**
	 * Enables or disables eye adaption.
	 */
	public static function SetEyeAdaptionEnabled(value:Bool):Void;
	/**
	 * Sets the exposure.
	 */
	public static function SetExposure(value:Float):Void;
	/**
	 * Sets the hdrcalibration.
	 */
	public static function SetHDRCalibration(value:Float):Void;
	/**
	 * Enables or disables outline.
	 */
	public static function SetOutlineEnabled(value:Bool):Void;
	/**
	 * Sets the outline threshold.
	 */
	public static function SetOutlineThreshold(value:Float):Void;
	/**
	 * Sets the outline thickness.
	 */
	public static function SetOutlineThickness(value:Float):Void;
	/**
	 * Sets the outline color.
	 */
	public static function SetOutlineColor(r:Float, g:Float, b:Float, a:Float):Void;
	/**
	 * FSR 1.0 on/off.
	 */
	public static function SetFSREnabled(value:Bool):Void;
	/**
	 * FSR 1.0 sharpness 0: sharpest, 2: least sharp.
	 */
	public static function SetFSRSharpness(value:Float):Void;
	/**
	 * FSR 2.1 on/off.
	 */
	public static function SetFSR2Enabled(value:Bool):Void;
	/**
	 * FSR 2.1 sharpness 0: least sharp, 1: sharpest (this is different to FSR
	 * 1.0).
	 */
	public static function SetFSR2Sharpness(value:Float):Void;
	/**
	 * FSR 2.1 preset will modify resolution scaling and sampler LOD bias.
	 */
	public static function SetFSR2Preset(value:FSR2_Preset):Void;
	/**
	 * Set a tonemap type.
	 */
	public static function SetTonemap(value:Tonemap):Void;
	/**
	 * Enable visibility rendering mode, this renders the scene in compute
	 * shader instead of forward rendering. This can have performance
	 * improvement when triangle density on screen is very high.
	 */
	public static function SetVisibilityComputeShadingEnabled(value:Bool):Void;
	/**
	 * Sets cropping from left of the screen in logical units.
	 */
	public static function SetCropLeft(value:Float):Void;
	/**
	 * Sets cropping from top of the screen in logical units.
	 */
	public static function SetCropTop(value:Float):Void;
	/**
	 * Sets cropping from right of the screen in logical units.
	 */
	public static function SetCropRight(value:Float):Void;
	/**
	 * Sets cropping from bottom of the screen in logical units.
	 */
	public static function SetCropBottom(value:Float):Void;
	/**
	 * returns the last post process render texture.
	 */
	public static function GetLastPostProcessRT():WETexture;
	/**
	 * Set a normal map texture as full screen distortion mask.
	 */
	public static function SetDistortionOverlay(texture:WETexture):Void;
	/**
	 * Enables or disables chromatic aberration.
	 */
	public static function SetChromaticAberrationEnabled(value:Bool):Void;
	/**
	 * Sets the chromatic aberration amount.
	 */
	public static function SetChromaticAberrationAmount(value:Float):Void;
	/**
	 * Sets the eye adaption rate.
	 */
	public static function SetEyeAdaptionRate(value:Float):Void;
	/**
	 * Sets the eye adaption key.
	 */
	public static function SetEyeAdaptionKey(value:Float):Void;
	/**
	 * Sets the contrast.
	 */
	public static function SetContrast(value:Float):Void;
	/**
	 * Sets the saturation.
	 */
	public static function SetSaturation(value:Float):Void;
	/**
	 * Sets the brightness.
	 */
	public static function SetBrightness(value:Float):Void;
	/**
	 * Sets the light shafts fade speed.
	 */
	public static function SetLightShaftsFadeSpeed(value:Float):Void;
	/**
	 * Enables or disables mesh blend.
	 */
	public static function SetMeshBlendEnabled(value:Bool):Void;
	/**
	 * Enables or disables occlusion culling.
	 */
	public static function SetOcclusionCullingEnabled(value:Bool):Void;
	/**
	 * Sets the ssgidepth rejection.
	 */
	public static function SetSSGIDepthRejection(value:Float):Void;
}

/**
 * A RenderPath2D but one that internally manages resource loading and can
 * display information about the process. It inherits functions from
 * RenderPath2D.
 */
extern class LoadingScreen extends RenderPath2D {
	@:overload(function(scene:Scene, fileName:String, ?matrix:Matrix):Int {})
	/**
	 * Adds a scene loading task into the global scene and returns the root
	 * entity handle immediately. The loading task will be started
	 * asynchronously when the LoadingScreen is activated by the Application.
	 */
	public static function AddLoadModelTask(fileName:String, ?matrix:Matrix):Int;
	/**
	 * Loads resources of a RenderPath and activates it after all loading tasks
	 * have finished.
	 */
	public static function AddRenderPathActivationTask(path:RenderPath, app:Application, ?fadeSeconds:Float, ?fadeR:Int, ?fadeG:Int, ?fadeB:Int, ?fadetype:FadeType):Void;
	/**
	 * Returns true when all loading tasks have finished and loading screen is
	 * stopped (eg. application swapped it out).
	 */
	public static function IsFinished():Bool;
	/**
	 * Returns percentage of loading complete (0% - 100%). When all loading
	 * tasks are finished or there are no tasks, it returns 100.
	 */
	public static function GetProgress():Int;
	/**
	 * Set a full screen background texture that wil be displayed when loading
	 * screen is active.
	 */
	public static function SetBackgroundTexture(tex:WETexture):Void;
	/**
	 * Returns the background texture.
	 */
	public static function GetBackgroundTexture():WETexture;
	/**
	 * Sets the alignment of the background image.
	 */
	public static function SetBackgroundMode(mode:BackgroundMode):Void;
	/**
	 * Returns the background mode.
	 */
	public static function GetBackgroundMode():Int;
}

extern class HighLevelInterfaceGlobals {

	/**
	 * Creates an Application object. In practice you use the global
	 * `application` rather than constructing one.
	 */
	public static function Application():Application;

	/**
	 * Enable/disable the on-screen profiler.
	 */
	public static function SetProfilerEnabled(enabled:Bool):Void;

	/**
	 * Toggle the on-screen profiler (this function is made for convenience to
	 * write faster).
	 */
	public static function prof():Void;

	/**
	 * Closes the application.
	 */
	public static function exit():Void;

	/**
	 * Creates a base RenderPath. A RenderPath represents a high-level part of
	 * the application (menu, loading screen, gameplay screen, etc.).
	 */
	public static function RenderPath():RenderPath;

	/**
	 * Creates a 2D render path for drawing sprites and fonts.
	 */
	public static function RenderPath2D():RenderPath2D;

	/**
	 * Creates a 3D scene render path. It inherits the 2D features, so it can
	 * also draw a 2D overlay.
	 */
	public static function RenderPath3D():RenderPath3D;

	/**
	 * Creates a LoadingScreen render path that loads resources in the
	 * background and can display loading progress.
	 */
	public static function LoadingScreen():LoadingScreen;

}