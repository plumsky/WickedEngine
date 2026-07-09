// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Path finding
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;
import we.Primitives.AABB;
import we.Primitives.Capsule;
import we.Primitives.Sphere;

/**
 * Path finding operations can be made by using a voxel grid and path
 * queries. The voxel grid can store spatial information about a scene, or
 * a part of the scene, while the path query manages the path finding
 * result from a point to a different point within the voxel grid.
 */
extern class VoxelGrid {
	/**
	 * Allocates memory for dimX * dimY * dimZ number of voxels and initializes
	 * them to empty.
	 */
	public static function Init(dimX:Int, dimY:Int, dimZ:Int):Void;
	/**
	 * Initializes all voxels to empty.
	 */
	public static function ClearData():Void;
	/**
	 * Places the voxel grid volume to fit to the given AABB. The number of
	 * voxels doesn't change, only the center and voxel size.
	 */
	public static function FromAABB(aabb:AABB):Void;
	/**
	 * Voxelizes triangle, and either adds it to the voxels (default), or
	 * removes voxels
	 */
	public static function InjectTriangle(a:WEVector, b:WEVector, c:WEVector, ?subtract:Bool):Void;
	/**
	 * Voxelizes axis aligned bounding box, and either adds it to the voxels
	 * (default), or removes voxels.
	 */
	public static function InjectAABB(aabb:AABB, ?subtract:Bool):Void;
	/**
	 * Voxelizes sphere, and either adds it to the voxels (default), or removes
	 * voxels.
	 */
	public static function InjectSphere(sphere:Sphere, ?subtract:Bool):Void;
	/**
	 * Voxelizes capsule, and either adds it to the voxels (default), or
	 * removes voxels.
	 */
	public static function InjectCapsule(capsule:Capsule, ?subtract:Bool):Void;
	/**
	 * Converts a position in world space to voxel coordinate.
	 */
	public static function WorldToCoord(pos:WEVector):Int;
	/**
	 * converts voxel coordinate to world space position
	 */
	public static function CoordToWorld(x:Int, y:Int, z:Int):WEVector;
	@:overload(function(x:Int, y:Int, z:Int):Bool {})
	/**
	 * Returns false if voxel is empty, true if it's valid.
	 */
	public static function CheckVoxel(pos:WEVector):Bool;
	@:overload(function(x:Int, y:Int, z:Int, value:Bool):Void {})
	/**
	 * Sets a single voxel to the specified state.
	 */
	public static function SetVoxel(pos:WEVector, value:Bool):Void;
	/**
	 * Returns the center of the voxel grid volume.
	 */
	public static function GetCenter():WEVector;
	/**
	 * Sets the center of the voxel grid volume.
	 */
	public static function SetCenter(pos:WEVector):Void;
	/**
	 * Get the half extent of one voxel in world space.
	 */
	public static function GetVoxelSize():WEVector;
	@:overload(function(voxelsize:Float):Void {})
	/**
	 * Sets the half extent of one voxel in world space.
	 */
	public static function SetVoxelSize(voxelsize:WEVector):Void;
	/**
	 * Returns color of debug visualization of voxels.
	 */
	public static function GetDebugColor():WEVector;
	/**
	 * Set the color for debug visualization of voxels.
	 */
	public static function SetDebugColor(color:WEVector):Void;
	/**
	 * Returns color of debug visualization of voxel grid extents.
	 */
	public static function GetDebugColorExtent():WEVector;
	/**
	 * Set the color for debug visualization of voxel grid extents.
	 */
	public static function SetDebugColorExtent(color:WEVector):Void;
	/**
	 * Returns the memory consumption of the voxel grid in bytes.
	 */
	public static function GetMemorySize():Int;
	@:overload(function(observer:AABB, subject:AABB):Bool {})
	@:overload(function(observer:AABB, subject:AABB):Bool {})
	/**
	 * Performs line of sight occlusion test from observer to subject voxel
	 * coordinates. Returns false if occlusion was found, true otherwise.
	 */
	public static function IsVisible(observer_x:Int, observer_y:Int, observer_z:Int, subject_x:Int, subject_y:Int, subject_z:Int):Bool;
	/**
	 * Sets every empty voxel which is enclosed to solid.
	 */
	public static function FloodFill():Void;
	/**
	 * Adds the voxels of another grid into this one.
	 */
	public static function Add(other:VoxelGrid):Void;
	/**
	 * Removes the voxels of another grid from this one.
	 */
	public static function Subtract(other:VoxelGrid):Void;
}

/**
 * Computes and stores a path through a VoxelGrid, for navigation and AI
 * movement.
 */
extern class PathQuery {
	/**
	 * Computes the path from start to goal on a voxel grid and stores the
	 * result.
	 */
	public static function Process(start:WEVector, goal:WEVector, voxelgrid:VoxelGrid):Void;
	/**
	 * Searches for a cover for subject position to hide from observer. The
	 * search will be in a specific direction, within the specified distance
	 * (approximately, within voxel precision).
	 */
	public static function SearchCover(observer:WEVector, subject:WEVector, direction:WEVector, max_distance:Float, voxelgrid:VoxelGrid):Void;
	/**
	 * Returns whether the last call to Process() was successfully able to find
	 * a path.
	 */
	public static function IsSuccessful():Bool;
	/**
	 * Get the next waypoint on the path from the starting location. This
	 * requires that Process() has been called beforehand.
	 */
	public static function GetNextWaypoint():WEVector;
	/**
	 * Enable/disable waypoint debug rendering when using DrawPathQuery(). If
	 * enabled, voxel waypoints will be drawn in blue, simplified voxel
	 * waypoints will be drawn in pink.
	 */
	public static function SetDebugDrawWaypointsEnabled(value:Bool):Void;
	/**
	 * Enable/disable flying behavior. When flying is enabled, then the path
	 * will be on empty voxels (air), otherwise and by default the path will be
	 * on filled voxels (ground).
	 */
	public static function SetFlying(value:Bool):Void;
	/**
	 * Returns whether flying.
	 */
	public static function IsFlying():Bool;
	/**
	 * Set the navigation width requirement in voxels. This means how many
	 * voxels the query will keep away from obstacles horizontally.
	 */
	public static function SetAgentWidth(value:Int):Void;
	/**
	 * Returns the agent width.
	 */
	public static function GetAgentWidth(value:Int):Int;
	/**
	 * Set the navigation height requirement in voxels. This means how many
	 * voxels the query will keep away from obstacles vertically.
	 */
	public static function SetAgentHeight(value:Int):Void;
	/**
	 * Returns the agent height.
	 */
	public static function GetAgentHeight(value:Int):Int;
	/**
	 * Returns the number of waypoints that were computed in Process().
	 */
	public static function GetWaypointCount():Int;
	/**
	 * Returns the waypoint at specified index (direction: start -> goal).
	 */
	public static function GetWaypoint(index:Int):WEVector;
	/**
	 * Returns the goal position.
	 */
	public static function GetGoal():WEVector;
}

extern class PathFindingGlobals {

	/**
	 * Creates a voxel grid of the given dimensions, used for navigation and
	 * voxel ray queries.
	 */
	public static function VoxelGrid(?dimX:Int, dimY:Int, dimZ:Int):VoxelGrid;

	/**
	 * Creates a PathQuery for finding paths through a voxel grid.
	 */
	public static function PathQuery():PathQuery;

}