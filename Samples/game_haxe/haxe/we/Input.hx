// Auto-generated from WickedEngine ScriptingAPI-Documentation.md
// Topic: Input
// DO NOT EDIT MANUALLY

package we;

import we.MathTypes.WEVector;

/**
 * Provides access to keyboard, mouse, touch and gamepad input. Use the
 * global `input` object.
 */
extern class Input {
	/**
	 * Check whether a button is currently being held down.
	 */
	public static function Down(code:Int, ?playerindex:Int):Bool;
	/**
	 * Check whether a button has just been pushed that wasn't before.
	 */
	public static function Press(code:Int, ?playerindex:Int):Bool;
	/**
	 * Check whether a button has just been released that was down before.
	 */
	public static function Release(code:Int, ?playerindex:Int):Bool;
	/**
	 * Check whether a button was being held down for a specific duration
	 * (number of frames). If continuous == true, than it will also return true
	 * after the duration was reached.
	 */
	public static function Hold(code:Int, ?duration:Int, ?continuous:Bool, ?playerindex:Int):Bool;
	/**
	 * Get mouse pointer or primary touch position (x, y). Also returns mouse
	 * wheel delta movement (z), and pen pressure (w).
	 */
	public static function GetPointer():WEVector;
	/**
	 * Set mouse position.
	 */
	public static function SetPointer(pos:WEVector):Void;
	/**
	 * Native delta mouse movement.
	 */
	public static function GetPointerDelta():WEVector;
	/**
	 * Hide Pointer.
	 */
	public static function HidePointer(visible:Bool):Void;
	/**
	 * Read analog data from gamepad. type parameter must be from
	 * GAMEPAD_ANALOG values.
	 */
	public static function GetAnalog(type_:Int, ?playerindex:Int):WEVector;
	/**
	 * Returns the touches.
	 */
	public static function GetTouches():Touch;
	/**
	 * Sets controller feedback such as vibration or LED color.
	 */
	public static function SetControllerFeedback(feedback:ControllerFeedback, ?playerindex:Int):Void;
	/**
	 * Returns 0 (`BUTTON_NONE`) if nothing is pressed, or the first
	 * appropriate button code otherwise.
	 */
	public static function WhatIsPressed(?playerindex:Int):Int;
	/**
	 * Returns whether that button code is a gamepad button or not.
	 */
	public static function IsGamepadButton(button:Int):Bool;
	/**
	 * Returns button code for a given string name.
	 */
	public static function StringToButton(str:String):Int;
	/**
	 * Returns string name for the given button code. You can set a preference
	 * for controller type which can modify the string returned.
	 */
	public static function ButtonToString(button:Int, ?preference:Int):Dynamic;
	/**
	 * Sets the current cursor type. Values can be of the cursor values, see
	 * below.
	 */
	public static function SetCursor(cursor:Int):Void;
	/**
	 * Sets the specified cursor type to an image from a cursor file.
	 */
	public static function SetCursorFromFile(cursor:Int, filename:String):Void;
	/**
	 * Resets the specified cursor to the default one.
	 */
	public static function ResetCursor(cursor:Int):Void;
	/**
	 * Resets all cursors to the defaults.
	 */
	public static function ResetCursors():Void;
	/**
	 * Returns the parameters of the current touch pinch gesture: the pinch
	 * center position, the cumulative scale, and the scale change this frame.
	 */
	public static function GetTouchPinch():WEVector;
	/**
	 * Returns the touch pan gesture delta movement.
	 */
	public static function GetTouchPan():WEVector;
	/**
	 * Returns true if a pan touch gesture is currently active.
	 */
	public static function IsTouchPanning():Bool;
	/**
	 * Returns true if a new pan touch gesture is starting this frame.
	 */
	public static function IsTouchPanStarting():Bool;
}

/**
 * Describes controller feedback such as touch and LED color which can be
 * replayed on a controller.
 */
extern class ControllerFeedback {
	/**
	 * Vibration amount of left motor (0: no vibration, 1: max vibration).
	 */
	public static function SetVibrationLeft(value:Float):Void;
	/**
	 * Vibration amount of right motor (0: no vibration, 1: max vibration).
	 */
	public static function SetVibrationRight(value:Float):Void;
	@:overload(function(hexcolor:Int):Void {})
	/**
	 * Sets the colored LED color if controller has one.
	 */
	public static function SetLEDColor(color:WEVector):Void;
}

