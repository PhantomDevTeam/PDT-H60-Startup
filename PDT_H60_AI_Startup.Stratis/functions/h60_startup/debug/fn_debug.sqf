/*
 *	Author: PDT
 *	Handles debug messages.
 *
 *	Arguments:
 *  0: _text <STRING> - text to display as debug info.
 *
 *	Return Value:
 *	None
 *
 */

params [["_text", ""]];

if (_text isEqualTo "") exitWith {
  [format ["[%1] No debug text given...", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
};

hint _text;
diag_log _text;
