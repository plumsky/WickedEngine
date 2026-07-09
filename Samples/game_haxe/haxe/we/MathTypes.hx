// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Math Types
// DO NOT EDIT MANUALLY

package we;

/**
 * A four component floating point vector. Provides efficient calculations
 * with SIMD support.
 * The global `vector` object exposes the same functions, so they can be
 * called in a static style, e.g. `vector.Dot(a, b)`.
 */
extern class WEVector {
	public var X:Float;
	public var Y:Float;
	public var Z:Float;
	public var W:Float;
}

/**
 * A four by four matrix. Provides efficient calculations with SIMD
 * support.
 * The global `matrix` object exposes the same functions, so they can be
 * called in a static style, e.g. `matrix.Multiply(a, b)`.
 */
extern class Matrix {
	/**
	 * Returns the given row (0-3) of the matrix as a Vector.
	 */
	public static function GetRow(?row:Int):WEVector;
	/**
	 * Builds a translation matrix from a position vector (identity if
	 * omitted).
	 */
	public static function Translation(?vector:WEVector):Matrix;
	/**
	 * Builds a rotation matrix from Euler angles packed as (roll, pitch, yaw).
	 */
	public static function Rotation(?rollPitchYaw:WEVector):Matrix;
	/**
	 * Builds a rotation matrix around the X axis.
	 */
	public static function RotationX(?angleInRadians:Float):Matrix;
	/**
	 * Builds a rotation matrix around the Y axis.
	 */
	public static function RotationY(?angleInRadians:Float):Matrix;
	/**
	 * Builds a rotation matrix around the Z axis.
	 */
	public static function RotationZ(?angleInRadians:Float):Matrix;
	/**
	 * Builds a rotation matrix from a quaternion.
	 */
	public static function RotationQuaternion(?quaternion:WEVector):Matrix;
	/**
	 * Builds a scaling matrix from a per-axis Vector or a uniform scalar
	 * (identity if omitted).
	 */
	public static function Scale(?scaleXYZ:WEVector):Matrix;
	/**
	 * Builds a left-handed view matrix looking from eye toward a direction.
	 */
	public static function LookTo(eye:WEVector, direction:WEVector, ?up:WEVector):Matrix;
	/**
	 * Builds a left-handed view matrix looking from eye at a focus point.
	 */
	public static function LookAt(eye:WEVector, focusPos:WEVector, ?up:WEVector):Matrix;
	/**
	 * Returns the product of two matrices.
	 */
	public static function Multiply(m1:Matrix, m2:Matrix):Matrix;
	/**
	 * Returns the component-wise sum of two matrices.
	 */
	public static function Add(m1:Matrix, m2:Matrix):Matrix;
	/**
	 * Returns the transpose of a matrix.
	 */
	public static function Transpose(m:Matrix):Matrix;
	/**
	 * Returns the inverse of a matrix together with its determinant.
	 */
	public static function Inverse(m:Matrix):Matrix;
	/**
	 * Returns the forward direction of a matrix. Called with no argument it
	 * operates on the matrix itself.
	 */
	public static function GetForward(mat:Matrix):WEVector;
	/**
	 * Returns the up direction of a matrix. Called with no argument it
	 * operates on the matrix itself.
	 */
	public static function GetUp(mat:Matrix):WEVector;
	/**
	 * Returns the right direction of a matrix. Called with no argument it
	 * operates on the matrix itself.
	 */
	public static function GetRight(mat:Matrix):WEVector;
}

