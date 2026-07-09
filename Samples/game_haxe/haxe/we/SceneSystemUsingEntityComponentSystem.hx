// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Scene System (using entity-component system)
// DO NOT EDIT MANUALLY

package we;

import we.Async.Async;
import we.Audio.Sound;
import we.Audio.SoundInstance;
import we.Canvas.Canvas;
import we.MathTypes.Matrix;
import we.MathTypes.WEVector;
import we.PathFinding.PathQuery;
import we.PathFinding.VoxelGrid;
import we.Primitives.AABB;
import we.Primitives.Capsule;
import we.Primitives.Ray;
import we.Primitives.Sphere;
import we.SpritesAndFonts.Sprite;
import we.SpritesAndFonts.SpriteFont;
import we.Texture.WETexture;
import we.Video.Video;
import we.Video.VideoInstance;

/**
 * Identifies a texture slot on a MaterialComponent (base color, normal
 * map, surface map, etc.).
 */
enum abstract TextureSlot(Int) from Int to Int {
	public static inline var BASECOLORMAP = 0;
	public static inline var NORMALMAP = 1;
	public static inline var SURFACEMAP = 2;
	public static inline var EMISSIVEMAP = 3;
	public static inline var DISPLACEMENTMAP = 4;
	public static inline var OCCLUSIONMAP = 5;
	public static inline var TRANSMISSIONMAP = 6;
	public static inline var SHEENCOLORMAP = 7;
	public static inline var SHEENROUGHNESSMAP = 8;
	public static inline var CLEARCOATMAP = 9;
	public static inline var CLEARCOATROUGHNESSMAP = 10;
	public static inline var CLEARCOATNORMALMAP = 11;
	public static inline var SPECULARMAP = 12;
	public static inline var ANISOTROPYMAP = 13;
	public static inline var TRANSPARENCYMAP = 14;
}

/**
 * Collision shape of a RigidBodyPhysicsComponent.
 */
enum abstract RigidBodyShape(Int) from Int to Int {
	public static inline var Box = 0;
	public static inline var Sphere = 1;
	public static inline var Capsule = 2;
	public static inline var ConvexHull = 3;
	public static inline var TriangleMesh = 4;
}

/**
 * The shape of a ColliderComponent.
 */
enum abstract ColliderShape(Int) from Int to Int {
	public static inline var Sphere = 0;
	public static inline var Capsule = 1;
	public static inline var Plane = 2;
}

/**
 * Standard facial expression presets (VRM-style) for an
 * ExpressionComponent.
 */
enum abstract ExpressionPreset(Int) from Int to Int {
	public static inline var Happy = 0;
	public static inline var Angry = 1;
	public static inline var Sad = 2;
	public static inline var Relaxed = 3;
	public static inline var Surprised = 4;
	public static inline var Aa = 5;
	public static inline var Ih = 6;
	public static inline var Ou = 7;
	public static inline var Ee = 8;
	public static inline var Oh = 9;
	public static inline var Blink = 10;
	public static inline var BlinkLeft = 11;
	public static inline var BlinkRight = 12;
	public static inline var LookUp = 13;
	public static inline var LookDown = 14;
	public static inline var LookLeft = 15;
	public static inline var LookRight = 16;
	public static inline var Neutral = 17;
	public static inline var None = 0;
	public static inline var Block = 1;
	public static inline var Blend = 2;
}

/**
 * How an ExpressionComponent override blends with procedural animation.
 */
enum abstract ExpressionOverride(Int) from Int to Int {
	public static inline var None = 0;
	public static inline var Block = 1;
	public static inline var Blend = 2;
}

/**
 * Standard humanoid bone identifiers used by HumanoidComponent.
 */
enum abstract HumanoidBone(Int) from Int to Int {
	public static inline var Hips = 0;
	public static inline var Spine = 1;
	public static inline var Chest = 2;
	public static inline var UpperChest = 3;
	public static inline var Neck = 4;
	public static inline var Head = 5;
	public static inline var LeftEye = 6;
	public static inline var RightEye = 7;
	public static inline var Jaw = 8;
	public static inline var LeftUpperLeg = 9;
	public static inline var LeftLowerLeg = 10;
	public static inline var LeftFoot = 11;
	public static inline var LeftToes = 12;
	public static inline var RightUpperLeg = 13;
	public static inline var RightLowerLeg = 14;
	public static inline var RightFoot = 15;
	public static inline var RightToes = 16;
	public static inline var LeftShoulder = 17;
	public static inline var LeftUpperArm = 18;
	public static inline var LeftLowerArm = 19;
	public static inline var LeftHand = 20;
	public static inline var RightShoulder = 21;
	public static inline var RightUpperArm = 22;
	public static inline var RightLowerArm = 23;
	public static inline var RightHand = 24;
	public static inline var LeftThumbMetacarpal = 25;
	public static inline var LeftThumbProximal = 26;
	public static inline var LeftThumbDistal = 27;
	public static inline var LeftIndexProximal = 28;
	public static inline var LeftIndexIntermediate = 29;
	public static inline var LeftIndexDistal = 30;
	public static inline var LeftMiddleProximal = 31;
	public static inline var LeftMiddleIntermediate = 32;
	public static inline var LeftMiddleDistal = 33;
	public static inline var LeftRingProximal = 34;
	public static inline var LeftRingIntermediate = 35;
	public static inline var LeftRingDistal = 36;
	public static inline var LeftLittleProximal = 37;
	public static inline var LeftLittleIntermediate = 38;
	public static inline var LeftLittleDistal = 39;
	public static inline var RightThumbMetacarpal = 40;
	public static inline var RightThumbProximal = 41;
	public static inline var RightThumbDistal = 42;
	public static inline var RightIndexIntermediate = 43;
	public static inline var RightIndexDistal = 44;
	public static inline var RightIndexProximal = 45;
	public static inline var RightMiddleProximal = 46;
	public static inline var RightMiddleIntermediate = 47;
	public static inline var RightMiddleDistal = 48;
	public static inline var RightRingProximal = 49;
	public static inline var RightRingIntermediate = 50;
	public static inline var RightRingDistal = 51;
	public static inline var RightLittleProximal = 52;
	public static inline var RightLittleIntermediate = 53;
	public static inline var RightLittleDistal = 54;
	public static inline var Count = 55;
}

/**
 * Built-in metadata categories used to tag entities (player, enemy,
 * pickup, etc.).
 */
enum abstract MetadataPreset(Int) from Int to Int {
	public static inline var Custom = 0;
	public static inline var Waypoint = 1;
	public static inline var Player = 2;
	public static inline var Enemy = 3;
	public static inline var NPC = 4;
	public static inline var Pickup = 5;
	public static inline var Vehicle = 6;
	public static inline var PointOfInterest = 7;
}

/**
 * The scene holds components. Entity handles can be used to retrieve
 * associated components through the scene.
 */
