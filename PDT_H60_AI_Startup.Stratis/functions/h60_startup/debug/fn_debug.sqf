/*
 *	Author: PDT
 *	Handles debug messages.
 *
 *	Arguments:
 *  0: _text  <STRING> - Text to display as debug info. Defualt: "".
 *  1: _debug <BOOL> - Show hints and log.              Default: false.
 *
 *	Return Value:
 *	None
 *
 */

params [["_text", ""], ["_debug", false]];

<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/debug/fn_debug.sqf
if (_text isEqualTo "") exitWith {
  [format ["[%1] No debug text given...", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
=======
if (_text isEqualTo "" && _debug) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_debug: No debug text given...", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/debug/fn_debug.sqf
};

if (_debug) then {
  hint _text;
  diag_log _text;
};
