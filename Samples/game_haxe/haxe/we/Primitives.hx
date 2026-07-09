// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Primitives
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.Matrix;
import we.MathTypes.WEVector;

/**
 * A ray defined by an origin Vector and a normalized direction Vector. It
 * can be used to intersect with other primitives or the scene.
 */
extern class Ray {
	public var Origin:WEVector;
	public var Direction:WEVector;
	@:overload(function(sphere:Sphere):Bool {})
	@:overload(function(capsule:Capsule):Bool {})
	@:overload(function(plane:WEVector):WEVector {})
	/**
	 * Returns whether the ray intersects the given AABB.
	 */
	public static function Intersects(aabb:AABB):Bool;
	/**
	 * Returns the origin.
	 */
	public static function GetOrigin():WEVector;
	/**
	 * Returns the direction.
	 */
	public static function GetDirection():WEVector;
	/**
	 * Sets the origin.
	 */
	public static function SetOrigin(vector:WEVector):Void;
	/**
	 * Sets the direction.
	 */
	public static function SetDirection(vector:WEVector):Void;
	/**
	 * Creates a ray from two points. Point a will be the ray origin, pointing
	 * towards point b.
	 */
	public static function CreateFromPoints(a:WEVector, b:WEVector):Void;
	/**
	 * Compute placement orientation matrix at intersection result. This matrix
	 * can be used to place entities in the scene oriented on the surface.
	 */
	public static function GetPlacementOrientation(position:WEVector, normal:WEVector):Matrix;
}

/**
 * Axis Aligned Bounding Box. Can be intersected with other primitives.
 */
extern class AABB {
	public var Min:WEVector;
	public var Max:WEVector;
	/**
	 * Omit the z component for intersection check for more precise 2D
	 * intersection.
	 */
	public static function Intersects2D(aabb:AABB):Bool;
	@:overload(function(sphere:Sphere):Bool {})
	@:overload(function(ray:Ray):Bool {})
	@:overload(function(point:WEVector):Bool {})
	/**
	 * Returns whether this AABB intersects the given AABB.
	 */
	public static function Intersects(aabb:AABB):Bool;
	/**
	 * Returns the minimum corner of the box.
	 */
	public static function GetMin():WEVector;
	/**
	 * Returns the maximum corner of the box.
	 */
	public static function GetMax():WEVector;
	/**
	 * Sets the minimum corner of the box.
	 */
	public static function SetMin(vector:WEVector):Void;
	/**
	 * Sets the maximum corner of the box.
	 */
	public static function SetMax(vector:WEVector):Void;
	/**
	 * Returns the center point of the box.
	 */
	public static function GetCenter():WEVector;
	/**
	 * Returns the half-extents (half the size along each axis) of the box.
	 */
	public static function GetHalfExtents():WEVector;
	/**
	 * Transforms the AABB with a matrix and returns the resulting conservative
	 * AABB.
	 */
	public static function Transform(matrix:Matrix):AABB;
	/**
	 * Get a matrix that represents the AABB as OBB (oriented bounding box).
	 */
	public static function GetAsBoxMatrix():Matrix;
	/**
	 * Projects the AABB to the screen, returns a 2D rectangle in UV-space as
	 * Vector(topleftX, topleftY, bottomrightX, bottomrightY), each value is in
	 * range [0, 1].
	 */
	public static function ProjectToScreen(ViewProjection:Matrix):WEVector;
}

/**
 * Sphere defined by center Vector and radius. Can be intersected with
 * other primitives.
 */
extern class Sphere {
	public var Center:WEVector;
	public var Radius:Float;
	@:overload(function(sphere:Sphere):Bool {})
	@:overload(function(capsule:Capsule):Bool {})
	@:overload(function(ray:Ray):Bool {})
	@:overload(function(point:WEVector):Bool {})
	/**
	 * Returns whether this sphere intersects the given AABB.
	 */
	public static function Intersects(aabb:AABB):Bool;
	/**
	 * Returns the center of the sphere.
	 */
	public static function GetCenter():WEVector;
	/**
	 * Returns the radius of the sphere.
	 */
	public static function GetRadius():Float;
	/**
	 * Sets the center of the sphere.
	 */
	public static function SetCenter(value:WEVector):Void;
	/**
	 * Sets the radius of the sphere.
	 */
	public static function SetRadius(value:Float):Void;
	/**
	 * Compute placement orientation matrix at intersection result. This matrix
	 * can be used to place entities in the scene oriented on the surface.
	 */
	public static function GetPlacementOrientation(position:WEVector, normal:WEVector):Matrix;
}

/**
 * It's like two spheres connected by a cylinder. Base and Tip are the two
 * endpoints, radius is the cylinder's radius.
 */
extern class Capsule {
	public var Base:WEVector;
	public var Tip:WEVector;
	public var Radius:Float;
	@:overload(function(sphere:Sphere):Bool {})
	@:overload(function(ray:Ray):Bool {})
	@:overload(function(point:WEVector):Bool {})
	/**
	 * Returns whether this capsule intersects the given capsule.
	 */
	public static function Intersects(other:Capsule):Bool;
	/**
	 * Returns the base point of the capsule.
	 */
	public static function GetBase():WEVector;
	/**
	 * Returns the tip point of the capsule.
	 */
	public static function GetTip():WEVector;
	/**
	 * Returns the radius of the capsule.
	 */
	public static function GetRadius():Float;
	/**
	 * Sets the base point of the capsule.
	 */
	public static function SetBase(value:WEVector):Void;
	/**
	 * Sets the tip point of the capsule.
	 */
	public static function SetTip(value:WEVector):Void;
	/**
	 * Sets the radius of the capsule.
	 */
	public static function SetRadius(value:Float):Void;
	/**
	 * Compute placement orientation matrix at intersection result. This matrix
	 * can be used to place entities in the scene oriented on the surface.
	 */
	public static function GetPlacementOrientation(position:WEVector, normal:WEVector):Matrix;
	/**
	 * Returns the axis-aligned bounding box of the capsule.
	 */
	public static function GetAABB():AABB;
}

extern class PrimitivesGlobals {

	/**
	 * Creates a ray from an origin and a direction, with optional minimum and
	 * maximum distance along the ray.
	 */
	public static function Ray(origin:WEVector, direction:WEVector, ?Tmin:Float, ?tmax:Float):Ray;

	/**
	 * If no argument is given, it will be infinitely inverse that can't
	 * intersect.
	 */
	public static function AABB(?min:WEVector, max:WEVector):AABB;

	/**
	 * Creates a sphere from a center point and a radius.
	 */
	public static function Sphere(center:WEVector, radius:Float):Sphere;

	/**
	 * Creates a capsule from a base point, a tip point and a radius.
	 */
	public static function Capsule(base:WEVector, tip:WEVector, radius:Float):Capsule;

}