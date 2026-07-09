// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Audio
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;

/**
 * Loads and plays an audio files.
 */
extern class Audio {
	/**
	 * Creates a sound file, returns true if successful, false otherwise.
	 */
	public static function CreateSound(filename:String, sound:Sound):Bool;
	/**
	 * Creates a sound instance that can be replayed, returns true if
	 * successful, false otherwise.
	 */
	public static function CreateSoundInstance(sound:Sound, soundinstance:SoundInstance):Bool;
	/**
	 * Plays the audio.
	 */
	public static function Play(soundinstance:SoundInstance):Void;
	/**
	 * Pauses the audio.
	 */
	public static function Pause(soundinstance:SoundInstance):Void;
	/**
	 * Stops the audio.
	 */
	public static function Stop(soundinstance:SoundInstance):Void;
	/**
	 * Returns the volume of a `soundinstance`. If `soundinstance` is not
	 * provided, returns the master volume.
	 */
	public static function GetVolume(?soundinstance:SoundInstance):Float;
	/**
	 * Sets the volume of a `soundinstance`. If `soundinstance` is not
	 * provided, sets the master volume.
	 */
	public static function SetVolume(volume:Float, ?soundinstance:SoundInstance):Void;
	/**
	 * Disable looping. By default, sound instances are looped when created.
	 */
	public static function ExitLoop(soundinstance:SoundInstance):Void;
	/**
	 * Returns the volume of the submix group.
	 */
	public static function GetSubmixVolume(submixtype:Int):Float;
	/**
	 * Sets the volume for a submix group.
	 */
	public static function SetSubmixVolume(submixtype:Int, volume:Float):Void;
	/**
	 * Adds 3D effect to the sound instance.
	 */
	public static function Update3D(soundinstance:SoundInstance, instance3D:SoundInstance3D):Void;
	/**
	 * Sets an environment effect for reverb globally. Refer to Reverb Types
	 * section for acceptable input values.
	 */
	public static function SetReverb(reverbtype:Int):Void;
}

/**
 * An audio file. Can be instanced several times via SoundInstance.
 */
extern class Sound {
	/**
	 * Returns whether the sound was created successfully.
	 */
	public static function IsValid():Bool;
}

/**
 * An audio file instance that can be played. Note: after modifying
 * parameters of the SoundInstance, the SoundInstance will need to be
 * recreated from a specified sound.
 */
extern class SoundInstance {
	/**
	 * Set a submix type group (default is SUBMIX_TYPE_SOUNDEFFECT).
	 */
	public static function SetSubmixType(submixtype:Int):Void;
	/**
	 * Beginning of the playback in seconds, relative to the Sound it will be
	 * created from (0 = from beginning).
	 */
	public static function SetBegin(seconds:Float):Void;
	/**
	 * Length in seconds (0 = until end).
	 */
	public static function SetLength(seconds:Float):Void;
	/**
	 * Loop region begin in seconds, relative to the instance begin time (0 =
	 * from beginning).
	 */
	public static function SetLoopBegin(seconds:Float):Void;
	/**
	 * Loop region length in seconds (0 = until the end).
	 */
	public static function SetLoopLength(seconds:Float):Void;
	/**
	 * Enable/disable reverb for the sound instance.
	 */
	public static function SetEnableReverb(value:Bool):Void;
	/**
	 * Enable/disable looping for the sound instance.
	 */
	public static function SetLooped(value:Bool):Void;
	/**
	 * Returns the submix type.
	 */
	public static function GetSubmixType():Int;
	/**
	 * Returns the begin.
	 */
	public static function GetBegin():Float;
	/**
	 * Returns the length.
	 */
	public static function GetLength():Float;
	/**
	 * Returns the loop begin.
	 */
	public static function GetLoopBegin():Float;
	/**
	 * Returns the loop length.
	 */
	public static function GetLoopLength():Float;
	/**
	 * Returns whether reverb is enabled.
	 */
	public static function IsEnableReverb():Bool;
	/**
	 * Returns whether looped is enabled.
	 */
	public static function IsLooped():Bool;
	/**
	 * Returns whether the sound instance was created successfully.
	 */
	public static function IsValid():Bool;
}

/**
 * Describes the relation between a sound instance and a listener in a 3D
 * world.
 */
extern class SoundInstance3D {
	/**
	 * Sets the listener position.
	 */
	public static function SetListenerPos(value:WEVector):Void;
	/**
	 * Sets the listener up.
	 */
	public static function SetListenerUp(value:WEVector):Void;
	/**
	 * Sets the listener front.
	 */
	public static function SetListenerFront(value:WEVector):Void;
	/**
	 * Sets the listener velocity.
	 */
	public static function SetListenerVelocity(value:WEVector):Void;
	/**
	 * Sets the emitter position.
	 */
	public static function SetEmitterPos(value:WEVector):Void;
	/**
	 * Sets the emitter up.
	 */
	public static function SetEmitterUp(value:WEVector):Void;
	/**
	 * Sets the emitter front.
	 */
	public static function SetEmitterFront(value:WEVector):Void;
	/**
	 * Sets the emitter velocity.
	 */
	public static function SetEmitterVelocity(value:WEVector):Void;
	/**
	 * Sets the emitter radius.
	 */
	public static function SetEmitterRadius(radius:Float):Void;
}

