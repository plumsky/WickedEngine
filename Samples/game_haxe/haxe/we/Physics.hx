// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Physics
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;
import we.Primitives.Ray;
import we.SceneSystemUsingEntityComponentSystem.HumanoidBone;
import we.SceneSystemUsingEntityComponentSystem.HumanoidComponent;
import we.SceneSystemUsingEntityComponentSystem.RigidBodyPhysicsComponent;
import we.SceneSystemUsingEntityComponentSystem.Scene;
import we.SceneSystemUsingEntityComponentSystem.SoftBodyPhysicsComponent;

/**
 * Describes how a character controller is currently supported by the
 * ground.
 */
enum abstract CharacterGroundStates(Int) from Int to Int {
	public static inline var OnGround = 0;
	public static inline var OnSteepGround = 1;
	public static inline var NotSupported = 2;
	public static inline var InAir = 3;
}

/**
 * Types of physics constraint that can link two rigid bodies.
 */
enum abstract ConstraintType(Int) from Int to Int {
	public static inline var Fixed = 0;
	public static inline var Point = 1;
}

/**
 * Global physics system. Use the global `physics` object to control and
 * query the physics simulation.
 */
extern class Physics {
	/**
	 * Enable/disable the physics engine all together.
	 */
	public static function SetEnabled(value:Bool):Void;
	/**
	 * Returns whether physics is enabled.
	 */
	public static function IsEnabled():Bool;
	/**
	 * Enable/disable the physics simulation. Physics engine state will be
	 * updated but not simulated
	 */
	public static function SetSimulationEnabled(value:Bool):Void;
	/**
	 * Returns whether simulation enabled.
	 */
	public static function IsSimulationEnabled():Bool;
	/**
	 * Enable/disable the physics interpolation. When enabled, simulation's
	 * fixed frame rate will be interpolated to match the variable frame rate
	 * of rendering
	 */
	public static function SetInterpolationEnabled(value:Bool):Void;
	/**
	 * Returns whether interpolation enabled.
	 */
	public static function IsInterpolationEnabled():Bool;
	/**
	 * Enable/disable debug drawing of physics objects.
	 */
	public static function SetDebugDrawEnabled(value:Bool):Void;
	/**
	 * Returns whether debug draw enabled.
	 */
	public static function IsDebugDrawEnabled():Bool;
	/**
	 * Set the accuracy of the simulation. This value corresponds to maximum
	 * simulation step count. Higher values will be slower but more accurate.
	 */
	public static function SetAccuracy(value:Int):Void;
	/**
	 * Returns the accuracy.
	 */
	public static function GetAccuracy():Int;
	/**
	 * Set the frames per second resolution of physics simulation
	 * (default = 120 FPS).
	 */
	public static function SetFrameRate(value:Float):Void;
	/**
	 * Returns the frame rate.
	 */
	public static function GetFrameRate():Float;
	/**
	 * returns linear velocity of the body in the latest simulation step.
	 */
	public static function GetVelocity(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns current position of the body in the latest simulation step.
	 */
	public static function GetPosition(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns current rotation of the body in the latest simulation step.
	 */
	public static function GetRotation(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns the ground position of the rigidbody if it has character physics
	 * enabled.
	 */
	public static function GetCharacterGroundPosition(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns the ground normal of the rigidbody if it has character physics
	 * enabled.
	 */
	public static function GetCharacterGroundNormal(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns the ground velocity of the rigidbody if it has character physics
	 * enabled.
	 */
	public static function GetCharacterGroundVelocity(component:RigidBodyPhysicsComponent):WEVector;
	/**
	 * Returns true if the character physics is supported by normal or steep
	 * ground.
	 */
	public static function IsCharacterGroundSupported(component:RigidBodyPhysicsComponent):Bool;
	/**
	 * Returns the `CharacterGroundStates` of the character physics.
	 */
	public static function GetCharacterGroundState(component:RigidBodyPhysicsComponent):CharacterGroundStates;
	/**
	 * Changes the physics character's shape into a capsule with specified
	 * height and radius. Returns true if successful, false otherwise. Failure
	 * means that something is blocking the character.
	 */
	public static function ChangeCharacterShape(component:RigidBodyPhysicsComponent, height:Float, radius:Float):Bool;
	/**
	 * Applies movement logic to physics character.
	 */
	public static function MoveCharacter(component:RigidBodyPhysicsComponent, movement_direction:WEVector, ?movement_speed:Float, ?jump:Float, ?controlMovementDuringJump:Bool):Void;
	/**
	 * Enable/disable ghost mode for rigid body or ragdoll (all collision
	 * disabled).
	 */
	public static function SetGhostMode(component:Dynamic, value:Bool):Void;
	/**
	 * Enable/disable ghost mode for a ragdoll. In ghost mode, the ragdoll will
	 * not collide with anything. Enable this if the humanoid sits inside a
	 * vehicle for example.
	 */
	public static function SetRagdollGhostMode(humanoid:HumanoidComponent, value:Bool):Void;
	/**
	 * Teleport a dynamic body.
	 */
	public static function SetPosition(component:RigidBodyPhysicsComponent, position:WEVector):Void;
	/**
	 * Teleport a dynamic body.
	 */
	public static function SetPositionAndRotation(component:RigidBodyPhysicsComponent, position:WEVector, rotationQuaternion:WEVector):Void;
	/**
	 * Set the linear velocity manually.
	 */
	public static function SetLinearVelocity(component:RigidBodyPhysicsComponent, velocity:WEVector):Void;
	/**
	 * Set the angular velocity manually.
	 */
	public static function SetAngularVelocity(component:RigidBodyPhysicsComponent, velocity:WEVector):Void;
	/**
	 * Apply force at body center.
	 */
	public static function ApplyForce(component:RigidBodyPhysicsComponent, force:WEVector):Void;
	/**
	 * Apply force at body local position (at_local controls whether the at is
	 * in body's local space or not).
	 */
	public static function ApplyForceAt(component:RigidBodyPhysicsComponent, force:WEVector, at:WEVector, at_local:Bool):Void;
	@:overload(function(humanoid:HumanoidComponent, bone:HumanoidBone, impulse:WEVector):Void {})
	/**
	 * Apply impulse at body center.
	 */
	public static function ApplyImpulse(component:RigidBodyPhysicsComponent, impulse:WEVector):Void;
	@:overload(function(humanoid:HumanoidComponent, bone:HumanoidBone, impulse:WEVector, at:WEVector, at_local:Bool):Void {})
	/**
	 * Apply impulse at body local position (at_local controls whether the `at`
	 * is in body's local space or not).
	 */
	public static function ApplyImpulseAt(component:RigidBodyPhysicsComponent, impulse:WEVector, at:WEVector, at_local:Bool):Void;
	/**
	 * Apply torque at body center.
	 */
	public static function ApplyTorque(component:RigidBodyPhysicsComponent, torque:WEVector):Void;
	/**
	 * Activate all rigid bodies in the scene
	 */
	public static function ActivateAllRigidBodies(scene:Scene):Void;
	/**
	 * Reset all rigid bodies to their initial orientations.
	 */
	public static function ResetPhysicsObjects(scene:Scene):Void;
	@:overload(function(component:SoftBodyPhysicsComponent, state:Int):Void {})
	/**
	 * Force set activation state to rigid body. Use a value
	 * `ACTIVATION_STATE_ACTIVE` or `ACTIVATION_STATE_INACTIVE`.
	 */
	public static function SetActivationState(component:RigidBodyPhysicsComponent, state:Int):Void;
	/**
	 * Performs physics scene intersection for closest hit with a ray.
	 */
	public static function Intersects(scene:Scene, ray:Ray):Int;
	/**
	 * Set input from driver: forward and right values are values between -1
	 * and 1 to indicate reverse/forward or left/right. brake and handbrake
	 * (handbrake = back brake for motorcycles) are values between 0 and 1.
	 */
	public static function DriveVehicle(rigidbody:RigidBodyPhysicsComponent, ?forward:Float, ?right:Float, ?brake:Float, ?handbrake:Float):Void;
	/**
	 * Signed velocity amount in forward direction.
	 */
	public static function GetVehicleForwardVelocity(rigidbody:RigidBodyPhysicsComponent):Float;
	/**
	 * Pick and drag physics objects such as ragdolls and rigid bodies.
	 */
	public static function PickDrag(scene:Scene, ray:Ray, op:PickDragOperation, ?constraint:ConstraintType, ?break_distance:Float):Void;
	/**
	 * Returns the character collision tolerance distance.
	 */
	public static function GetCharacterCollisionTolerance():Float;
	/**
	 * Sets the character collision tolerance distance.
	 */
	public static function SetCharacterCollisionTolerance(value:Float):Void;
	/**
	 * Optimizes the physics broad phase for the scene. Pass force = true to
	 * rebuild even when not flagged dirty.
	 */
	public static function OptimizeBroadPhase(scene:Scene, ?force:Bool):Void;
}

/**
 * Tracks a physics pick drag operation. Use it with `phyiscs.PickDrag()`
 * function. When using this object first time to PickDrag, the operation
 * will be started and the operation will end when you call Finish() or
 * when the object is destroyed.
 */
extern class PickDragOperation {
	/**
	 * Finish the operation, puts down the physics object.
	 */
	public static function Finish():Void;
}

extern class PhysicsGlobals {

	/**
	 * Creates a Physics object. Use the global `physics` instead of
	 * constructing one.
	 */
	public static function Physics():Physics;

	/**
	 * Creates a PickDragOperation, used to grab and drag physics bodies with
	 * the cursor.
	 */
	public static function PickDragOperation():PickDragOperation;

}