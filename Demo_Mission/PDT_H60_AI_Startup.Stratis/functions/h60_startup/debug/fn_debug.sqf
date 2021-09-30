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

if (_text isEqualTo "" && _debug) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_debug: No debug text given...", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
};

if (_debug) then {
  hint _text;
  diag_log _text;
};