extern class Scene {
	public var Weather:WeatherComponent;
	/**
	 * Intersects a primitive with the scene and returns collision parameters.
	 * If humanoid_bone is not `HumanoidBone.Count` then the intersection is a
	 * ragdoll, and entity refers to the humanoid entity.
	 */
	public static function Intersects(primitive:Dynamic, ?filterMask:Int, ?layerMask:Int, ?lod:Int):Int;
	/**
	 * Intersects a primitive with the scene and returns true immediately on
	 * intersection, false if there was no intersection. This can be faster for
	 * occlusion check than regular `Intersects` that searches for closest
	 * intersection.
	 */
	public static function IntersectsFirst(primitive:Ray, ?filterMask:Int, ?layerMask:Int, ?lod:Int):Bool;
	/**
	 * Intersects the scene with a primitive and returns array of results. In
	 * case of Ray, RayIntersectionResult will be returned, for Sphere and
	 * Capsule SphereIntersectionResult will be returned.
	 */
	public static function IntersectsAll(primitive:Dynamic, ?filterMask:Int, ?layerMask:Int, ?lod:Int):Dynamic;
	/**
	 * Updates the scene and every entity and component inside the scene.
	 */
	public static function Update():Void;
	/**
	 * Deletes every entity and component inside the scene.
	 */
	public static function Clear():Void;
	/**
	 * Moves contents from an other scene into this one. The other scene will
	 * be empty after this operation (contents are moved, not copied).
	 */
	public static function Merge(other:Scene):Void;
	/**
	 * Updates the full scene hierarchy system. Useful if you modified for
	 * example a parent transform and children immediately need up to date
	 * result in the script.
	 */
	public static function UpdateHierarchy():Void;
	/**
	 * Duplicates everything in the prefab scene into the current scene. If
	 * attached parameter is set to `true` then everything in prefab scene will
	 * be attached to a common root entity (with TransformComponent and
	 * LayerComponent) and the function will return that root entity.
	 */
	public static function Instantiate(prefab:Scene, ?attached:Bool):Int;
	/**
	 * Returns a table with all the entities present in the given scene.
	 */
	public static function FindAllEntities():Dynamic;
	/**
	 * Returns an entity ID if it exists, and INVALID_ENTITY otherwise. You can
	 * specify an ancestor entity if you only want to find entities that are
	 * descendants of ancestor entity.
	 */
	public static function Entity_FindByName(value:String, ?ancestor:Int):Int;
	/**
	 * Removes an entity and deletes all its components if it exists. If
	 * recursive is specified, then all children will be removed as well
	 * (enabled by default). If keep_sorted is specified, then component order
	 * will be kept (disabled by default, slower).
	 */
	public static function Entity_Remove(entity:Int, ?recursive:Bool, ?keep_sorted:Bool):Void;
	/**
	 * Same as Entity_Remove, but it runs on a background thread, status can be
	 * tracked by the [Async](#async) object that you provide.
	 */
	public static function Entity_Remove_Async(async:Async, entity:Int, ?recursive:Bool, ?keep_sorted:Bool):Void;
	/**
	 * Duplicates all of an entity's components and creates a new entity with
	 * them. Returns the clone entity handle.
	 */
	public static function Entity_Duplicate(entity:Int):Int;
	/**
	 * Check whether entity is a descendant of ancestor. Returns `true` if
	 * entity is in the hierarchy tree of ancestor, `false` otherwise.
	 */
	public static function Entity_IsDescendant(entity:Int, ancestor:Int):Bool;
	/**
	 * Attach a name component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateName(entity:Int):NameComponent;
	/**
	 * Attach a layer component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateLayer(entity:Int):LayerComponent;
	/**
	 * Attach a transform component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateTransform(entity:Int):TransformComponent;
	/**
	 * Attach a camera component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateCamera(entity:Int):CameraComponent;
	/**
	 * Attach a light component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateLight(entity:Int):LightComponent;
	/**
	 * Attach an object component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateObject(entity:Int):ObjectComponent;
	/**
	 * Attach an IK component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateInverseKinematics(entity:Int):InverseKinematicsComponent;
	/**
	 * Attach a spring component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateSpring(entity:Int):SpringComponent;
	/**
	 * Attach a script component to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateScript(entity:Int):ScriptComponent;
	/**
	 * Attach a RigidBodyPhysicsComponent to an entity. The returned component
	 * is associated with the entity and can be manipulated.
	 */
	public static function Component_CreateRigidBodyPhysics(entity:Int):RigidBodyPhysicsComponent;
	/**
	 * Attach a SoftBodyPhysicsComponent to an entity. The returned component
	 * is associated with the entity and can be manipulated.
	 */
	public static function Component_CreateSoftBodyPhysics(entity:Int):SoftBodyPhysicsComponent;
	/**
	 * Attach a ForceFieldComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateForceField(entity:Int):ForceFieldComponent;
	/**
	 * Attach a WeatherComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateWeather(entity:Int):WeatherComponent;
	/**
	 * Attach a SoundComponent to an entity. The returned component is
	 * associated ith the entity and can be manipulated.
	 */
	public static function Component_CreateSound(entity:Int):SoundComponent;
	/**
	 * Attach a VideoComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateVideo(entity:Int):VideoComponent;
	/**
	 * Attach a ColliderComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateCollider(entity:Int):ColliderComponent;
	/**
	 * Attach a ExpressionComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateExpression(entity:Int):ExpressionComponent;
	/**
	 * Attach a HumanoidComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateHumanoid(entity:Int):HumanoidComponent;
	/**
	 * Attach a DecalComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateDecal(entity:Int):DecalComponent;
	/**
	 * Attach a Sprite to an entity. The returned component is associated with
	 * the entity and can be manipulated.
	 */
	public static function Component_CreateSprite(entity:Int):Sprite;
	/**
	 * Attach a SpriteFont to an entity. The returned component is associated
	 * with the entity and can be manipulated.
	 */
	public static function Component_CreateFont(entity:Int):SpriteFont;
	/**
	 * Attach a VoxelGrid to an entity. The returned component is associated
	 * with the entity and can be manipulated.
	 */
	public static function Component_CreateVoxelGrid(entity:Int):VoxelGrid;
	/**
	 * Attach a MetadataComponent to an entity. The returned component is
	 * associated with the entity and can be manipulated.
	 */
	public static function Component_CreateMetadata(entity:Int):MetadataComponent;
	/**
	 * Query the name component of the entity (if exists)..
	 */
	public static function Component_GetName(entity:Int):NameComponent;
	/**
	 * query the layer component of the entity (if exists).
	 */
	public static function Component_GetLayer(entity:Int):LayerComponent;
	/**
	 * Query the transform component of the entity (if exists)..
	 */
	public static function Component_GetTransform(entity:Int):TransformComponent;
	/**
	 * Query the camera component of the entity (if exists)..
	 */
	public static function Component_GetCamera(entity:Int):CameraComponent;
	/**
	 * Query the animation component of the entity (if exists)..
	 */
	public static function Component_GetAnimation(entity:Int):AnimationComponent;
	/**
	 * Query the material component of the entity (if exists)..
	 */
	public static function Component_GetMaterial(entity:Int):MaterialComponent;
	/**
	 * Query the emitter component of the entity (if exists)..
	 */
	public static function Component_GetEmitter(entity:Int):EmitterComponent;
	/**
	 * Query the light component of the entity (if exists)..
	 */
	public static function Component_GetLight(entity:Int):LightComponent;
	/**
	 * Query the object component of the entity (if exists)..
	 */
	public static function Component_GetObject(entity:Int):ObjectComponent;
	/**
	 * Query the IK component of the entity (if exists)..
	 */
	public static function Component_GetInverseKinematics(entity:Int):InverseKinematicsComponent;
	/**
	 * Query the spring component of the entity (if exists)..
	 */
	public static function Component_GetSpring(entity:Int):SpringComponent;
	/**
	 * Query the script component of the entity (if exists)..
	 */
	public static function Component_GetScript(entity:Int):ScriptComponent;
	/**
	 * Query the RigidBodyPhysicsComponent of the entity (if exists)..
	 */
	public static function Component_GetRigidBodyPhysics(entity:Int):RigidBodyPhysicsComponent;
	/**
	 * Query the SoftBodyPhysicsComponent of the entity (if exists)..
	 */
	public static function Component_GetSoftBodyPhysics(entity:Int):SoftBodyPhysicsComponent;
	/**
	 * Query the ForceFieldComponent of the entity (if exists)..
	 */
	public static function Component_GetForceField(entity:Int):ForceFieldComponent;
	/**
	 * Query the WeatherComponent of the entity (if exists)..
	 */
	public static function Component_GetWeather(entity:Int):WeatherComponent;
	/**
	 * Query the SoundComponent of the entity (if exists)..
	 */
	public static function Component_GetSound(entity:Int):SoundComponent;
	/**
	 * Query the VideoComponent of the entity (if exists)..
	 */
	public static function Component_GetVideo(entity:Int):VideoComponent;
	/**
	 * Query the ColliderComponent of the entity (if exists)..
	 */
	public static function Component_GetCollider(entity:Int):ColliderComponent;
	/**
	 * Query the ExpressionComponent of the entity (if exists)..
	 */
	public static function Component_GetExpression(entity:Int):ExpressionComponent;
	/**
	 * Query the HumanoidComponent of the entity (if exists)..
	 */
	public static function Component_GetHumanoid(entity:Int):HumanoidComponent;
	/**
	 * Query the DecalComponent of the entity (if exists)..
	 */
	public static function Component_GetDecal(entity:Int):DecalComponent;
	/**
	 * Query the Sprite of the entity (if exists)..
	 */
	public static function Component_GetSprite(entity:Int):Sprite;
	/**
	 * Query the VoxelGrid of the entity (if exists)..
	 */
	public static function Component_GetVoxelGrid(entity:Int):VoxelGrid;
	/**
	 * Query the MetadataComponent of the entity (if exists)..
	 */
	public static function Component_GetMetadata(entity:Int):MetadataComponent;
	/**
	 * Returns an array of every Name component in the scene.
	 */
	public static function Component_GetNameArray():Array<NameComponent>;
	/**
	 * Returns an array of every Layer component in the scene.
	 */
	public static function Component_GetLayerArray():Array<LayerComponent>;
	/**
	 * Returns an array of every Transform component in the scene.
	 */
	public static function Component_GetTransformArray():Array<TransformComponent>;
	/**
	 * Returns an array of every Camera component in the scene.
	 */
	public static function Component_GetCameraArray():Array<CameraComponent>;
	/**
	 * Returns an array of every Animation component in the scene.
	 */
	public static function Component_GetAnimationArray():Array<AnimationComponent>;
	/**
	 * Returns an array of every Material component in the scene.
	 */
	public static function Component_GetMaterialArray():Array<MaterialComponent>;
	/**
	 * Returns an array of every Emitter component in the scene.
	 */
	public static function Component_GetEmitterArray():Array<EmitterComponent>;
	/**
	 * Returns an array of every Light component in the scene.
	 */
	public static function Component_GetLightArray():Array<LightComponent>;
	/**
	 * Returns an array of every Object component in the scene.
	 */
	public static function Component_GetObjectArray():Array<ObjectComponent>;
	/**
	 * Returns an array of every Mesh component in the scene.
	 */
	public static function Component_GetMeshArray():Array<MeshComponent>;
	/**
	 * Returns an array of every InverseKinematics component in the scene.
	 */
	public static function Component_GetInverseKinematicsArray():Array<InverseKinematicsComponent>;
	/**
	 * Returns an array of every Spring component in the scene.
	 */
	public static function Component_GetSpringArray():Array<SpringComponent>;
	/**
	 * Returns an array of every Script component in the scene.
	 */
	public static function Component_GetScriptArray():Array<ScriptComponent>;
	/**
	 * Returns an array of every RigidBodyPhysics component in the scene.
	 */
	public static function Component_GetRigidBodyPhysicsArray():Array<RigidBodyPhysicsComponent>;
	/**
	 * Returns an array of every SoftBodyPhysics component in the scene.
	 */
	public static function Component_GetSoftBodyPhysicsArray():Array<SoftBodyPhysicsComponent>;
	/**
	 * Returns an array of every ForceField component in the scene.
	 */
	public static function Component_GetForceFieldArray():Array<ForceFieldComponent>;
	/**
	 * Returns an array of every Weather component in the scene.
	 */
	public static function Component_GetWeatherArray():Array<WeatherComponent>;
	/**
	 * Returns an array of every Sound component in the scene.
	 */
	public static function Component_GetSoundArray():Array<SoundComponent>;
	/**
	 * Returns an array of every Video component in the scene.
	 */
	public static function Component_GetVideoArray():Array<VideoComponent>;
	/**
	 * Returns an array of every Collider component in the scene.
	 */
	public static function Component_GetColliderArray():Array<ColliderComponent>;
	/**
	 * Returns an array of every Expression component in the scene.
	 */
	public static function Component_GetExpressionArray():Array<ExpressionComponent>;
	/**
	 * Returns an array of every Humanoid component in the scene.
	 */
	public static function Component_GetHumanoidArray():Array<HumanoidComponent>;
	/**
	 * Returns an array of every Decal component in the scene.
	 */
	public static function Component_GetDecalArray():Array<DecalComponent>;
	/**
	 * Returns an array of every Sprite component in the scene.
	 */
	public static function Component_GetSpriteArray():Array<Sprite>;
	/**
	 * Returns an array of every Font component in the scene.
	 */
	public static function Component_GetFontArray():Array<SpriteFont>;
	/**
	 * Returns an array of every VoxelGrid component in the scene.
	 */
	public static function Component_GetVoxelGridArray():Array<VoxelGrid>;
	/**
	 * Returns an array of every Metadata component in the scene.
	 */
	public static function Component_GetMetadataArray():Array<MetadataComponent>;
	/**
	 * Returns an array of every entity that has a Name component.
	 */
	public static function Entity_GetNameArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Layer component.
	 */
	public static function Entity_GetLayerArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Transform component.
	 */
	public static function Entity_GetTransformArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Camera component.
	 */
	public static function Entity_GetCameraArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an Animation component.
	 */
	public static function Entity_GetAnimationArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an AnimationData component.
	 */
	public static function Entity_GetAnimationDataArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Material component.
	 */
	public static function Entity_GetMaterialArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an Emitter component.
	 */
	public static function Entity_GetEmitterArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Light component.
	 */
	public static function Entity_GetLightArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an Object component.
	 */
	public static function Entity_GetObjectArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Mesh component.
	 */
	public static function Entity_GetMeshArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an InverseKinematics
	 * component.
	 */
	public static function Entity_GetInverseKinematicsArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Spring component.
	 */
	public static function Entity_GetSpringArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Script component.
	 */
	public static function Entity_GetScriptArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a RigidBodyPhysics component.
	 */
	public static function Entity_GetRigidBodyPhysicsArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a SoftBodyPhysics component.
	 */
	public static function Entity_GetSoftBodyPhysicsArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a ForceField component.
	 */
	public static function Entity_GetForceFieldArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Weather component.
	 */
	public static function Entity_GetWeatherArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Sound component.
	 */
	public static function Entity_GetSoundArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Video component.
	 */
	public static function Entity_GetVideoArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Collider component.
	 */
	public static function Entity_GetColliderArray():Array<Int>;
	/**
	 * Returns an array of every entity that has an Expression component.
	 */
	public static function Entity_GetExpressionArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Humanoid component.
	 */
	public static function Entity_GetHumanoidArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Decal component.
	 */
	public static function Entity_GetDecalArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Sprite component.
	 */
	public static function Entity_GetSpriteArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a VoxelGrid component.
	 */
	public static function Entity_GetVoxelGridArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Metadata component.
	 */
	public static function Entity_GetMetadataArray():Array<Int>;
	/**
	 * Remove the name component of the entity (if exists).
	 */
	public static function Component_RemoveName(entity:Int):Void;
	/**
	 * Remove the layer component of the entity (if exists).
	 */
	public static function Component_RemoveLayer(entity:Int):Void;
	/**
	 * Remove the transform component of the entity (if exists).
	 */
	public static function Component_RemoveTransform(entity:Int):Void;
	/**
	 * Remove the camera component of the entity (if exists).
	 */
	public static function Component_RemoveCamera(entity:Int):Void;
	/**
	 * Remove the animation component of the entity (if exists).
	 */
	public static function Component_RemoveAnimation(entity:Int):Void;
	/**
	 * Remove component Animation Data.
	 */
	public static function Component_RemoveAnimationData(entity:Int):Void;
	/**
	 * Remove the material component of the entity (if exists).
	 */
	public static function Component_RemoveMaterial(entity:Int):Void;
	/**
	 * Remove the emitter component of the entity (if exists).
	 */
	public static function Component_RemoveEmitter(entity:Int):Void;
	/**
	 * Remove the light component of the entity (if exists).
	 */
	public static function Component_RemoveLight(entity:Int):Void;
	/**
	 * Remove the object component of the entity (if exists).
	 */
	public static function Component_RemoveObject(entity:Int):Void;
	/**
	 * Remove the IK component of the entity (if exists).
	 */
	public static function Component_RemoveInverseKinematics(entity:Int):Void;
	/**
	 * Remove the spring component of the entity (if exists).
	 */
	public static function Component_RemoveSpring(entity:Int):Void;
	/**
	 * Remove the script component of the entity (if exists).
	 */
	public static function Component_RemoveScript(entity:Int):Void;
	/**
	 * Remove the RigidBodyPhysicsComponent of the entity (if exists).
	 */
	public static function Component_RemoveRigidBodyPhysics(entity:Int):Void;
	/**
	 * Remove the SoftBodyPhysicsComponent of the entity (if exists).
	 */
	public static function Component_RemoveSoftBodyPhysics(entity:Int):Void;
	/**
	 * Remove the ForceFieldComponent of the entity (if exists).
	 */
	public static function Component_RemoveForceField(entity:Int):Void;
	/**
	 * Remove the WeatherComponent of the entity (if exists).
	 */
	public static function Component_RemoveWeather(entity:Int):Void;
	/**
	 * Remove the SoundComponent of the entity (if exists).
	 */
	public static function Component_RemoveSound(entity:Int):Void;
	/**
	 * Remove the VideoComponent of the entity (if exists).
	 */
	public static function Component_RemoveVideo(entity:Int):Void;
	/**
	 * Remove the ColliderComponent of the entity (if exists).
	 */
	public static function Component_RemoveCollider(entity:Int):Void;
	/**
	 * Remove the ExpressionComponent of the entity (if exists).
	 */
	public static function Component_RemoveExpression(entity:Int):Void;
	/**
	 * Remove the HumanoidComponent of the entity (if exists).
	 */
	public static function Component_RemoveHumanoid(entity:Int):Void;
	/**
	 * Remove the DecalComponent of the entity (if exists).
	 */
	public static function Component_RemoveDecal(entity:Int):Void;
	/**
	 * Remove the Sprite of the entity (if exists).
	 */
	public static function Component_RemoveSprite(entity:Int):Void;
	/**
	 * Remove the SpriteFont of the entity (if exists).
	 */
	public static function Component_RemoveFont(entity:Int):Void;
	/**
	 * Remove the VoxelGrid of the entity (if exists).
	 */
	public static function Component_RemoveVoxelGrid(entity:Int):Void;
	/**
	 * Remove the MetadataComponent of the entity (if exists).
	 */
	public static function Component_RemoveMetadata(entity:Int):Void;
	/**
	 * Attaches entity to parent (adds a hierarchy component to entity). From
	 * now on, entity will inherit certain properties from parent, such as
	 * transform (entity will move with parent) or layer (entity's layer will
	 * be a sublayer of parent's layer). If child_already_in_local_space is
	 * false, then child will be transformed into parent's local space, if
	 * true, it will be used as-is.
	 */
	public static function Component_Attach(entity:Int, parent:Int, ?child_already_in_local_space:Bool):Void;
	/**
	 * Detaches entity from parent (if hierarchycomponent exists for it).
	 * Restores entity's original layer, and applies current transformation to
	 * entity.
	 */
	public static function Component_Detach(entity:Int):Void;
	/**
	 * Detaches all children from parent, as if calling Component_Detach for
	 * all of its children.
	 */
	public static function Component_DetachChildren(parent:Int):Void;
	/**
	 * Returns an AABB fully containing objects in the scene. Only valid after
	 * scene has been updated.
	 */
	public static function GetBounds():AABB;
	/**
	 * Returns the weather.
	 */
	public static function GetWeather():WeatherComponent;
	/**
	 * Sets the weather.
	 */
	public static function SetWeather(weather:WeatherComponent):Void;
	/**
	 * Retargets an animation from a Humanoid to an other Humanoid such that
	 * the new animation will play back on the destination humanoid. dst :
	 * destination humanoid that the animation will be fit onto src : the
	 * animation to copy, it should already target humanoid bones. bake_data :
	 * if true, the retargeted data will be baked into a new animation data. If
	 * false, it will reuse the source animation data without creating a new
	 * one and retargeting will be applied at runtime on every Update. Returns
	 * entity ID of the new animation or INVALID_ENTITY if retargeting was not
	 * successful
	 */
	public static function RetargetAnimation(dst:Int, src:Int, bake_data:Bool, ?src_scene:Scene):Int;
	/**
	 * Resets the pose of the specified entity to bind pose. The bind pose is
	 * taken from the bind matrices of bones of an ArmatureComponent. If the
	 * entity does not have an armature, then it will find the child armatures
	 * of the entity.
	 */
	public static function ResetPose(entity:Int):Void;
	/**
	 * Returns the approximate position on the ocean surface seen from a
	 * position in world space. If current weather doesn't have ocean enabled,
	 * Returns the world position itself. The result position is approximate
	 * because it involves reading back from GPU to the CPU, so the result can
	 * be delayed compared to the current GPU simulation. Note that the input
	 * position to this function will be taken on the XZ plane and modified by
	 * the displacement map's XZ value, and the Y (vertical) position will be
	 * taken from the ocean water height and displacement map only.
	 */
	public static function GetOceanPosAt(worldPosition:WEVector):Void;
	/**
	 * Voxelizes a single object into the voxel grid. Subtract parameter
	 * controls whether the voxels are added (true) or removed (false). Lod
	 * argument selects object's level of detail.
	 */
	public static function VoxelizeObject(objectIndex:Int, voxelgrid:VoxelGrid, ?subtract:Bool, ?lod:Int):Void;
	/**
	 * Voxelizes all entities in the scene which intersect the voxel grid
	 * volume and match the filterMask and layerMask. Subtract parameter
	 * controls whether the voxels are added (true) or removed (false). Lod
	 * argument selects object's level of detail.
	 */
	public static function VoxelizeScene(voxelgrid:VoxelGrid, ?subtract:Bool, ?filterMask:Int, ?layerMask:Int, ?lod:Int):Void;
	/**
	 * Maintenance utility to help fix Nan issues in TransformComponents.
	 * Transforms containing nans will be cleared and renamed with `_nanfix`
	 * postfix.
	 */
	public static function FixupNans():Void;
	/**
	 * Attaches a EmitterComponent to the entity.
	 */
	public static function Component_CreateEmitter(entity:Int):EmitterComponent;
	/**
	 * Attaches a HairParticleSystem to the entity.
	 */
	public static function Component_CreateHairParticleSystem(entity:Int):HairParticleSystem;
	/**
	 * Attaches a MaterialComponent to the entity.
	 */
	public static function Component_CreateMaterial(entity:Int):MaterialComponent;
	/**
	 * Attaches a CharacterComponent to the entity.
	 */
	public static function Component_CreateCharacter(entity:Int):CharacterComponent;
	/**
	 * Returns the MeshComponent of the entity, if it exists.
	 */
	public static function Component_GetMesh(entity:Int):MeshComponent;
	/**
	 * Returns the HairParticleSystem of the entity, if it exists.
	 */
	public static function Component_GetHairParticleSystem(entity:Int):HairParticleSystem;
	/**
	 * Returns the SpriteFont of the entity, if it exists.
	 */
	public static function Component_GetFont(entity:Int):SpriteFont;
	/**
	 * Returns the CharacterComponent of the entity, if it exists.
	 */
	public static function Component_GetCharacter(entity:Int):CharacterComponent;
	/**
	 * Returns an array of every HairParticleSystem component in the scene.
	 */
	public static function Component_GetHairParticleSystemArray():Array<HairParticleSystem>;
	/**
	 * Returns an array of every Character component in the scene.
	 */
	public static function Component_GetCharacterArray():Array<CharacterComponent>;
	/**
	 * Returns an array of every entity that has a HairParticleSystem
	 * component.
	 */
	public static function Entity_GetHairParticleSystemArray():Array<Int>;
	/**
	 * Returns an array of every entity that has a Character component.
	 */
	public static function Entity_GetCharacterArray():Array<Int>;
	/**
	 * Removes the MeshComponent of the entity, if it exists.
	 */
	public static function Component_RemoveMesh(entity:Int):Void;
	/**
	 * Removes the HairParticleSystem of the entity, if it exists.
	 */
	public static function Component_RemoveHairParticleSystem(entity:Int):Void;
	/**
	 * Removes the CharacterComponent of the entity, if it exists.
	 */
	public static function Component_RemoveCharacter(entity:Int):Void;
}