extern class MathTypesGlobals {

	/**
	 * Constructs a 4-component vector. Any missing component defaults to 0.
	 */
	public static function Vector(?x:Float, ?y:Float, ?z:Float, ?w:Float):WEVector;

	/**
	 * Returns the X component of the vector.
	 */
	public static function GetX():Float;

	/**
	 * Returns the Y component of the vector.
	 */
	public static function GetY():Float;

	/**
	 * Returns the Z component of the vector.
	 */
	public static function GetZ():Float;

	/**
	 * Returns the W component of the vector.
	 */
	public static function GetW():Float;

	/**
	 * Sets the X component of the vector.
	 */
	public static function SetX(value:Float):Void;

	/**
	 * Sets the Y component of the vector.
	 */
	public static function SetY(value:Float):Void;

	/**
	 * Sets the Z component of the vector.
	 */
	public static function SetZ(value:Float):Void;

	/**
	 * Sets the W component of the vector.
	 */
	public static function SetW(value:Float):Void;

	/**
	 * Returns the 3D length (magnitude) of a vector. Called with no argument
	 * it operates on the vector itself.
	 */
	public static function Length(v:WEVector):Float;

	/**
	 * Returns the squared 3D length of a vector (cheaper than Length). Called
	 * with no argument it operates on the vector itself.
	 */
	public static function LengthSquared(v:WEVector):Float;

	/**
	 * Returns the distance between two points.
	 */
	public static function Distance(v1:WEVector, v2:WEVector):Float;

	/**
	 * Returns the squared distance between two points (cheaper than Distance).
	 */
	public static function DistanceSquared(v1:WEVector, v2:WEVector):Float;

	/**
	 * Returns a normalized (unit-length) copy of a vector. Called with no
	 * argument it operates on the vector itself.
	 */
	public static function Normalize(v:WEVector):WEVector;

	/**
	 * Returns a normalized copy of a quaternion. Called with no argument it
	 * operates on the vector itself.
	 */
	public static function QuaternionNormalize(v:WEVector):WEVector;

	/**
	 * Clamps every component of a vector between min and max. Called with two
	 * arguments it operates on the vector itself.
	 */
	public static function Clamp(v:WEVector, min:Float, max:Float):WEVector;

	/**
	 * Transforms a vector by a matrix (4D, uses the w component).
	 */
	public static function Transform(vec:WEVector, matrix:Matrix):WEVector;

	/**
	 * Transforms a 3D normal by a matrix (ignores translation).
	 */
	public static function TransformNormal(vec:WEVector, matrix:Matrix):WEVector;

	/**
	 * Transforms a 3D coordinate by a matrix (applies the perspective divide).
	 */
	public static function TransformCoord(vec:WEVector, matrix:Matrix):WEVector;

	/**
	 * Returns the component-wise sum of two vectors.
	 */
	public static function Add(v1:WEVector, v2:WEVector):WEVector;

	/**
	 * Returns the component-wise difference of two vectors.
	 */
	public static function Subtract(v1:WEVector, v2:WEVector):WEVector;

	/**
	 * Multiplies two vectors component-wise, or scales a vector by a scalar.
	 */
	public static function Multiply(v1:WEVector, v2:WEVector):WEVector;

	/**
	 * Returns the dot product of two vectors.
	 */
	public static function Dot(v1:WEVector, v2:WEVector):Float;

	/**
	 * Returns the cross product of two 3D vectors.
	 */
	public static function Cross(v1:WEVector, v2:WEVector):WEVector;

	/**
	 * Linearly interpolates between two vectors by factor t in [0, 1].
	 */
	public static function Lerp(v1:WEVector, v2:WEVector, t:Float):WEVector;

	/**
	 * Rotates a 3D vector by a quaternion.
	 */
	public static function Rotate(v:WEVector, quaternion:WEVector):WEVector;

	/**
	 * Returns a quaternion representing the identity (no) rotation.
	 */
	public static function QuaternionIdentity():WEVector;

	/**
	 * Returns the inverse of a quaternion.
	 */
	public static function QuaternionInverse(quaternion:WEVector):WEVector;

	/**
	 * Multiplies (concatenates) two quaternions.
	 */
	public static function QuaternionMultiply(quaternion1:WEVector, quaternion2:WEVector):WEVector;

	/**
	 * Builds a quaternion from Euler angles packed as (roll, pitch, yaw).
	 */
	public static function QuaternionFromRollPitchYaw(rotXYZ:WEVector):WEVector;

	/**
	 * Extracts Euler angles (roll, pitch, yaw) from a quaternion.
	 */
	public static function QuaternionToRollPitchYaw(quaternion:WEVector):WEVector;

	/**
	 * Spherically interpolates between two quaternions by factor t.
	 */
	public static function QuaternionSlerp(quaternion1:WEVector, quaternion2:WEVector, t:Float):WEVector;

	/**
	 * Spherically interpolates between two quaternions by factor t. Same as
	 * QuaternionSlerp.
	 */
	public static function Slerp(quaternion1:WEVector, quaternion2:WEVector, t:Float):WEVector;

	/**
	 * Constructs a plane (as a Vector of coefficients) from a point and a
	 * normal.
	 */
	public static function PlaneFromPointNormal(point:WEVector, normal:WEVector):WEVector;

	/**
	 * Constructs a plane (as a Vector of coefficients) from three points.
	 */
	public static function PlaneFromPoints(a:WEVector, b:WEVector, c:WEVector):WEVector;

	/**
	 * Computes the angle between two 3D vectors around the given axis, in the
	 * range [0, max_angle] (default 2*pi).
	 */
	public static function GetAngle(a:WEVector, b:WEVector, axis:WEVector, ?max_angle:Float):Float;

	/**
	 * Computes the signed angle between two 3D vectors around the given axis.
	 */
	public static function GetAngleSigned(a:WEVector, b:WEVector, axis:WEVector):Float;

	/**
	 * Constructs a 4x4 matrix from 16 row-major components. Any missing
	 * component defaults to 0; with no arguments the identity matrix is
	 * returned.
	 */
	public static function Matrix(?m00:Float, ?m01:Float, ?m02:Float, ?m03:Float, ?m10:Float, ?m11:Float, ?m12:Float, ?m13:Float, ?m20:Float, ?m21:Float, ?m22:Float, ?m23:Float, ?m30:Float, ?m31:Float, ?m32:Float, ?m33:Float):Matrix;

}