/*
 *	Author: PDT
 *	Pulls levers.
 *
 *	Arguments:
 *  0: _heli  <OBJECT> - Heli to affect.              Defualt: objNull.
 *  1: _debug <BOOL>   - Enable debug hints and logs. Default: false.
 *
 *	Return Value:
 *	None
 *
 */

params [["_heli", objNull], ["_debug", false]];
private _return = false;
if (isNull _heli) exitWith {
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_pullLevers.sqf
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
=======
  [
    format ["[%1] PDT_H60_Startup_fnc_pullLevers: '_heli' not defined.", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_pullLevers.sqf
  _return
};

// Left fuel to DIR.
_heli animate ["Lever_fuelsys1", 0.6, 1];

// Left ENG CONT to fly.
_heli animate ["Lever_engpower1", 0.85, 1];

// Right fuel to DIR.
_heli animate ["Lever_fuelsys2", 0.6, 1];

// Right ENG CONT to fly.
_heli animate ["Lever_engpower2", 0.85, 1];

// APU CONT to ON.
_heli animate ["Switch_apucont", 0.5, 1];

// AIR SCE HT/STRT to ENG.
_heli animate ["Switch_airsce", 1, 1];

_return = true;
_return