/**
 * Result of one hit in scene.IntersectsAll.
 */
extern class RayIntersectionResult {
	/**
	 * Returns the entity.
	 */
	public static function GetEntity():Int;
	/**
	 * Returns the position.
	 */
	public static function GetPosition():WEVector;
	/**
	 * Returns the normal.
	 */
	public static function GetNormal():WEVector;
	/**
	 * Returns the uv.
	 */
	public static function GetUV():WEVector;
	/**
	 * Returns the velocity.
	 */
	public static function GetVelocity():WEVector;
	/**
	 * Returns the distance.
	 */
	public static function GetDistance():Float;
	/**
	 * Returns the subset index.
	 */
	public static function GetSubsetIndex():Int;
	/**
	 * Returns the vertex id0.
	 */
	public static function GetVertexID0():Int;
	/**
	 * Returns the vertex id1.
	 */
	public static function GetVertexID1():Int;
	/**
	 * Returns the vertex id2.
	 */
	public static function GetVertexID2():Int;
	/**
	 * Returns the barycentrics.
	 */
	public static function GetBarycentrics():WEVector;
	/**
	 * Returns the orientation.
	 */
	public static function GetOrientation():WEVector;
	/**
	 * Returns the humanoid bone.
	 */
	public static function GetHumanoidBone():Int;
}

/**
 * Result of one hit in scene.IntersectsAll.
 */
extern class SphereIntersectionResult {
	/**
	 * Returns the entity.
	 */
	public static function GetEntity():Int;
	/**
	 * Returns the position.
	 */
	public static function GetPosition():WEVector;
	/**
	 * Returns the normal.
	 */
	public static function GetNormal():WEVector;
	/**
	 * Returns the velocity.
	 */
	public static function GetVelocity():WEVector;
	/**
	 * Returns the depth.
	 */
	public static function GetDepth():Float;
	/**
	 * Returns the subset index.
	 */
	public static function GetSubsetIndex():Int;
	/**
	 * Returns the orientation.
	 */
	public static function GetOrientation():WEVector;
	/**
	 * Returns the humanoid bone.
	 */
	public static function GetHumanoidBone():Int;
}

/**
 * Holds a string that can more easily identify an entity to humans than an
 * entity ID.
 */
extern class NameComponent {
	public var Name:String;
	/**
	 * Sets the name.
	 */
	public static function SetName(value:String):Void;
	/**
	 * Query the name string.
	 */
	public static function GetName():Dynamic;
}

/**
 * An integer mask that can be used to group entities together for certain
 * operations such as: picking, rendering, etc.
 */
extern class LayerComponent {
	public var LayerMask:Float;
	/**
	 * Sets layer mask.
	 */
	public static function SetLayerMask(value:Int):Void;
	/**
	 * Query layer mask.
	 */
	public static function GetLayerMask():Int;
}

/**
 * Describes an orientation in 3D space.
 */
extern class TransformComponent {
	/**
	 * query the position in world space
	 */
	public var Translation_local:WEVector;
	public var Rotation_local:WEVector;
	/**
	 * query the scaling in world space
	 */
	public var Scale_local:WEVector;
	@:overload(function(value:Float):Void {})
	/**
	 * Applies scaling.
	 */
	public static function Scale(vectorXYZ:WEVector):Void;
	/**
	 * Applies rotation as roll,pitch,yaw.
	 */
	public static function Rotate(vectorRollPitchYaw:WEVector):Void;
	/**
	 * Applies rotation as quaternion.
	 */
	public static function RotateQuaternion(quaternion:WEVector):Void;
	/**
	 * Applies translation (position offset).
	 */
	public static function Translate(vectorXYZ:WEVector):Void;
	/**
	 * Interpolates linearly between two transform components.
	 */
	public static function Lerp(a:TransformComponent, b:TransformComponent, t:Float):Void;
	/**
	 * Interpolates between four transform components on a spline.
	 */
	public static function CatmullRom(a:TransformComponent, b:TransformComponent, c:TransformComponent, d:TransformComponent, t:Float):Void;
	/**
	 * Applies a transformation matrix.
	 */
	public static function MatrixTransform(matrix:Matrix):Void;
	/**
	 * Retrieve a 4x4 transformation matrix representing the transform
	 * component's current orientation.
	 */
	public static function GetMatrix():Matrix;
	/**
	 * Reset to the world origin, as in position becomes Vector(0,0,0),
	 * rotation quaternion becomes Vector(0,0,0,1), scaling becomes
	 * Vector(1,1,1).
	 */
	public static function ClearTransform():Void;
	/**
	 * Updates the underlying transformation matrix.
	 */
	public static function UpdateTransform():Void;
	/**
	 * Query the position in world space.
	 */
	public static function GetPosition():WEVector;
	/**
	 * Query the rotation as a quaternion in world space.
	 */
	public static function GetRotation():WEVector;
	/**
	 * Query the scaling in world space.
	 */
	public static function GetScale():WEVector;
	/**
	 * Set scale in local space.
	 */
	public static function SetScale(value:WEVector):Void;
	/**
	 * Set rotation quaternion in local space.
	 */
	public static function SetRotation(quaternnion:WEVector):Void;
	/**
	 * Set position in local space.
	 */
	public static function SetPosition(value:WEVector):Void;
	/**
	 * Invalidate, this will cause transformer to be updated in next scene
	 * update.
	 */
	public static function SetDirty(value:Bool):Void;
	/**
	 * Check if transform was invalidated since last update.
	 */
	public static function IsDirty():Bool;
	/**
	 * rRturns forward direction.
	 */
	public static function GetForward():WEVector;
	/**
	 * Returns upwards direction.
	 */
	public static function GetUp():WEVector;
	/**
	 * Returns right direction.
	 */
	public static function GetRight():WEVector;
}

