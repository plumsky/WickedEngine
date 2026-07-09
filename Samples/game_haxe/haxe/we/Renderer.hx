// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Renderer
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.Matrix;
import we.MathTypes.WEVector;
import we.PathFinding.PathQuery;
import we.PathFinding.VoxelGrid;
import we.Primitives.Capsule;
import we.Primitives.Sphere;
import we.SceneSystemUsingEntityComponentSystem.Scene;
import we.Texture.WETexture;
import we.Trailrenderer.TrailRenderer;

/**
 * Parameters describing a brush stroke for PaintIntoTexture.
 */
extern class PaintTextureParams {
	/**
	 * Sets the texture that is edited (painted into).
	 */
	public static function SetEditTexture(tex:WETexture):Void;
	/**
	 * Sets the brush texture (the stamp shape/pattern).
	 */
	public static function SetBrushTexture(tex:WETexture):Void;
	/**
	 * Sets the reveal texture (used for reveal-style painting).
	 */
	public static function SetRevealTexture(tex:WETexture):Void;
	/**
	 * Sets the brush color.
	 */
	public static function SetBrushColor(value:WEVector):Void;
	/**
	 * Sets the brush center, in pixels.
	 */
	public static function SetCenterPixel(value:WEVector):Void;
	/**
	 * Sets the brush radius, in pixels.
	 */
	public static function SetBrushRadius(value:Int):Void;
	/**
	 * Sets the brush strength (how much each stroke applies).
	 */
	public static function SetBrushAmount(value:Float):Void;
	/**
	 * Sets the brush edge smoothness.
	 */
	public static function SetBrushSmoothness(value:Float):Void;
	/**
	 * Sets the brush rotation, in radians.
	 */
	public static function SetBrushRotation(value:Float):Void;
	/**
	 * Sets the brush shape.
	 */
	public static function SetBrushShape(value:Int):Void;
}

/**
 * Parameters describing a decal to bake into an object's texture with
 * PaintDecalIntoObjectSpaceTexture.
 */
extern class PaintDecalParams {
	/**
	 * Sets the source texture (the decal image).
	 */
	public static function SetInTexture(tex:WETexture):Void;
	/**
	 * Sets the destination texture (the object's texture).
	 */
	public static function SetOutTexture(tex:WETexture):Void;
	/**
	 * Sets the decal matrix in world space.
	 */
	public static function SetMatrix(mat:Matrix):Void;
	/**
	 * Sets the target object entity; positions and UVs are taken from it.
	 */
	public static function SetObject(entity:Int):Void;
	/**
	 * Adjusts decal fading based on surface slope relative to the decal
	 * projection (default 0: no slope blend).
	 */
	public static function SetSlopeBlendPower(power:Float):Void;
}