extern class AudioGlobals {

	/**
	 * Sound effect group.
	 */
	public static var SUBMIX_TYPE_SOUNDEFFECT:Int;

	/**
	 * Music group.
	 */
	public static var SUBMIX_TYPE_MUSIC:Int;

	/**
	 * User submix group.
	 */
	public static var SUBMIX_TYPE_USER0:Int;

	/**
	 * uUer submix group.
	 */
	public static var SUBMIX_TYPE_USER1:Int;

	/**
	 * REVERB PRESET DEFAULT.
	 */
	public static var REVERB_PRESET_DEFAULT:Int;

	/**
	 * REVERB PRESET GENERIC.
	 */
	public static var REVERB_PRESET_GENERIC:Int;

	/**
	 * REVERB PRESET FOREST.
	 */
	public static var REVERB_PRESET_FOREST:Int;

	/**
	 * REVERB PRESET PADDEDCELL.
	 */
	public static var REVERB_PRESET_PADDEDCELL:Int;

	/**
	 * REVERB PRESET ROOM.
	 */
	public static var REVERB_PRESET_ROOM:Int;

	/**
	 * REVERB PRESET BATHROOM.
	 */
	public static var REVERB_PRESET_BATHROOM:Int;

	/**
	 * REVERB PRESET LIVINGROOM.
	 */
	public static var REVERB_PRESET_LIVINGROOM:Int;

	/**
	 * REVERB PRESET STONEROOM.
	 */
	public static var REVERB_PRESET_STONEROOM:Int;

	/**
	 * REVERB PRESET AUDITORIUM.
	 */
	public static var REVERB_PRESET_AUDITORIUM:Int;

	/**
	 * REVERB PRESET CONCERTHALL.
	 */
	public static var REVERB_PRESET_CONCERTHALL:Int;

	/**
	 * REVERB PRESET CAVE.
	 */
	public static var REVERB_PRESET_CAVE:Int;

	/**
	 * REVERB PRESET ARENA.
	 */
	public static var REVERB_PRESET_ARENA:Int;

	/**
	 * REVERB PRESET HANGAR.
	 */
	public static var REVERB_PRESET_HANGAR:Int;

	/**
	 * REVERB PRESET CARPETEDHALLWAY.
	 */
	public static var REVERB_PRESET_CARPETEDHALLWAY:Int;

	/**
	 * REVERB PRESET HALLWAY.
	 */
	public static var REVERB_PRESET_HALLWAY:Int;

	/**
	 * REVERB PRESET STONECORRIDOR.
	 */
	public static var REVERB_PRESET_STONECORRIDOR:Int;

	/**
	 * REVERB PRESET ALLEY.
	 */
	public static var REVERB_PRESET_ALLEY:Int;

	/**
	 * REVERB PRESET CITY.
	 */
	public static var REVERB_PRESET_CITY:Int;

	/**
	 * REVERB PRESET MOUNTAINS.
	 */
	public static var REVERB_PRESET_MOUNTAINS:Int;

	/**
	 * REVERB PRESET QUARRY.
	 */
	public static var REVERB_PRESET_QUARRY:Int;

	/**
	 * REVERB PRESET PLAIN.
	 */
	public static var REVERB_PRESET_PLAIN:Int;

	/**
	 * REVERB PRESET PARKINGLOT.
	 */
	public static var REVERB_PRESET_PARKINGLOT:Int;

	/**
	 * REVERB PRESET SEWERPIPE.
	 */
	public static var REVERB_PRESET_SEWERPIPE:Int;

	/**
	 * REVERB PRESET UNDERWATER.
	 */
	public static var REVERB_PRESET_UNDERWATER:Int;

	/**
	 * REVERB PRESET SMALLROOM.
	 */
	public static var REVERB_PRESET_SMALLROOM:Int;

	/**
	 * REVERB PRESET MEDIUMROOM.
	 */
	public static var REVERB_PRESET_MEDIUMROOM:Int;

	/**
	 * REVERB PRESET LARGEROOM.
	 */
	public static var REVERB_PRESET_LARGEROOM:Int;

	/**
	 * REVERB PRESET MEDIUMHALL.
	 */
	public static var REVERB_PRESET_MEDIUMHALL:Int;

	/**
	 * REVERB PRESET LARGEHALL.
	 */
	public static var REVERB_PRESET_LARGEHALL:Int;

	/**
	 * REVERB PRESET PLATE.
	 */
	public static var REVERB_PRESET_PLATE:Int;

	/**
	 * Creates an Audio object. Use the global `audio` instead of constructing
	 * one.
	 */
	public static function Audio():Audio;

	/**
	 * Creates a sound. With a filename it loads the sound from file; with no
	 * argument it creates an empty sound.
	 */
	public static function Sound(?name:String):Sound;

	/**
	 * Creates a sound instance. With a sound it is created from that sound
	 * (with optional begin offset and length in seconds); with no argument it
	 * creates an empty instance.
	 */
	public static function SoundInstance(?sound:Sound, ?begin:Float, ?length:Float):SoundInstance;

	/**
	 * Creates the 3D relation object. By default, the listener and emitter are
	 * on the same position, and that disables the 3D effect.
	 */
	public static function SoundInstance3D():SoundInstance3D;

}