/**
 * Represents a camera: its position, orientation and projection, used to
 * render the scene from a viewpoint.
 */
extern class CameraComponent {
	public var FOV:Float;
	public var NearPlane:Float;
	public var FarPlane:Float;
	public var FocalLength:Float;
	public var ApertureSize:Float;
	public var ApertureShape:Float;
	/**
	 * Update the camera matrices.
	 */
	public static function UpdateCamera():Void;
	@:overload(function(matrix:Matrix):Void {})
	/**
	 * Copies the transform's orientation to the camera, and sets the camera
	 * position, look direction and up direction. Camera matrices are not
	 * updated immediately. They will be updated by the Scene::Update() (if the
	 * camera is part of the scene), or by manually calling UpdateCamera().
	 */
	public static function TransformCamera(transform:TransformComponent):Void;
	/**
	 * Returns the fov.
	 */
	public static function GetFOV():Float;
	/**
	 * Sets the vertical field of view for the camera (value is an angle in
	 * radians).
	 */
	public static function SetFOV(value:Float):Void;
	/**
	 * Returns the near plane.
	 */
	public static function GetNearPlane():Float;
	/**
	 * Sets the near plane of the camera, which specifies the rendering cut off
	 * near the viewer. Must be a value greater than zero.
	 */
	public static function SetNearPlane(value:Float):Void;
	/**
	 * Returns the far plane.
	 */
	public static function GetFarPlane():Float;
	/**
	 * Sets the far plane (view distance) of the camera.
	 */
	public static function SetFarPlane(value:Float):Void;
	/**
	 * Returns the focal length.
	 */
	public static function GetFocalLength():Float;
	/**
	 * Sets the focal distance (focus distance) of the camera. This is used by
	 * depth of field.
	 */
	public static function SetFocalLength(value:Float):Void;
	/**
	 * Returns the aperture size.
	 */
	public static function GetApertureSize():Float;
	/**
	 * Sets the aperture size of the camera. Larger values will make the depth
	 * of field effect stronger.
	 */
	public static function SetApertureSize(value:Float):Void;
	/**
	 * Returns the aperture shape.
	 */
	public static function GetApertureShape():Float;
	/**
	 * Sets the aperture shape of camera, used for depth of field effect. The
	 * value's `.X` element specifies the horizontal, the `.Y` element
	 * specifies the vertical shape.
	 */
	public static function SetApertureShape(value:WEVector):Void;
	/**
	 * Returns the view.
	 */
	public static function GetView():Matrix;
	/**
	 * Returns the projection.
	 */
	public static function GetProjection():Matrix;
	/**
	 * Returns the view projection.
	 */
	public static function GetViewProjection():Matrix;
	/**
	 * Returns the inv view.
	 */
	public static function GetInvView():Matrix;
	/**
	 * Returns the inv projection.
	 */
	public static function GetInvProjection():Matrix;
	/**
	 * Returns the inv view projection.
	 */
	public static function GetInvViewProjection():Matrix;
	/**
	 * Returns the position.
	 */
	public static function GetPosition():WEVector;
	/**
	 * Returns the look direction.
	 */
	public static function GetLookDirection():WEVector;
	/**
	 * Returns the up direction.
	 */
	public static function GetUpDirection():WEVector;
	/**
	 * Returns the right direction.
	 */
	public static function GetRightDirection():WEVector;
	/**
	 * Sets the position of the camera. `UpdateCamera()` should be used after
	 * this to apply the value.
	 */
	public static function SetPosition(value:WEVector):Void;
	/**
	 * Sets the look direction of the camera. The value must be a normalized
	 * direction `Vector`, relative to the camera position, and also
	 * perpendicular to the up direction. `UpdateCamera()` should be used after
	 * this to apply the value. This value will also be set if using the
	 * `TransformCamera()` function, from the transform's rotation.
	 */
	public static function SetLookDirection(value:WEVector):Void;
	/**
	 * Sets the up direction of the camera. This must be a normalized direction
	 * `Vector`, relative to the camera position, and also perpendicular to the
	 * look direction. `UpdateCamera()` should be used after this to apply the
	 * value. This value will also be set if using the `TransformCamera()`
	 * function, from the transform's rotation.
	 */
	public static function SetUpDirection(value:WEVector):Void;
	/**
	 * Enable orthographic projection for the camera.
	 */
	public static function SetOrtho(value:Bool):Void;
	/**
	 * Returns true if the camera is using orthographic projection, false
	 * otherwise.
	 */
	public static function IsOrtho():Bool;
	/**
	 * Returns the ortho vertical size.
	 */
	public static function GetOrthoVerticalSize():Float;
	/**
	 * Sets the vertical size of the camera in world space, used only in
	 * orthographic projection mode.
	 */
	public static function SetOrthoVerticalSize(value:Float):Void;
	/**
	 * Projects the world-space point to screen space within the canvas logical
	 * width and height units (sceen width and height). If the Z coordinate is
	 * positive that means that it is in front of the camera, otherwise it is
	 * behind (can be considered to be clipped).
	 */
	public static function ProjectToScreen(point:WEVector, canvas:Canvas):Void;
}

/**
 * Plays back and controls an animation (skeletal or property animation) on
 * an entity.
 */
extern class AnimationComponent {
	public var Timer:Float;
	public var Amount:Float;
	/**
	 * Play.
	 */
	public static function Play():Void;
	/**
	 * Stop.
	 */
	public static function Stop():Void;
	/**
	 * Pause.
	 */
	public static function Pause():Void;
	/**
	 * Sets the animation to repeat continuously.
	 */
	public static function SetLooped(value:Bool):Void;
	/**
	 * Returns true if the animation is set to repeat continuously.
	 */
	public static function IsLooped():Bool;
	/**
	 * Returns whether playing.
	 */
	public static function IsPlaying():Bool;
	/**
	 * Sets the timer.
	 */
	public static function SetTimer(value:Float):Void;
	/**
	 * Returns the timer.
	 */
	public static function GetTimer():Float;
	/**
	 * Sets the amount.
	 */
	public static function SetAmount(value:Float):Void;
	/**
	 * Returns the amount.
	 */
	public static function GetAmount():Float;
	/**
	 * Returns the start.
	 */
	public static function GetStart():Float;
	/**
	 * Sets the start.
	 */
	public static function SetStart(value:Float):Void;
	/**
	 * Returns the end.
	 */
	public static function GetEnd():Float;
	/**
	 * Sets the end.
	 */
	public static function SetEnd(value:Float):Void;
	/**
	 * Sets the animation to play forward and then backwards repeatedly.
	 */
	public static function SetPingPong(value:Bool):Void;
	/**
	 * Returns true if the animation is set to play forward and then backwards
	 * repeatedly.
	 */
	public static function IsPingPong():Bool;
	/**
	 * Sets the animation to play once.
	 */
	public static function SetPlayOnce():Void;
	/**
	 * Returns true if the animation is set to play once.
	 */
	public static function IsPlayingOnce():Bool;
	/**
	 * Returns whether the animation has reached its end.
	 */
	public static function IsEnded():Bool;
	/**
	 * Returns whether root motion is enabled.
	 */
	public static function IsRootMotion():Bool;
	/**
	 * Enables root motion for this animation.
	 */
	public static function RootMotionOn():Void;
	/**
	 * Disables root motion for this animation.
	 */
	public static function RootMotionOff():Void;
	/**
	 * Returns the root-motion translation.
	 */
	public static function GetRootTranslation():WEVector;
	/**
	 * Returns the root-motion rotation as a quaternion.
	 */
	public static function GetRootRotation():WEVector;
}

/**
 * Surface material of an object: colors, textures and PBR shading
 * parameters.
 */
extern class MaterialComponent {
	public var Saturation:Float;
	public var _flags:Int;
	public var BaseColor:WEVector;
	public var EmissiveColor:WEVector;
	public var EngineStencilRef:Int;
	public var UserStencilRef:Int;
	public var ShaderType:Int;
	public var UserBlendMode:Int;
	public var SpecularColor:WEVector;
	public var SubsurfaceScattering:WEVector;
	public var TexMulAdd:WEVector;
	public var Roughness:Float;
	public var Reflectance:Float;
	public var Metalness:Float;
	public var NormalMapStrength:Float;
	public var ParallaxOcclusionMapping:Float;
	public var DisplacementMapping:Float;
	public var Refraction:Float;
	public var Transmission:Float;
	public var Cloak:Float;
	public var ChromaticAberration:Float;
	public var AlphaRef:Float;
	public var SheenColor:WEVector;
	public var SheenRoughness:Float;
	public var Clearcoat:Float;
	public var ClearcoatRoughness:Float;
	public var ShadingRate:Int;
	public var TexAnimDirection:WEVector;
	public var TexAnimFrameRate:Float;
	public var texAnimElapsedTime:Float;
	public var customShaderID:Int;
	/**
	 * Sets the base color.
	 */
	public static function SetBaseColor(value:WEVector):Void;
	/**
	 * Sets the emissive color.
	 */
	public static function SetEmissiveColor(value:WEVector):Void;
	/**
	 * Sets the engine stencil ref.
	 */
	public static function SetEngineStencilRef(value:Int):Void;
	/**
	 * Sets the user stencil ref.
	 */
	public static function SetUserStencilRef(value:Int):Void;
	/**
	 * Returns the stencil ref.
	 */
	public static function GetStencilRef():Int;
	/**
	 * Sets the tex mul add.
	 */
	public static function SetTexMulAdd(vector:WEVector):Void;
	/**
	 * Returns the tex mul add.
	 */
	public static function GetTexMulAdd():WEVector;
	@:overload(function(slot:TextureSlot, texture:WETexture):Void {})
	/**
	 * Sets the texture.
	 */
	public static function SetTexture(slot:TextureSlot, texturefile:String):Void;
	/**
	 * Sets the texture uvset.
	 */
	public static function SetTextureUVSet(slot:TextureSlot, uvset:Int):Void;
	/**
	 * Returns the texture.
	 */
	public static function GetTexture(slot:TextureSlot):WETexture;
	/**
	 * Returns the texture name.
	 */
	public static function GetTextureName(slot:TextureSlot):Dynamic;
	/**
	 * Returns the texture uvset.
	 */
	public static function GetTextureUVSet(slot:TextureSlot):Int;
	/**
	 * Sets the cast shadow.
	 */
	public static function SetCastShadow(value:Bool):Void;
	/**
	 * Returns whether casting shadow.
	 */
	public static function IsCastingShadow():Bool;
	/**
	 * force transparent material draw in opaque pass (useful for coplanar
	 * polygons)
	 */
	public static function SetCoplanarBlending(value:Bool):Void;
	/**
	 * Returns whether coplanar blending.
	 */
	public static function IsCoplanarBlending():Bool;
}

/**
 * Geometry data (vertices, indices and subsets) that objects reference and
 * render.
 */
extern class MeshComponent {
	public var _flags:Int;
	public var TessellationFactor:Float;
	public var ArmatureID:Int;
	public var SubsetsPerLOD:Int;
	/**
	 * Sets the mesh subset material id.
	 */
	public static function SetMeshSubsetMaterialID(subsetindex:Int, materialID:Int):Void;
	/**
	 * Returns the mesh subset material id.
	 */
	public static function GetMeshSubsetMaterialID(subsetindex:Int):Int;
	/**
	 * creates subset containing all faces, returns subset index
	 */
	public static function CreateSubset():Int;
}

/**
 * A GPU particle emitter attached to an entity.
 */