/**
 * Describes a touch contact point
 */
extern class Touch {
	/**
	 * Returns the touch state (one of the TOUCHSTATE_* values).
	 */
	public static function GetState():Int;
	/**
	 * Returns the touch position.
	 */
	public static function GetPos():WEVector;
}

extern class InputGlobals {

	/**
	 * TOUCHSTATE PRESSED.
	 */
	public static var TOUCHSTATE_PRESSED:Int;

	/**
	 * TOUCHSTATE RELEASED.
	 */
	public static var TOUCHSTATE_RELEASED:Int;

	/**
	 * TOUCHSTATE MOVED.
	 */
	public static var TOUCHSTATE_MOVED:Int;

	/**
	 * No button (sentinel value for "no input").
	 */
	public static var BUTTON_NONE:Int;

	/**
	 * KEYBOARD BUTTON UP.
	 */
	public static var KEYBOARD_BUTTON_UP:Int;

	/**
	 * KEYBOARD BUTTON DOWN.
	 */
	public static var KEYBOARD_BUTTON_DOWN:Int;

	/**
	 * KEYBOARD BUTTON LEFT.
	 */
	public static var KEYBOARD_BUTTON_LEFT:Int;

	/**
	 * KEYBOARD BUTTON RIGHT.
	 */
	public static var KEYBOARD_BUTTON_RIGHT:Int;

	/**
	 * KEYBOARD BUTTON SPACE.
	 */
	public static var KEYBOARD_BUTTON_SPACE:Int;

	/**
	 * KEYBOARD BUTTON RSHIFT.
	 */
	public static var KEYBOARD_BUTTON_RSHIFT:Int;

	/**
	 * KEYBOARD BUTTON LSHIFT.
	 */
	public static var KEYBOARD_BUTTON_LSHIFT:Int;

	/**
	 * KEYBOARD BUTTON F1.
	 */
	public static var KEYBOARD_BUTTON_F1:Int;

	/**
	 * KEYBOARD BUTTON F2.
	 */
	public static var KEYBOARD_BUTTON_F2:Int;

	/**
	 * KEYBOARD BUTTON F3.
	 */
	public static var KEYBOARD_BUTTON_F3:Int;

	/**
	 * KEYBOARD BUTTON F4.
	 */
	public static var KEYBOARD_BUTTON_F4:Int;

	/**
	 * KEYBOARD BUTTON F5.
	 */
	public static var KEYBOARD_BUTTON_F5:Int;

	/**
	 * KEYBOARD BUTTON F6.
	 */
	public static var KEYBOARD_BUTTON_F6:Int;

	/**
	 * KEYBOARD BUTTON F7.
	 */
	public static var KEYBOARD_BUTTON_F7:Int;

	/**
	 * KEYBOARD BUTTON F8.
	 */
	public static var KEYBOARD_BUTTON_F8:Int;

	/**
	 * KEYBOARD BUTTON F9.
	 */
	public static var KEYBOARD_BUTTON_F9:Int;

	/**
	 * KEYBOARD BUTTON F10.
	 */
	public static var KEYBOARD_BUTTON_F10:Int;

	/**
	 * KEYBOARD BUTTON F11.
	 */
	public static var KEYBOARD_BUTTON_F11:Int;

	/**
	 * KEYBOARD BUTTON F12.
	 */
	public static var KEYBOARD_BUTTON_F12:Int;

	/**
	 * KEYBOARD BUTTON ENTER.
	 */
	public static var KEYBOARD_BUTTON_ENTER:Int;

	/**
	 * KEYBOARD BUTTON ESCAPE.
	 */
	public static var KEYBOARD_BUTTON_ESCAPE:Int;

	/**
	 * KEYBOARD BUTTON BACK (backspace).
	 */
	public static var KEYBOARD_BUTTON_BACK:Int;

	/**
	 * KEYBOARD BUTTON HOME.
	 */
	public static var KEYBOARD_BUTTON_HOME:Int;

	/**
	 * KEYBOARD BUTTON RCONTROL.
	 */
	public static var KEYBOARD_BUTTON_RCONTROL:Int;

	/**
	 * KEYBOARD BUTTON LCONTROL.
	 */
	public static var KEYBOARD_BUTTON_LCONTROL:Int;

	/**
	 * KEYBOARD BUTTON DELETE.
	 */
	public static var KEYBOARD_BUTTON_DELETE:Int;

	/**
	 * KEYBOARD BUTTON BACKSPACE.
	 */
	public static var KEYBOARD_BUTTON_BACKSPACE:Int;

	/**
	 * KEYBOARD BUTTON PAGEDOWN.
	 */
	public static var KEYBOARD_BUTTON_PAGEDOWN:Int;

	/**
	 * KEYBOARD BUTTON PAGEUP.
	 */
	public static var KEYBOARD_BUTTON_PAGEUP:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD0.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD0:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD1.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD1:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD2.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD2:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD3.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD3:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD4.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD4:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD5.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD5:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD6.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD6:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD7.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD7:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD8.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD8:Int;

	/**
	 * KEYBOARD BUTTON NUMPAD9.
	 */
	public static var KEYBOARD_BUTTON_NUMPAD9:Int;

	/**
	 * KEYBOARD BUTTON MULTIPLY.
	 */
	public static var KEYBOARD_BUTTON_MULTIPLY:Int;

	/**
	 * KEYBOARD BUTTON ADD.
	 */
	public static var KEYBOARD_BUTTON_ADD:Int;

	/**
	 * KEYBOARD BUTTON SEPARATOR.
	 */
	public static var KEYBOARD_BUTTON_SEPARATOR:Int;

	/**
	 * KEYBOARD BUTTON SUBTRACT.
	 */
	public static var KEYBOARD_BUTTON_SUBTRACT:Int;

	/**
	 * KEYBOARD BUTTON DECIMAL.
	 */
	public static var KEYBOARD_BUTTON_DECIMAL:Int;

	/**
	 * KEYBOARD BUTTON DIVIDE.
	 */
	public static var KEYBOARD_BUTTON_DIVIDE:Int;

	/**
	 * KEYBOARD BUTTON TAB.
	 */
	public static var KEYBOARD_BUTTON_TAB:Int;

	/**
	 * KEYBOARD BUTTON TILDE.
	 */
	public static var KEYBOARD_BUTTON_TILDE:Int;

	/**
	 * KEYBOARD BUTTON INSERT.
	 */
	public static var KEYBOARD_BUTTON_INSERT:Int;

	/**
	 * KEYBOARD BUTTON ALT.
	 */
	public static var KEYBOARD_BUTTON_ALT:Int;

	/**
	 * KEYBOARD BUTTON ALTGR.
	 */
	public static var KEYBOARD_BUTTON_ALTGR:Int;

	/**
	 * MOUSE BUTTON LEFT.
	 */
	public static var MOUSE_BUTTON_LEFT:Int;

	/**
	 * MOUSE BUTTON RIGHT.
	 */
	public static var MOUSE_BUTTON_RIGHT:Int;

	/**
	 * MOUSE BUTTON MIDDLE.
	 */
	public static var MOUSE_BUTTON_MIDDLE:Int;

	/**
	 * MOUSE SCROLL AS BUTTON UP.
	 */
	public static var MOUSE_SCROLL_AS_BUTTON_UP:Int;

	/**
	 * MOUSE SCROLL AS BUTTON DOWN.
	 */
	public static var MOUSE_SCROLL_AS_BUTTON_DOWN:Int;

	/**
	 * Gamepad D-pad up.
	 */
	public static var GAMEPAD_BUTTON_UP:Int;

	/**
	 * Gamepad D-pad down.
	 */
	public static var GAMEPAD_BUTTON_DOWN:Int;

	/**
	 * Gamepad D-pad left.
	 */
	public static var GAMEPAD_BUTTON_LEFT:Int;

	/**
	 * Gamepad D-pad right.
	 */
	public static var GAMEPAD_BUTTON_RIGHT:Int;

	/**
	 * Generic gamepad button 1.
	 */
	public static var GAMEPAD_BUTTON_1:Int;

	/**
	 * Generic gamepad button 2.
	 */
	public static var GAMEPAD_BUTTON_2:Int;

	/**
	 * Generic gamepad button 3.
	 */
	public static var GAMEPAD_BUTTON_3:Int;

	/**
	 * Generic gamepad button 4.
	 */
	public static var GAMEPAD_BUTTON_4:Int;

	/**
	 * Generic gamepad button 5.
	 */
	public static var GAMEPAD_BUTTON_5:Int;

	/**
	 * Generic gamepad button 6.
	 */
	public static var GAMEPAD_BUTTON_6:Int;

	/**
	 * Generic gamepad button 7.
	 */
	public static var GAMEPAD_BUTTON_7:Int;

	/**
	 * Generic gamepad button 8.
	 */
	public static var GAMEPAD_BUTTON_8:Int;

	/**
	 * Generic gamepad button 9.
	 */
	public static var GAMEPAD_BUTTON_9:Int;

	/**
	 * Generic gamepad button 10.
	 */
	public static var GAMEPAD_BUTTON_10:Int;

	/**
	 * Generic gamepad button 11.
	 */
	public static var GAMEPAD_BUTTON_11:Int;

	/**
	 * Generic gamepad button 12.
	 */
	public static var GAMEPAD_BUTTON_12:Int;

	/**
	 * Generic gamepad button 13.
	 */
	public static var GAMEPAD_BUTTON_13:Int;

	/**
	 * Generic gamepad button 14.
	 */
	public static var GAMEPAD_BUTTON_14:Int;

	/**
	 * Left thumbstick pushed up, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_L_AS_BUTTON_UP:Int;

	/**
	 * Left thumbstick pushed down, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_L_AS_BUTTON_DOWN:Int;

	/**
	 * Left thumbstick pushed left, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_L_AS_BUTTON_LEFT:Int;

	/**
	 * Left thumbstick pushed right, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_L_AS_BUTTON_RIGHT:Int;

	/**
	 * Right thumbstick pushed up, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_R_AS_BUTTON_UP:Int;

	/**
	 * Right thumbstick pushed down, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_R_AS_BUTTON_DOWN:Int;

	/**
	 * Right thumbstick pushed left, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_R_AS_BUTTON_LEFT:Int;

	/**
	 * Right thumbstick pushed right, as a button.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_R_AS_BUTTON_RIGHT:Int;

	/**
	 * Left trigger, as a button.
	 */
	public static var GAMEPAD_ANALOG_TRIGGER_L_AS_BUTTON:Int;

	/**
	 * Right trigger, as a button.
	 */
	public static var GAMEPAD_ANALOG_TRIGGER_R_AS_BUTTON:Int;

	/**
	 * Xbox X button (alias of GAMEPAD_BUTTON_1).
	 */
	public static var GAMEPAD_BUTTON_XBOX_X:Int;

	/**
	 * Xbox A button (alias of GAMEPAD_BUTTON_2).
	 */
	public static var GAMEPAD_BUTTON_XBOX_A:Int;

	/**
	 * Xbox B button (alias of GAMEPAD_BUTTON_3).
	 */
	public static var GAMEPAD_BUTTON_XBOX_B:Int;

	/**
	 * Xbox Y button (alias of GAMEPAD_BUTTON_4).
	 */
	public static var GAMEPAD_BUTTON_XBOX_Y:Int;

	/**
	 * Xbox L1 button (alias of GAMEPAD_BUTTON_5).
	 */
	public static var GAMEPAD_BUTTON_XBOX_L1:Int;

	/**
	 * Xbox LT button (alias of GAMEPAD_ANALOG_TRIGGER_L_AS_BUTTON).
	 */
	public static var GAMEPAD_BUTTON_XBOX_LT:Int;

	/**
	 * Xbox R1 button (alias of GAMEPAD_BUTTON_6).
	 */
	public static var GAMEPAD_BUTTON_XBOX_R1:Int;

	/**
	 * Xbox RT button (alias of GAMEPAD_ANALOG_TRIGGER_R_AS_BUTTON).
	 */
	public static var GAMEPAD_BUTTON_XBOX_RT:Int;

	/**
	 * Xbox L3 button (alias of GAMEPAD_BUTTON_7).
	 */
	public static var GAMEPAD_BUTTON_XBOX_L3:Int;

	/**
	 * Xbox R3 button (alias of GAMEPAD_BUTTON_8).
	 */
	public static var GAMEPAD_BUTTON_XBOX_R3:Int;

	/**
	 * Xbox BACK button (alias of GAMEPAD_BUTTON_9).
	 */
	public static var GAMEPAD_BUTTON_XBOX_BACK:Int;

	/**
	 * Xbox START button (alias of GAMEPAD_BUTTON_10).
	 */
	public static var GAMEPAD_BUTTON_XBOX_START:Int;

	/**
	 * PlayStation SQUARE button (alias of GAMEPAD_BUTTON_1).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_SQUARE:Int;

	/**
	 * PlayStation CROSS button (alias of GAMEPAD_BUTTON_2).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_CROSS:Int;

	/**
	 * PlayStation CIRCLE button (alias of GAMEPAD_BUTTON_3).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_CIRCLE:Int;

	/**
	 * PlayStation TRIANGLE button (alias of GAMEPAD_BUTTON_4).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_TRIANGLE:Int;

	/**
	 * PlayStation L1 button (alias of GAMEPAD_BUTTON_5).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_L1:Int;

	/**
	 * PlayStation L2 button (alias of GAMEPAD_ANALOG_TRIGGER_L_AS_BUTTON).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_L2:Int;

	/**
	 * PlayStation R1 button (alias of GAMEPAD_BUTTON_6).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_R1:Int;

	/**
	 * PlayStation R2 button (alias of GAMEPAD_ANALOG_TRIGGER_R_AS_BUTTON).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_R2:Int;

	/**
	 * PlayStation L3 button (alias of GAMEPAD_BUTTON_7).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_L3:Int;

	/**
	 * PlayStation R3 button (alias of GAMEPAD_BUTTON_8).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_R3:Int;

	/**
	 * PlayStation SHARE button (alias of GAMEPAD_BUTTON_9).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_SHARE:Int;

	/**
	 * PlayStation OPTION button (alias of GAMEPAD_BUTTON_10).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_OPTION:Int;

	/**
	 * PlayStation SELECT button (alias of GAMEPAD_BUTTON_PLAYSTATION_SHARE).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_SELECT:Int;

	/**
	 * PlayStation START button (alias of GAMEPAD_BUTTON_PLAYSTATION_OPTION).
	 */
	public static var GAMEPAD_BUTTON_PLAYSTATION_START:Int;

	/**
	 * GAMEPAD ANALOG THUMBSTICK L.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_L:Int;

	/**
	 * GAMEPAD ANALOG THUMBSTICK R.
	 */
	public static var GAMEPAD_ANALOG_THUMBSTICK_R:Int;

	/**
	 * GAMEPAD ANALOG TRIGGER L.
	 */
	public static var GAMEPAD_ANALOG_TRIGGER_L:Int;

	/**
	 * GAMEPAD ANALOG TRIGGER R.
	 */
	public static var GAMEPAD_ANALOG_TRIGGER_R:Int;

	/**
	 * CONTROLLER PREFERENCE GENERIC.
	 */
	public static var CONTROLLER_PREFERENCE_GENERIC:Int;

	/**
	 * CONTROLLER PREFERENCE PLAYSTATION.
	 */
	public static var CONTROLLER_PREFERENCE_PLAYSTATION:Int;

	/**
	 * CONTROLLER PREFERENCE XBOX.
	 */
	public static var CONTROLLER_PREFERENCE_XBOX:Int;

	/**
	 * CURSOR DEFAULT.
	 */
	public static var CURSOR_DEFAULT:Int;

	/**
	 * CURSOR TEXTINPUT.
	 */
	public static var CURSOR_TEXTINPUT:Int;

	/**
	 * CURSOR RESIZEALL.
	 */
	public static var CURSOR_RESIZEALL:Int;

	/**
	 * CURSOR RESIZE NS.
	 */
	public static var CURSOR_RESIZE_NS:Int;

	/**
	 * CURSOR RESIZE EW.
	 */
	public static var CURSOR_RESIZE_EW:Int;

	/**
	 * CURSOR RESIZE NESW.
	 */
	public static var CURSOR_RESIZE_NESW:Int;

	/**
	 * CURSOR RESIZE NWSE.
	 */
	public static var CURSOR_RESIZE_NWSE:Int;

	/**
	 * CURSOR HAND.
	 */
	public static var CURSOR_HAND:Int;

	/**
	 * CURSOR NOTALLOWED.
	 */
	public static var CURSOR_NOTALLOWED:Int;

	/**
	 * CURSOR CROSS.
	 */
	public static var CURSOR_CROSS:Int;

	/**
	 * Creates an Input object. Use the global `input` instead of constructing
	 * one.
	 */
	public static function Input():Input;

	/**
	 * Controller Feedback.
	 */
	public static function ControllerFeedback():ControllerFeedback;

	/**
	 * Creates a Touch contact descriptor.
	 */
	public static function Touch():Touch;

}