extern class RendererGlobals {

	/**
	 * Debug text can be occluded by scene geometry (depth tested).
	 */
	public static var DEBUG_TEXT_DEPTH_TEST:Int;

	/**
	 * Debug text is rotated to always face the camera.
	 */
	public static var DEBUG_TEXT_CAMERA_FACING:Int;

	/**
	 * Debug text keeps a constant screen size regardless of distance.
	 */
	public static var DEBUG_TEXT_CAMERA_SCALING:Int;

	/**
	 * Returns the current game speed multiplier.
	 */
	public static function GetGameSpeed():Float;

	/**
	 * Sets the game speed multiplier (1 = normal speed).
	 */
	public static function SetGameSpeed(speed:Float):Void;

	/**
	 * Deprecated: gamma is no longer supported.
	 */
	public static function SetGamma(value:Float):Void;

	/**
	 * Deprecated: resolution is now handled by window events.
	 */
	public static function SetResolution():Void;

	/**
	 * Enables or disables vertical synchronization.
	 */
	public static function SetVSyncEnabled(enabled:Bool):Void;

	/**
	 * Returns whether the graphics device supports hardware ray tracing.
	 */
	public static function IsRaytracingSupported():Bool;

	/**
	 * Reloads all shaders.
	 */
	public static function ReloadShaders():Void;

	/**
	 * Clears the scene and the associated renderer resources. Clears the
	 * global scene if no scene is given.
	 */
	public static function ClearWorld(?scene:Scene):Void;

	/**
	 * Deprecated: use application.GetCanvas().GetLogicalWidth() instead.
	 */
	public static function GetScreenWidth():Float;

	/**
	 * Deprecated: use application.GetCanvas().GetLogicalHeight() instead.
	 */
	public static function GetScreenHeight():Float;

	/**
	 * Sets the resolution of the 2D (spot and point light) shadow maps.
	 */
	public static function SetShadowProps2D(resolution:Int):Void;

	/**
	 * Sets the resolution of the cubemap (point light) shadow maps.
	 */
	public static function SetShadowPropsCube(resolution:Int):Void;

	/**
	 * Enables or disables the per-object shadow level-of-detail override.
	 */
	public static function SetShadowLODOverrideEnabled(value:Bool):Void;

	/**
	 * Enables or disables occlusion culling.
	 */
	public static function SetOcclusionCullingEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables meshlet occlusion culling.
	 */
	public static function SetMeshletOcclusionCullingEnabled(value:Bool):Void;

	/**
	 * Allows or disallows the use of mesh shaders (if supported).
	 */
	public static function SetMeshShaderAllowed(enabled:Bool):Void;

	/**
	 * Enables or disables temporal anti-aliasing (TAA).
	 */
	public static function SetTemporalAAEnabled(value:Bool):Void;

	/**
	 * Enables or disables ray-traced shadows (requires hardware ray tracing).
	 */
	public static function SetRaytracedShadowsEnabled(value:Bool):Void;

	/**
	 * Enables or disables DDGI (dynamic diffuse global illumination).
	 */
	public static function SetDDGIEnabled(value:Bool):Void;

	/**
	 * Enables or disables capsule shadows.
	 */
	public static function SetCapsuleShadowEnabled(enabled:Bool):Void;

	/**
	 * Sets the capsule shadow fade-out distance.
	 */
	public static function SetCapsuleShadowFade(value:Float):Void;

	/**
	 * Sets the capsule shadow cone angle, in radians.
	 */
	public static function SetCapsuleShadowAngle(value:Float):Void;

	/**
	 * Enables or disables all debug drawing by the renderer.
	 */
	public static function SetDebugDrawEnabled(value:Bool):Void;

	/**
	 * Enables or disables drawing of object bounding boxes.
	 */
	public static function SetDebugBoxesEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of the spatial partition tree.
	 */
	public static function SetDebugPartitionTreeEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of armature bones.
	 */
	public static function SetDebugBonesEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of particle emitters.
	 */
	public static function SetDebugEmittersEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of environment probes.
	 */
	public static function SetDebugEnvProbesEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of force fields.
	 */
	public static function SetDebugForceFieldsEnabled(enabled:Bool):Void;

	/**
	 * Enables or disables drawing of cameras.
	 */
	public static function SetDebugCamerasEnabled(value:Bool):Void;

	/**
	 * Enables or disables drawing of colliders.
	 */
	public static function SetDebugCollidersEnabled(value:Bool):Void;

	/**
	 * Enables or disables the light-culling debug visualization.
	 */
	public static function SetDebugLightCulling(enabled:Bool):Void;

	/**
	 * Enables or disables the grid helper overlay.
	 */
	public static function SetGridHelperEnabled(value:Bool):Void;

	/**
	 * Enables or disables the DDGI debug visualization.
	 */
	public static function SetDDGIDebugEnabled(value:Bool):Void;

	/**
	 * Queues a debug line from origin to end_, drawn for the current frame.
	 */
	public static function DrawLine(origin:WEVector, end_:WEVector, ?color:WEVector, ?depth:Bool):Void;

	/**
	 * Queues a debug point, drawn for the current frame.
	 */
	public static function DrawPoint(origin:WEVector, ?size:Float, ?color:WEVector, ?depth:Bool):Void;

	/**
	 * Queues a debug wireframe box transformed by boxMatrix, drawn for the
	 * current frame.
	 */
	public static function DrawBox(boxMatrix:Matrix, ?color:WEVector, ?depth:Bool):Void;

	/**
	 * Queues a debug wireframe sphere, drawn for the current frame.
	 */
	public static function DrawSphere(sphere:Sphere, ?color:WEVector, ?depth:Bool):Void;

	/**
	 * Queues a debug wireframe capsule, drawn for the current frame.
	 */
	public static function DrawCapsule(capsule:Capsule, ?color:WEVector, ?depth:Bool):Void;

	/**
	 * Queues debug text at a world position, drawn for the current frame.
	 * flags is a combination of DEBUG_TEXT_* values.
	 */
	public static function DrawDebugText(text:String, ?position:WEVector, ?color:WEVector, ?scaling:Float, ?flags:Int):Void;

	/**
	 * Draws the voxel grid in the debug rendering phase. The VoxelGrid object
	 * must not be destroyed until then.
	 */
	public static function DrawVoxelGrid(voxelgrid:VoxelGrid):Void;

	/**
	 * Draws the path query in the debug rendering phase. The PathQuery object
	 * must not be destroyed until then.
	 */
	public static function DrawPathQuery(pathquery:PathQuery):Void;

	/**
	 * Draws the trail in the debug rendering phase. The TrailRenderer object
	 * must not be destroyed until then.
	 */
	public static function DrawTrail(trail:TrailRenderer):Void;

	/**
	 * Paints a brush stroke into a texture using the given PaintTextureParams.
	 */
	public static function PaintIntoTexture(params:PaintTextureParams):Void;

	/**
	 * Creates a texture that can be used as the destination of
	 * PaintIntoTexture.
	 */
	public static function CreatePaintableTexture(width:Int, height:Int, ?mips:Int, ?initialColor:WEVector):WETexture;

	/**
	 * Paints into a texture using an object's UV mapping, projecting a texture
	 * by a decal matrix (a way to bake skinned decals at runtime).
	 */
	public static function PaintDecalIntoObjectSpaceTexture(params:PaintDecalParams):Void;

	/**
	 * Puts down a water ripple using the default embedded asset.
	 */
	public static function PutWaterRipple(position:WEVector):Void;

	/**
	 * Creates a PaintTextureParams object.
	 */
	public static function PaintTextureParams():PaintTextureParams;

	/**
	 * Creates a PaintDecalParams object.
	 */
	public static function PaintDecalParams():PaintDecalParams;

}