extern class EmitterComponent {
	public var _flags:Int;
	public var ShaderType:Int;
	public var Mass:Float;
	public var Velocity:WEVector;
	public var Gravity:WEVector;
	public var Drag:Float;
	public var Restitution:Float;
	/**
	 * emitted particle count per second
	 */
	public var EmitCount:Float;
	/**
	 * particle starting size
	 */
	public var Size:Float;
	/**
	 * particle lifetime
	 */
	public var Life:Float;
	/**
	 * normal factor that modulates emit velocities
	 */
	public var NormalFactor:Float;
	/**
	 * general randomness factor
	 */
	public var Randomness:Float;
	/**
	 * lifetime randomness factor
	 */
	public var LifeRandomness:Float;
	/**
	 * scaling along lifetime in X axis
	 */
	public var ScaleX:Float;
	/**
	 * scaling along lifetime in Y axis
	 */
	public var ScaleY:Float;
	/**
	 * rotation speed
	 */
	public var Rotation:Float;
	/**
	 * set the motion elongation factor
	 */
	public var MotionBlurAmount:Float;
	public var SPH_h:Float;
	public var SPH_K:Float;
	public var SPH_p0:Float;
	public var SPH_e:Float;
	public var SpriteSheet_Frames_X:Int;
	public var SpriteSheet_Frames_Y:Int;
	public var SpriteSheet_Frame_Count:Int;
	public var SpriteSheet_Frame_Start:Int;
	public var SpriteSheet_Framerate:Float;
	@:overload(function(value:Int, position:WEVector, ?color:WEVector):Void {})
	@:overload(function(value:Int, transform:Matrix, ?color:WEVector):Void {})
	/**
	 * Spawns a specific amount of particles immediately.
	 */
	public static function Burst(value:Int):Void;
	/**
	 * Set the emitted particle count per second.
	 */
	public static function SetEmitCount(value:Float):Void;
	/**
	 * Set particle starting size.
	 */
	public static function SetSize(value:Float):Void;
	/**
	 * Set particle lifetime.
	 */
	public static function SetLife(value:Float):Void;
	/**
	 * Set normal factor that modulates emit velocities.
	 */
	public static function SetNormalFactor(value:Float):Void;
	/**
	 * Set general randomness factor.
	 */
	public static function SetRandomness(value:Float):Void;
	/**
	 * Set lifetime randomness factor.
	 */
	public static function SetLifeRandomness(value:Float):Void;
	/**
	 * Set scaling along lifetime in X axis.
	 */
	public static function SetScaleX(value:Float):Void;
	/**
	 * Set scaling along lifetime in Y axis.
	 */
	public static function SetScaleY(value:Float):Void;
	/**
	 * Set rotation speed.
	 */
	public static function SetRotation(value:Float):Void;
	/**
	 * Set the motion elongation factor.
	 */
	public static function SetMotionBlurAmount(value:Float):Void;
	/**
	 * Disable GPU colliders.
	 */
	public static function SetCollidersDisabled(value:Bool):Void;
	/**
	 * Returns whether colliders disabled.
	 */
	public static function IsCollidersDisabled():Void;
	/**
	 * Returns last known alive particle count (not that particles are tracked
	 * on GPU so this value might be out of date).
	 */
	public static function GetCurrentParticleCount():Int;
}

/**
 * A GPU hair or grass particle system attached to an entity.
 */
extern class HairParticleSystem {
	public var _flags:Int;
	public var StrandCount:Int;
	public var SegmentCount:Int;
	public var RandomSeed:Int;
	public var Length:Float;
	public var Stiffness:Float;
	public var Randomness:Float;
	public var ViewDistance:Float;
	public var SpriteSheet_Frames_X:Int;
	public var SpriteSheet_Frames_Y:Int;
	public var SpriteSheet_Frame_Count:Int;
	public var SpriteSheet_Frame_Start:Int;
}

/**
 * A light source in the scene (directional, point or spot).
 */
extern class LightComponent {
	public var Type:Int;
	public var Range:Float;
	public var Intensity:Float;
	public var Color:WEVector;
	public var CastShadow:Bool;
	public var VolumetricsEnabled:Bool;
	/**
	 * outer cone angle for spotlight in radians
	 */
	public var OuterConeAngle:Float;
	/**
	 * inner cone angle for spotlight in radians
	 */
	public var InnerConeAngle:Float;
	/**
	 * Set light type, see accepted values below (by default it is a point
	 * light).
	 */
	public static function SetType(type_:Int):Void;
	/**
	 * Sets the range.
	 */
	public static function SetRange(value:Float):Void;
	/**
	 * Brightness of the light. The unit depends on the light type: point and
	 * spot lights use luminous intensity in candela (lm/sr), while directional
	 * lights use illuminance in lux (lm/m2). See the glTF KHR_lights_punctual
	 * spec:
	 * https://github.com/KhronosGroup/glTF/tree/main/extensions/2.0/Khronos/KHR_lights_punctual
	 */
	public static function SetIntensity(value:Float):Void;
	/**
	 * Sets the color.
	 */
	public static function SetColor(value:WEVector):Void;
	/**
	 * Sets the cast shadow.
	 */
	public static function SetCastShadow(value:Bool):Void;
	/**
	 * Enables or disables volumetrics.
	 */
	public static function SetVolumetricsEnabled(value:Bool):Void;
	/**
	 * Outer cone angle for spotlight in radians.
	 */
	public static function SetOuterConeAngle(value:Float):Void;
	/**
	 * Inner cone angle for spotlight in radians (0 <= innerConeAngle <=
	 * outerConeAngle). Value of 0 disables inner cone angle.
	 */
	public static function SetInnerConeAngle(value:Float):Void;
	/**
	 * Returns the type.
	 */
	public static function GetType():Int;
	/**
	 * Kept for backwards compatibility with non physical light units (before
	 * v0.70.0).
	 */
	public static function SetEnergy(value:Float):Void;
	/**
	 * Kept for backwards compatibility with FOV angle (before v0.70.0).
	 */
	public static function SetFOV(value:Float):Void;
	/**
	 * Returns whether the light casts shadows.
	 */
	public static function IsCastShadow():Bool;
	/**
	 * Returns whether volumetric light is enabled.
	 */
	public static function IsVolumetricsEnabled():Bool;
}

/**
 * Places a mesh into the scene as a renderable instance, with per-instance
 * rendering options.
 */
extern class ObjectComponent {
	public var MeshID:Int;
	public var CascadeMask:Int;
	public var RendertypeMask:Int;
	public var Color:WEVector;
	public var EmissiveColor:WEVector;
	public var UserStencilRef:Int;
	public var LodDistanceMultiplier:Float;
	public var DrawDistance:Float;
	/**
	 * Returns the mesh id.
	 */
	public static function GetMeshID():Int;
	/**
	 * Returns the cascade mask.
	 */
	public static function GetCascadeMask():Int;
	/**
	 * Returns the rendertype mask.
	 */
	public static function GetRendertypeMask():Int;
	/**
	 * Returns the color.
	 */
	public static function GetColor():WEVector;
	/**
	 * Returns the emissive color.
	 */
	public static function GetEmissiveColor():WEVector;
	/**
	 * Returns the user stencil ref.
	 */
	public static function GetUserStencilRef():Int;
	/**
	 * Returns the draw distance.
	 */
	public static function GetDrawDistance():Float;
	/**
	 * Sets the mesh id.
	 */
	public static function SetMeshID(entity:Int):Void;
	/**
	 * Sets the cascade mask.
	 */
	public static function SetCascadeMask(value:Int):Void;
	/**
	 * Sets the rendertype mask.
	 */
	public static function SetRendertypeMask(value:Int):Void;
	/**
	 * Sets the color.
	 */
	public static function SetColor(value:WEVector):Void;
	/**
	 * Set the RGB color for rim highlight
	 */
	public static function SetRimHighlightColor(value:WEVector):Void;
	/**
	 * Set the intensity (multiplier) of rim highlight color
	 */
	public static function SetRimHighlightIntensity(value:Float):Void;
	/**
	 * Set the falloff power of rim highlight
	 */
	public static function SetRimHighlightFalloff(value:Float):Void;
	/**
	 * Sets the emissive color.
	 */
	public static function SetEmissiveColor(value:WEVector):Void;
	/**
	 * Sets the user stencil ref.
	 */
	public static function SetUserStencilRef(value:Int):Void;
	/**
	 * Sets the draw distance.
	 */
	public static function SetDrawDistance(value:Float):Void;
	/**
	 * Enable/disable foreground object rendering. Foreground objects will be
	 * always rendered on top of regular objects, useful for FPS weapon or
	 * hands.
	 */
	public static function SetForeground(value:Bool):Void;
	/**
	 * Returns whether foreground.
	 */
	public static function IsForeground():Bool;
	/**
	 * You can set the object to not be visible in main camera, but it will
	 * remain visible in reflections and shadows, useful for FPS character
	 * model.
	 */
	public static function SetNotVisibleInMainCamera(value:Bool):Void;
	/**
	 * Returns whether not visible in main camera.
	 */
	public static function IsNotVisibleInMainCamera():Bool;
	/**
	 * You can set the object to not be visible in main camera, but it will
	 * remain visible in reflections and shadows, useful for vampires.
	 */
	public static function SetNotVisibleInReflections(value:Bool):Void;
	/**
	 * Returns whether not visible in reflections.
	 */
	public static function IsNotVisibleInReflections():Bool;
	/**
	 * Enable wet map for the object, this will automatically track the
	 * wetness.
	 */
	public static function SetWetmapEnabled(value:Bool):Void;
	/**
	 * Returns whether wetmap enabled.
	 */
	public static function IsWetmapEnabled():Bool;
	/**
	 * Can turn off rendering of an object.
	 */
	public static function SetRenderable(value:Bool):Void;
	/**
	 * Returns whether renderable.
	 */
	public static function IsRenderable():Bool;
	/**
	 * Returns the alpha test reference value.
	 */
	public static function GetAlphaRef():Float;
	/**
	 * Sets the alpha test reference value.
	 */
	public static function SetAlphaRef(value:Float):Void;
}

/**
 * Drives a chain of bones toward a target entity using inverse kinematics.
 */
extern class InverseKinematicsComponent {
	public var Target:Int;
	public var ChainLength:Int;
	public var IterationCount:Int;
	/**
	 * Sets the target entity (The IK entity and its parent hierarchy chain
	 * will try to reach the target).
	 */
	public static function SetTarget(entity:Int):Void;
	/**
	 * Sets the chain length, in other words, how many parents will be computed
	 * by the IK system.
	 */
	public static function SetChainLength(value:Int):Void;
	/**
	 * Sets the accuracy of the IK system simulation.
	 */
	public static function SetIterationCount(value:Int):Void;
	/**
	 * Disable/Enable the IK simulation.
	 */
	public static function SetDisabled(value:Bool):Void;
	/**
	 * Returns the target.
	 */
	public static function GetTarget():Int;
	/**
	 * Returns the chain length.
	 */
	public static function GetChainLength():Int;
	/**
	 * Returns the iteration count.
	 */
	public static function GetIterationCount():Int;
	/**
	 * Returns whether disabled.
	 */
	public static function IsDisabled():Bool;
}

/**
 * Adds spring/jiggle physics to a transform, for soft secondary motion
 * such as bones.
 */
extern class SpringComponent {
	public var Stiffness:Float;
	public var Damping:Float;
	public var WindAffection:Float;
	public var DragForce:Float;
	public var HitRadius:Float;
	public var GravityPower:Float;
	public var GravityDirection:WEVector;
	/**
	 * Sets the stiffness.
	 */
	public static function SetStiffness(value:Float):Void;
	/**
	 * Sets the damping.
	 */
	public static function SetDamping(value:Float):Void;
	/**
	 * Sets the wind affection.
	 */
	public static function SetWindAffection(value:Float):Void;
}

/**
 * A lua script bound to an entity.
 */
extern class ScriptComponent {
	/**
	 * Creates from file.
	 */
	public static function CreateFromFile(filename:String):Void;
	/**
	 * Play.
	 */
	public static function Play():Void;
	/**
	 * Returns whether playing.
	 */
	public static function IsPlaying():Bool;
	/**
	 * Sets the play once.
	 */
	public static function SetPlayOnce(once:Bool):Void;
	/**
	 * Stop.
	 */
	public static function Stop():Void;
}

/**
 * Describes a Rigid Body Physics object.
 */
extern class RigidBodyPhysicsComponent {
	public var Shape:Int;
	public var Mass:Float;
	public var Friction:Float;
	public var Restitution:Float;
	public var LinearDamping:Float;
	public var AngularDamping:Float;
	public var Buoyancy:Float;
	public var BoxParams_HalfExtents:WEVector;
	public var SphereParams_Radius:Float;
	public var CapsuleParams_Radius:Float;
	public var CapsuleParams_Height:Float;
	public var TargetMeshLOD:Int;
	/**
	 * character physics max slope angle in radians
	 */
	public var MaxSlopeAngle:Float;
	/**
	 * character physics gravity factor
	 */
	public var GravityFactor:Float;
	/**
	 * Returns true if this is a vehicle, false otherwise.
	 */
	public static function IsVehicle():Bool;
	/**
	 * Returns true if this is a car vehicle, false otherwise.
	 */
	public static function IsCar():Bool;
	/**
	 * Returns true if this is a motorcycle vehicle, false otherwise.
	 */
	public static function IsMotorcycle():Bool;
	/**
	 * Check if the rigidbody is able to deactivate after inactivity.
	 */
	public static function IsDisableDeactivation():Bool;
	/**
	 * Check if the rigidbody is movable or just static.
	 */
	public static function IsKinematic():Bool;
	/**
	 * Checks whether rigid body is set to be deactivated when added to
	 * simulation.
	 */
	public static function IsStartDeactivated():Bool;
	/**
	 * Sets if the rigidbody is able to deactivate after inactivity.
	 */
	public static function SetDisableDeactivation(value:Bool):Void;
	/**
	 * Set the rigid body to be kinematic (which means it is optimized for
	 * being moved by the system or user logic, not the physics engine).
	 */
	public static function SetKinematic(value:Bool):Void;
	/**
	 * If true, rigid body will be deactivated when added to the simulation (if
	 * it's dynamic, it won't fall).
	 */
	public static function SetStartDeactivated(value:Bool):Void;
	/**
	 * Enable character physics that is driven by the physics engine.
	 */
	public static function SetCharacterPhysics(value:Bool):Void;
	/**
	 * Returns true if this rigid body has character physics enabled.
	 */
	public static function IsCharacterPhysics():Bool;
	/**
	 * Locks the physics to the 2D plane (XY translation, Z rotation).
	 */
	public static function SetLocked2D(value:Bool):Void;
	/**
	 * Returns true if the physics is locked to the 2D plane.
	 */
	public static function IsLocked2D():Bool;
}

/**
 * Describes a Soft Body Physics object.
 */
extern class SoftBodyPhysicsComponent {
	public var Mass:Float;
	public var Friction:Float;
	public var Restitution:Float;
	public var VertexRadius:Float;
	/**
	 * Set how much detail the soft body simulation has compared to the
	 * graphics mesh. Setting this will rebuild the soft body, so individual
	 * physics vertex settings will be lost.
	 */
	public static function SetDetail(value:Float):Void;
	/**
	 * Returns the detail.
	 */
	public static function GetDetail():Float;
	/**
	 * Sets the disable deactivation.
	 */
	public static function SetDisableDeactivation(value:Bool):Void;
	/**
	 * Returns whether disable deactivation.
	 */
	public static function IsDisableDeactivation():Bool;
	/**
	 * Enables or disables wind.
	 */
	public static function SetWindEnabled(value:Bool):Void;
	/**
	 * Returns whether wind enabled.
	 */
	public static function IsWindEnabled():Bool;
	/**
	 * Creates from mesh.
	 */
	public static function CreateFromMesh(mesh:MeshComponent):Void;
}

/**
 * A force field that attracts or repels particles and physics bodies
 * (point or plane type).
 */
extern class ForceFieldComponent {
	public var Type:Int;
	public var Gravity:Float;
	public var Range:Float;
}

/**
 * Global environment settings: sky, fog, wind, stars, rain, ocean, clouds
 * and ambient lighting.
 */
extern class WeatherComponent {
	public var fogHeightSky:Float;
	public var cloudiness:Float;
	public var cloudScale:Float;
	public var cloudSpeed:Float;
	public var cloud_shadow_amount:Float;
	public var cloud_shadow_scale:Float;
	public var cloud_shadow_speed:Float;
	public var rainLength:Float;
	public var skyMapName:String;
	public var colorGradingMapName:String;
	public var volumetricCloudsWeatherMapFirstName:String;
	public var volumetricCloudsWeatherMapSecondName:String;
	public var OceanParameters:OceanParameters;
	public var AtmosphereParameters:AtmosphereParameters;
	public var VolumetricCloudParameters:VolumetricCloudParameters;
	/**
	 * Resource name for sky texture
	 */
	public var SkyMapName:String;
	/**
	 * Resource name for color grading map
	 */
	public var ColorGradingMapName:String;
	public var sunColor:WEVector;
	public var sunDirection:WEVector;
	public var skyExposure:Float;
	public var horizon:WEVector;
	public var zenith:WEVector;
	public var ambient:WEVector;
	public var fogStart:Float;
	public var fogDensity:Float;
	public var fogHeightStart:Float;
	public var fogHeightEnd:Float;
	public var windDirection:WEVector;
	public var windRandomness:Float;
	public var windWaveSize:Float;
	public var windSpeed:Float;
	public var stars:Float;
	public var rainAmount:Float;
	public var rainLenght:Float;
	public var rainSpeed:Float;
	public var rainScale:Float;
	public var rainColor:WEVector;
	public var gravity:WEVector;
	/**
	 * Check if weather's ocean simulation is enabled.
	 */
	public static function IsOceanEnabled():Bool;
	/**
	 * Check if weather's sky is rendered in a simple, unrealistic way.
	 */
	public static function IsSimpleSky():Bool;
	/**
	 * Check if weather's sky is rendered in a physically correct, realistic
	 * way.
	 */
	public static function IsRealisticSky():Bool;
	/**
	 * Check if weather is rendering volumetric clouds.
	 */
	public static function IsVolumetricClouds():Bool;
	/**
	 * Check if weather is rendering height fog visual effect.
	 */
	public static function IsHeightFog():Bool;
	/**
	 * Sets if weather's ocean simulation is enabled or not.
	 */
	public static function SetOceanEnabled(value:Bool):Void;
	/**
	 * Sets if weather's sky is rendered in a simple, unrealistic way or not.
	 */
	public static function SetSimpleSky(value:Bool):Void;
	/**
	 * Sets if weather's sky is rendered in a physically correct, realistic way
	 * or not.
	 */
	public static function SetRealisticSky(value:Bool):Void;
	/**
	 * Sets if weather is rendering volumetric clouds or not.
	 */
	public static function SetVolumetricClouds(value:Bool):Void;
	/**
	 * Sets if weather is rendering height fog visual effect or not.
	 */
	public static function SetHeightFog(value:Bool):Void;
	/**
	 * Returns whether volumetric clouds cast shadow is enabled.
	 */
	public static function IsVolumetricCloudsCastShadow():Bool;
	/**
	 * Returns whether override fog color is enabled.
	 */
	public static function IsOverrideFogColor():Bool;
	/**
	 * Returns whether realistic sky aerial perspective is enabled.
	 */
	public static function IsRealisticSkyAerialPerspective():Bool;
	/**
	 * Returns whether realistic sky high quality is enabled.
	 */
	public static function IsRealisticSkyHighQuality():Bool;
	/**
	 * Returns whether realistic sky receive shadow is enabled.
	 */
	public static function IsRealisticSkyReceiveShadow():Bool;
	/**
	 * Returns whether volumetric clouds receive shadow is enabled.
	 */
	public static function IsVolumetricCloudsReceiveShadow():Bool;
	/**
	 * Sets whether volumetric clouds cast shadow is enabled.
	 */
	public static function SetVolumetricCloudsCastShadow(value:Bool):Void;
	/**
	 * Sets whether override fog color is enabled.
	 */
	public static function SetOverrideFogColor(value:Bool):Void;
	/**
	 * Sets whether realistic sky aerial perspective is enabled.
	 */
	public static function SetRealisticSkyAerialPerspective(value:Bool):Void;
	/**
	 * Sets whether realistic sky high quality is enabled.
	 */
	public static function SetRealisticSkyHighQuality(value:Bool):Void;
	/**
	 * Sets whether realistic sky receive shadow is enabled.
	 */
	public static function SetRealisticSkyReceiveShadow(value:Bool):Void;
	/**
	 * Sets whether volumetric clouds receive shadow is enabled.
	 */
	public static function SetVolumetricCloudsReceiveShadow(value:Bool):Void;
}

/**
 * Parameters of the ocean simulation, accessed through
 * weather.OceanParameters.
 */
extern class OceanParameters {
	public var dmap_dim:Int;
	public var patch_length:Float;
	public var time_scale:Float;
	public var wave_amplitude:Float;
	public var wind_dir:WEVector;
	public var wind_speed:Float;
	public var wind_dependency:Float;
	public var choppy_scale:Float;
	public var waterColor:WEVector;
	public var waterHeight:Float;
	public var surfaceDetail:Int;
	public var surfaceDisplacementTolerance:Float;
}

/**
 * Physically based atmosphere and sky parameters, accessed through
 * weather.AtmosphereParameters.
 */
extern class AtmosphereParameters {
	public var bottomRadius:Float;
	public var topRadius:Float;
	public var planetCenter:WEVector;
	public var rayleighDensityExpScale:Float;
	public var rayleighScattering:WEVector;
	public var mieDensityExpScale:Float;
	public var mieScattering:WEVector;
	public var mieExtinction:WEVector;
	public var mieAbsorption:WEVector;
	public var miePhaseG:Float;
	public var absorptionDensity0LayerWidth:Float;
	public var absorptionDensity0ConstantTerm:Float;
	public var absorptionDensity0LinearTerm:Float;
	public var absorptionDensity1ConstantTerm:Float;
	public var absorptionDensity1LinearTerm:Float;
	public var absorptionExtinction:WEVector;
	public var groundAlbedo:WEVector;
}

/**
 * Volumetric cloud rendering parameters, accessed through
 * `weather.VolumetricCloudParameters`.
 */
extern class VolumetricCloudParameters {
	public var cloudAmbientGroundMultiplier:Float;
	public var horizonBlendAmount:Float;
	public var horizonBlendPower:Float;
	public var cloudStartHeight:Float;
	public var cloudThickness:Float;
	public var animationMultiplier:Float;
	public var albedoFirst:WEVector;
	public var extinctionCoefficientFirst:WEVector;
	public var skewAlongWindDirectionFirst:Float;
	public var totalNoiseScaleFirst:Float;
	public var curlScaleFirst:Float;
	public var curlNoiseModifierFirst:Float;
	public var detailScaleFirst:Float;
	public var detailNoiseModifierFirst:Float;
	public var skewAlongCoverageWindDirectionFirst:Float;
	public var weatherScaleFirst:Float;
	public var coverageAmountFirst:Float;
	public var coverageMinimumFirst:Float;
	public var typeAmountFirst:Float;
	public var typeMinimumFirst:Float;
	public var rainAmountFirst:Float;
	public var rainMinimumFirst:Float;
	public var gradientSmallFirst:Float;
	public var gradientMediumFirst:Float;
	public var gradientLargeFirst:Float;
	public var anvilDeformationSmallFirst:Float;
	public var anvilDeformationMediumFirst:Float;
	public var anvilDeformationLargeFirst:Float;
	public var windSpeedFirst:Float;
	public var windAngleFirst:Float;
	public var windUpAmountFirst:Float;
	public var coverageWindSpeedFirst:Float;
	public var coverageWindAngleFirst:Float;
	public var albedoSecond:WEVector;
	public var extinctionCoefficientSecond:WEVector;
	public var skewAlongWindDirectionSecond:Float;
	public var totalNoiseScaleSecond:Float;
	public var curlScaleSecond:Float;
	public var curlNoiseModifierSecond:Float;
	public var detailScaleSecond:Float;
	public var detailNoiseModifierSecond:Float;
	public var skewAlongCoverageWindDirectionSecond:Float;
	public var weatherScaleSecond:Float;
	public var coverageAmountSecond:Float;
	public var coverageMinimumSecond:Float;
	public var typeAmountSecond:Float;
	public var typeMinimumSecond:Float;
	public var rainAmountSecond:Float;
	public var rainMinimumSecond:Float;
	public var gradientSmallSecond:Float;
	public var gradientMediumSecond:Float;
	public var gradientLargeSecond:Float;
	public var anvilDeformationSmallSecond:Float;
	public var anvilDeformationMediumSecond:Float;
	public var anvilDeformationLargeSecond:Float;
	public var windSpeedSecond:Float;
	public var windAngleSecond:Float;
	public var windUpAmountSecond:Float;
	public var coverageWindSpeedSecond:Float;
	public var coverageWindAngleSecond:Float;
}

/**
 * Describes a Sound object.
 */
extern class SoundComponent {
	public var Filename:String;
	public var Volume:Float;
	/**
	 * Plays the sound.
	 */
	public static function Play():Void;
	/**
	 * Stop the sound.
	 */
	public static function Stop():Void;
	/**
	 * Sets if the sound is looping when playing.
	 */
	public static function SetLooped(value:Bool):Void;
	/**
	 * Disable/Enable 3D sounds.
	 */
	public static function SetDisable3D(value:Bool):Void;
	/**
	 * Check if sound is playing.
	 */
	public static function IsPlaying():Bool;
	/**
	 * Check if sound is looping.
	 */
	public static function IsLooped():Bool;
	/**
	 * Sets the sound.
	 */
	public static function SetSound(sound:Sound):Void;
	/**
	 * Sets the sound instance.
	 */
	public static function SetSoundInstance(inst:SoundInstance):Void;
	/**
	 * Returns the sound.
	 */
	public static function GetSound():Sound;
	/**
	 * Returns the sound instance.
	 */
	public static function GetSoundInstance():SoundInstance;
	/**
	 * Sets the sound file path.
	 */
	public static function SetFilename(filename:String):Void;
	/**
	 * Sets the playback volume.
	 */
	public static function SetVolume(volume:Float):Void;
	/**
	 * Returns the sound file path.
	 */
	public static function GetFilename():String;
	/**
	 * Returns the playback volume.
	 */
	public static function GetVolume():Float;
	/**
	 * Returns whether 3D spatialization is disabled.
	 */
	public static function IsDisable3D():Bool;
}

/**
 * Plays a video file within the scene.
 */
extern class VideoComponent {
	public var Filename:String;
	/**
	 * Play.
	 */
	public static function Play():Void;
	/**
	 * Stop.
	 */
	public static function Stop():Void;
	/**
	 * Sets the looped.
	 */
	public static function SetLooped(value:Bool):Void;
	/**
	 * Returns whether playing.
	 */
	public static function IsPlaying():Bool;
	/**
	 * Returns whether looped.
	 */
	public static function IsLooped():Bool;
	/**
	 * Returns video length in seconds.
	 */
	public static function GetLength():Float;
	/**
	 * Returns the current timer in seconds.
	 */
	public static function GetCurrentTimer():Float;
	/**
	 * Sets the decoder state to be decoding from specific time in seconds
	 * (approximately).
	 */
	public static function Seek(timerSeconds:Float):Void;
	/**
	 * Sets the video.
	 */
	public static function SetVideo(video:Video):Void;
	/**
	 * Sets the video instance.
	 */
	public static function SetVideoInstance(instance:VideoInstance):Void;
	/**
	 * Returns the video.
	 */
	public static function GetVideo():Video;
	/**
	 * Returns the video instance.
	 */
	public static function GetVideoInstance():VideoInstance;
	/**
	 * Sets the video file path.
	 */
	public static function SetFilename(filename:String):Void;
	/**
	 * Returns the video file path.
	 */
	public static function GetFilename():String;
}

/**
 * A simple collision primitive (sphere, capsule or plane) used for
 * character and soft-body collision.
 */
extern class ColliderComponent {
	/**
	 * Shape of the collider
	 */
	public var Shape:Int;
	public var Radius:Float;
	public var Offset:WEVector;
	public var Tail:WEVector;
	/**
	 * Enables or disables CPU.
	 */
	public static function SetCPUEnabled(value:Bool):Void;
	/**
	 * Enables or disables GPU.
	 */
	public static function SetGPUEnabled(value:Bool):Void;
	/**
	 * Returns the capsule.
	 */
	public static function GetCapsule():Capsule;
	/**
	 * Returns the sphere.
	 */
	public static function GetSphere():Sphere;
}

/**
 * Controls facial expressions and blend-shape weights of a character.
 */
extern class ExpressionComponent {
	/**
	 * Find an expression within the ExpressionComponent by name.
	 */
	public static function FindExpressionID(name:String):Int;
	/**
	 * Set expression weight by ID. The ID can be a non-preset expression. Use
	 * FindExpressionID() to retrieve non-preset expression IDs.
	 */
	public static function SetWeight(id:Int, weight:Float):Void;
	/**
	 * Returns current weight of expression.
	 */
	public static function GetWeight(id:Int):Float;
	/**
	 * Set a preset expression's weight. You can get access to preset values
	 * from ExpressionPreset table.
	 */
	public static function SetPresetWeight(preset:ExpressionPreset, weight:Float):Void;
	/**
	 * Returns current weight of preset expression.
	 */
	public static function GetPresetWeight(preset:ExpressionPreset):Float;
	/**
	 * Force continuous talking animation, even if no voice is playing.
	 */
	public static function SetForceTalkingEnabled(value:Bool):Void;
	/**
	 * Returns whether force talking enabled.
	 */
	public static function IsForceTalkingEnabled():Bool;
	/**
	 * Sets the preset override mouth.
	 */
	public static function SetPresetOverrideMouth(preset:ExpressionPreset, override_:ExpressionOverride):Void;
	/**
	 * Sets the preset override blink.
	 */
	public static function SetPresetOverrideBlink(preset:ExpressionPreset, override_:ExpressionOverride):Void;
	/**
	 * Sets the preset override look.
	 */
	public static function SetPresetOverrideLook(preset:ExpressionPreset, override_:ExpressionOverride):Void;
	/**
	 * Sets the override mouth.
	 */
	public static function SetOverrideMouth(id:Int, override_:ExpressionOverride):Void;
	/**
	 * Sets the override blink.
	 */
	public static function SetOverrideBlink(id:Int, override_:ExpressionOverride):Void;
	/**
	 * Sets the override look.
	 */
	public static function SetOverrideLook(id:Int, override_:ExpressionOverride):Void;
}

/**
 * Maps an entity's skeleton onto standard humanoid bones, enabling
 * retargeting and ragdoll.
 */
extern class HumanoidComponent {
	/**
	 * Get the entity that is mapped to the specified humanoid bone. Use
	 * HumanoidBone table to get access to humanoid bone values.
	 */
	public static function GetBoneEntity(bone:HumanoidBone):Int;
	/**
	 * Enable/disable automatic lookAt (for head and eyes movement).
	 */
	public static function SetLookAtEnabled(value:Bool):Void;
	/**
	 * Set a target lookAt position (for head an eyes movement).
	 */
	public static function SetLookAt(value:WEVector):Void;
	/**
	 * Activate dynamic ragdoll physics. Note that kinematic ragdoll physics is
	 * always active (ragdoll is animation-driven/kinematic by default).
	 */
	public static function SetRagdollPhysicsEnabled(value:Bool):Void;
	/**
	 * Returns whether ragdoll physics enabled.
	 */
	public static function IsRagdollPhysicsEnabled():Bool;
	/**
	 * Completely disables ragdoll physics object creation for this humanoid.
	 */
	public static function SetRagdollDisabled(value:Bool):Void;
	/**
	 * Returns whether ragdoll disabled.
	 */
	public static function IsRagdollDisabled():Bool;
	/**
	 * Lock ragdoll to the 2D plane (XY translation, Z rotation).
	 */
	public static function SetRagdoll2D(value:Bool):Void;
	/**
	 * Returns whether it's ragdoll2d.
	 */
	public static function IsRagdoll2D():Bool;
	/**
	 * Turn off intersection test for this ragdoll. This only affects direct
	 * intersection check with Scene::Intersects().
	 */
	public static function SetIntersectionDisabled(value:Bool):Void;
	/**
	 * Returns whether intersection disabled.
	 */
	public static function IsIntersectionDisabled():Bool;
	/**
	 * Control the overall fatness of the ragdoll body parts except head
	 * (default: 1).
	 */
	public static function SetRagdollFatness(value:Float):Void;
	/**
	 * Control the overall size of the ragdoll head (default: 1).
	 */
	public static function SetRagdollHeadSize(value:Float):Void;
	/**
	 * Returns the ragdoll fatness.
	 */
	public static function GetRagdollFatness():Float;
	/**
	 * Returns the ragdoll head size.
	 */
	public static function GetRagdollHeadSize():Float;
	/**
	 * Dynamically modify arm spacing after animation (negative: pull together,
	 * positive: push apart).
	 */
	public static function SetArmSpacing(value:Float):Void;
	/**
	 * Returns the arm spacing.
	 */
	public static function GetArmSpacing():Float;
	/**
	 * Dynamically modify leg spacing after animation (negative: pull together,
	 * positive: push apart).
	 */
	public static function SetLegSpacing(value:Float):Void;
	/**
	 * Returns the leg spacing.
	 */
	public static function GetLegSpacing():Float;
}

/**
 * The decal component is a textured sticker that can be put down onto
 * meshes. Most of the properties can be controlled through an attached
 * `TransformComponent` and `MaterialComponent`.
 */
extern class DecalComponent {
	/**
	 * Set decal to only use alpha from base color texture. Useful for blending
	 * normalmap-only decals.
	 */
	public static function SetBaseColorOnlyAlpha(value:Bool):Void;
	/**
	 * Returns whether base color only alpha.
	 */
	public static function IsBaseColorOnlyAlpha():Bool;
	/**
	 * Sets the slope blend power.
	 */
	public static function SetSlopeBlendPower(value:Float):Void;
	/**
	 * Returns the slope blend power.
	 */
	public static function GetSlopeBlendPower():Float;
}

/**
 * The metadata component can store and retrieve an arbitrary amount of
 * named user values for an entity. It is possible to use the same name for
 * multiple of different value types, but one value can not have multiple
 * entries with the same name.
 */
extern class MetadataComponent {
	/**
	 * Returns whether it has bool.
	 */
	public static function HasBool(name:String):Bool;
	/**
	 * Returns whether it has int.
	 */
	public static function HasInt(name:String):Bool;
	/**
	 * Returns whether it has float.
	 */
	public static function HasFloat(name:String):Bool;
	/**
	 * Returns whether it has string.
	 */
	public static function HasString(name:String):Bool;
	/**
	 * Returns the preset.
	 */
	public static function GetPreset():Int;
	/**
	 * Returns the bool.
	 */
	public static function GetBool(name:String):Bool;
	/**
	 * Returns the int.
	 */
	public static function GetInt(name:String):Int;
	/**
	 * Returns the float.
	 */
	public static function GetFloat(name:String):Float;
	/**
	 * Returns the string.
	 */
	public static function GetString(name:String):Dynamic;
	/**
	 * Sets the preset.
	 */
	public static function SetPreset(preset:Int):Void;
	/**
	 * Sets the bool.
	 */
	public static function SetBool(name:String, value:Bool):Void;
	/**
	 * Sets the int.
	 */
	public static function SetInt(name:String, value:Int):Void;
	/**
	 * Sets the float.
	 */
	public static function SetFloat(name:String, value:Float):Void;
	/**
	 * Sets the string.
	 */
	public static function SetString(name:String, value:String):Void;
}

/**
 * Implementation of basic character controller features such as movement
 * in the scene, inverse kinematics for legs, swimming, water ripples, etc.
 * Note that CharacterComponent is NOT using physics, but a custom
 * character logic. The character will collide with other characters,
 * objects that are tagged as Navmesh, and colliders that are tagged with
 * CPU enabled.
 */
extern class CharacterComponent {
	/**
	 * Enable/disable character processing (enabled by default).
	 */
	public static function SetActive(value:Bool):Void;
	/**
	 * Returns whether the character processing is active or not.
	 */
	public static function IsActive():Bool;
	/**
	 * Move the character in a direction continuously. The given vector doesn't
	 * need to be normalized, the length of it corresponds to the movement
	 * amount. The character will be moved the next time the scene is updated.
	 * The movement will be blocked by objects tagged as navigation mesh and
	 * CPU colliders. If this entity has a layer component, the layer will be
	 * used to ensure that the character doesn't collide with that layer.
	 */
	public static function Move(value:WEVector):Void;
	/**
	 * Similar to Move, but relative to the facing direction.
	 */
	public static function Strafe(value:WEVector):Void;
	/**
	 * Jump upwards by an amount. The jump will be executed in the next scene
	 * update, with collisions.
	 */
	public static function Jump(amount:Float):Void;
	/**
	 * Turn towards a direction continuously.
	 */
	public static function Turn(value:WEVector):Void;
	/**
	 * Lean sideways, negative values mean left, positive values mean right.
	 */
	public static function Lean(value:Float):Void;
	/**
	 * Apply shaking to the character. horizontal, vertical: movement amount in
	 * directions; frequency: speed of movement; decay: speed of slowing down.
	 */
	public static function Shake(horizontal:Float, ?vertical:Float, ?frequency:Float, ?decay:Float):Void;
	/**
	 * Adds animation for tracking blending state. The simple animation
	 * blending will perform blend-out for each animation except the currenttly
	 * active one.
	 */
	public static function AddAnimation(entity:Int):Void;
	/**
	 * Play the animation. This will be blended in as primary animation, others
	 * will be belnded out.
	 */
	public static function PlayAnimation(entity:Int):Void;
	/**
	 * Stops current animation.
	 */
	public static function StopAnimation():Void;
	/**
	 * Set target blend amount of current animation.
	 */
	public static function SetAnimationAmount(value:Float):Void;
	/**
	 * Returns target blend amount of current animation.
	 */
	public static function GetAnimationAmount():Float;
	/**
	 * Returns the timer of current animation.
	 */
	public static function GetAnimationTimer():Float;
	/**
	 * Returns true if the current animation is ended, false otherwise.
	 */
	public static function IsAnimationEnded():Bool;
	/**
	 * Velocity multiplier when moving on ground, default: 0.92.
	 */
	public static function SetGroundFriction(value:Float):Void;
	/**
	 * Velocity multiplier when swimming in water, default: 0.9.
	 */
	public static function SetWaterFriction(value:Float):Void;
	/**
	 * Slope detection threshold, default: 0.2.
	 */
	public static function SetSlopeThreshold(value:Float):Void;
	/**
	 * Leaning min/max clamping, default: 0.12.
	 */
	public static function SetLeaningLimit(value:Float):Void;
	/**
	 * Turning smoothing speed when using Turn(), default: 10.0.
	 */
	public static function SetTurningSpeed(value:Float):Void;
	/**
	 * Frame rate of simulation, default: 120.
	 */
	public static function SetFixedUpdateFPS(value:Float):Void;
	/**
	 * Gravity value, default: -30.
	 */
	public static function SetGravity(value:Float):Void;
	/**
	 * Vertical offset to keep from water. Useful if character is too submerged
	 * in the swimming state.
	 */
	public static function SetWaterVerticalOffset(value:Float):Void;
	/**
	 * Set health of the character.
	 */
	public static function SetHealth(value:Int):Void;
	/**
	 * Set the horizontal size of the character capsule (same as capsule
	 * radius).
	 */
	public static function SetWidth(value:Float):Void;
	/**
	 * Set the vertical size of the character capsule (same as capsule height).
	 */
	public static function SetHeight(value:Float):Void;
	/**
	 * Apply an overall scale on the character.
	 */
	public static function SetScale(value:Float):Void;
	/**
	 * Set current position immediately (teleport).
	 */
	public static function SetPosition(value:WEVector):Void;
	/**
	 * Set current velocity immediately.
	 */
	public static function SetVelocity(value:WEVector):Void;
	/**
	 * Set the facing direction of the character.
	 */
	public static function SetFacing(value:WEVector):Void;
	/**
	 * Apply a relative offset (relative to facing direction).
	 */
	public static function SetRelativeOffset(value:WEVector):Void;
	/**
	 * Enable/disable foot placement with inverse kinematics.
	 */
	public static function SetFootPlacementEnabled(value:Bool):Void;
	/**
	 * Set whether character collision with other characters is disabled or not
	 * for this character (default: false).
	 */
	public static function SetCharacterToCharacterCollisionDisabled(value:Bool):Void;
	/**
	 * locks the character position to the 2D plane (XY translation, rotation
	 * is unlocked but it can only move sideways).
	 */
	public static function SetLocked2D(value:Bool):Void;
	/**
	 * Returns true if the position is locked to the 2D plane.
	 */
	public static function IsLocked2D():Bool;
	/**
	 * Get the current health.
	 */
	public static function GetHealth():Int;
	/**
	 * Get the horizontal size of the character capsule (same as capsule
	 * radius).
	 */
	public static function GetWidth():Float;
	/**
	 * Get the vertical size of the character capsule (same as capsule height).
	 */
	public static function GetHeight():Float;
	/**
	 * Get the overall scale of the character.
	 */
	public static function GetScale():Float;
	/**
	 * Retrieve the current position without interpolation (this is the raw
	 * value from fixed timestep update)
	 */
	public static function GetPosition():WEVector;
	/**
	 * Retrieve the current position with interpolation (this is the position
	 * that is rendered).
	 */
	public static function GetPositionInterpolated():WEVector;
	/**
	 * Get current velocity.
	 */
	public static function GetVelocity():WEVector;
	/**
	 * Get current movement direction.
	 */
	public static function GetMovement():WEVector;
	/**
	 * Returns whether the character is currently standing on ground or not.
	 */
	public static function IsGrounded():Bool;
	/**
	 * Returns whether the character is currently intersecting a wall or not.
	 */
	public static function IsWallIntersect():Bool;
	/**
	 * Returns whether the character is currently swimming or not.
	 */
	public static function IsSwimming():Bool;
	/**
	 * Returns whether foot placement with inverse kinematics is currently
	 * enabled or not.
	 */
	public static function IsFootPlacementEnabled():Bool;
	/**
	 * Returns whether character collision with other characters is disabled or
	 * not for this character (default: false).
	 */
	public static function IsCharacterToCharacterCollisionDisabled():Void;
	/**
	 * Returns the capsule representing the character.
	 */
	public static function GetCapsule():Capsule;
	/**
	 * Returns the immediate facing of the character.
	 */
	public static function GetFacing():WEVector;
	/**
	 * Returns the smoothed facing of the character.
	 */
	public static function GetFacingSmoothed():WEVector;
	/**
	 * Returns the relative offset (relative to facing direction).
	 */
	public static function GetRelativeOffset():WEVector;
	/**
	 * Returns immediate leaning amount.
	 */
	public static function GetLeaning():Float;
	/**
	 * Returns smoothed leaning amount.
	 */
	public static function GetLeaningSmoothed():Float;
	/**
	 * Returns vertical offset that accounts for character's position after
	 * foot placements.
	 */
	public static function GetFootOffset():Float;
	/**
	 * Set the goal for path finding, it will be processed the next time the
	 * scene is updated. You can get the results by accessing the pathquery
	 * object of the character with GetPathQuery().
	 */
	public static function SetPathGoal(goal:WEVector, voxelgrid:VoxelGrid):Void;
	/**
	 * Returns the PathQuery object of this character.
	 */
	public static function GetPathQuery():PathQuery;
	/**
	 * Sets whether a dedicated shadow is used.
	 */
	public static function SetDedicatedShadow(value:Bool):Void;
	/**
	 * Returns whether a dedicated shadow is used.
	 */
	public static function IsDedicatedShadow():Bool;
}

extern class SceneSystemUsingEntityComponentSystemGlobals {

	/**
	 * The invalid/no-entity sentinel value (0).
	 */
	public static var INVALID_ENTITY:Int;

	/**
	 * Creates a custom scene.
	 */
	public static function Scene():Scene;

	/**
	 * Returns the global scene.
	 */
	public static function GetScene():Scene;

	/**
	 * Returns the global camera.
	 */
	public static function GetCamera():CameraComponent;

	@:overload(function(scene:Scene, fileName:String, ?transform:Matrix):Int {})
	/**
	 * Load Model from file. returns a root entity that everything in this
	 * model is attached to.
	 */
	public static function LoadModel(fileName:String, ?transform:Matrix):Int;

	/**
	 * Perform ray-picking in the scene. pickType is a bitmask specifying
	 * object types to check against. layerMask is a bitmask specifying which
	 * layers to check against. Scene parameter is optional and will use the
	 * global scene if not specified. (deprecated, you can use the scene's
	 * Intersects() function instead).
	 */
	public static function Pick(ray:Ray, ?filterMask:Int, ?layerMask:Int, ?scene:Scene, ?lod:Int):Int;

	/**
	 * Perform ray-picking in the scene. pickType is a bitmask specifying
	 * object types to check against. layerMask is a bitmask specifying which
	 * layers to check against. Scene parameter is optional and will use the
	 * global scene if not specified. (deprecated, you can use the scene's
	 * Intersects() function instead)
	 */
	public static function SceneIntersectSphere(sphere:Sphere, ?filterMask:Int, ?layerMask:Int, ?scene:Scene, ?lod:Int):Int;

	/**
	 * Perform ray-picking in the scene. pickType is a bitmask specifying
	 * object types to check against. layerMask is a bitmask specifying which
	 * layers to check against. Scene parameter is optional and will use the
	 * global scene if not specified. (deprecated, you can use the scene's
	 * Intersects() function instead)
	 */
	public static function SceneIntersectCapsule(capsule:Capsule, ?filterMask:Int, ?layerMask:Int, ?scene:Scene, ?lod:Int):Int;

	/**
	 * Creates an empty entity and returns it.
	 */
	public static function CreateEntity():Int;

	/**
	 * Creates an empty RayIntersectionResult. Normally these are returned by
	 * `scene.IntersectsAll`, not constructed directly.
	 */
	public static function RayIntersectionResult():RayIntersectionResult;

	/**
	 * Creates an empty SphereIntersectionResult. Normally these are returned
	 * by `scene.IntersectsAll`, not constructed directly.
	 */
	public static function SphereIntersectionResult():SphereIntersectionResult;

	/**
	 * Creates a new, standalone NameComponent that owns its own data.
	 */
	public static function NameComponent():NameComponent;

	/**
	 * Creates a new, standalone LayerComponent that owns its own data.
	 */
	public static function LayerComponent():LayerComponent;

	/**
	 * Creates a new, standalone TransformComponent that owns its own data.
	 */
	public static function TransformComponent():TransformComponent;

	/**
	 * Creates a new, standalone CameraComponent that owns its own data.
	 */
	public static function CameraComponent():CameraComponent;

	/**
	 * Creates a new, standalone AnimationComponent that owns its own data.
	 */
	public static function AnimationComponent():AnimationComponent;

	/**
	 * Creates a new, standalone MaterialComponent that owns its own data.
	 */
	public static function MaterialComponent():MaterialComponent;

	/**
	 * Creates a new, standalone MeshComponent that owns its own data.
	 */
	public static function MeshComponent():MeshComponent;

	/**
	 * Creates a new, standalone EmitterComponent that owns its own data.
	 */
	public static function EmitterComponent():EmitterComponent;

	/**
	 * Creates a new, standalone HairParticleSystem that owns its own data.
	 */
	public static function HairParticleSystem():HairParticleSystem;

	/**
	 * Creates a new, standalone LightComponent that owns its own data.
	 */
	public static function LightComponent():LightComponent;

	/**
	 * Creates a new, standalone ObjectComponent that owns its own data.
	 */
	public static function ObjectComponent():ObjectComponent;

	/**
	 * Creates a new, standalone InverseKinematicsComponent that owns its
	 * own data.
	 */
	public static function InverseKinematicsComponent():InverseKinematicsComponent;

	/**
	 * Creates a new, standalone SpringComponent that owns its own data.
	 */
	public static function SpringComponent():SpringComponent;

	/**
	 * Creates a new, standalone ScriptComponent that owns its own data.
	 */
	public static function ScriptComponent():ScriptComponent;

	/**
	 * Creates a new, standalone RigidBodyPhysicsComponent that owns its
	 * own data.
	 */
	public static function RigidBodyPhysicsComponent():RigidBodyPhysicsComponent;

	/**
	 * Creates a new, standalone SoftBodyPhysicsComponent that owns its
	 * own data.
	 */
	public static function SoftBodyPhysicsComponent():SoftBodyPhysicsComponent;

	/**
	 * Creates a new, standalone ForceFieldComponent that owns its own data.
	 */
	public static function ForceFieldComponent():ForceFieldComponent;

	/**
	 * Creates a new, standalone WeatherComponent that owns its own data.
	 */
	public static function WeatherComponent():WeatherComponent;

	/**
	 * Creates a new, standalone OceanParameters that owns its own data.
	 */
	public static function OceanParameters():OceanParameters;

	/**
	 * Creates a new, standalone AtmosphereParameters that owns its own data.
	 */
	public static function AtmosphereParameters():AtmosphereParameters;

	/**
	 * Creates a new, standalone VolumetricCloudParameters that owns its
	 * own data.
	 */
	public static function VolumetricCloudParameters():VolumetricCloudParameters;

	/**
	 * Creates a new, standalone SoundComponent that owns its own data.
	 */
	public static function SoundComponent():SoundComponent;

	/**
	 * Creates a new, standalone VideoComponent that owns its own data.
	 */
	public static function VideoComponent():VideoComponent;

	/**
	 * Creates a new, standalone ColliderComponent that owns its own data.
	 */
	public static function ColliderComponent():ColliderComponent;

	/**
	 * Creates a new, standalone ExpressionComponent that owns its own data.
	 */
	public static function ExpressionComponent():ExpressionComponent;

	/**
	 * Creates a new, standalone HumanoidComponent that owns its own data.
	 */
	public static function HumanoidComponent():HumanoidComponent;

	/**
	 * Creates a new, standalone DecalComponent that owns its own data.
	 */
	public static function DecalComponent():DecalComponent;

	/**
	 * Creates a new, standalone MetadataComponent that owns its own data.
	 */
	public static function MetadataComponent():MetadataComponent;

	/**
	 * Creates a new, standalone CharacterComponent that owns its own data.
	 */
	public static function CharacterComponent():CharacterComponent;

}