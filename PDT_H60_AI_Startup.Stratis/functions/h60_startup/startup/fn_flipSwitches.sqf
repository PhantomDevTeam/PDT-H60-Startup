/*
 *	Author: PDT
 *	Flips switches.
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
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_flipSwitches.sqf
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
=======
  [
    format ["[%1] PDT_H60_Startup_fnc_flipSwitches: '_heli' not defined.", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_flipSwitches.sqf
  _return
};

// Turn on batt 1 and batt 2.
_heli animate ["Switch_batt1", 0, 1];
_heli animate ["Switch_batt2", 0, 1];

// Turn on gen 1 and gen 2.
_heli animate ["Switch_gen1", 0, 1];
_heli animate ["Switch_gen2", 0, 1];

// Turn on APU generator.
_heli animate ["Switch_apugen", 0, 1];

// Turn on standby.
_heli animate ["Switch_stbyinst", 0, 1];

// AIR SCE HT/STRT to APU.
_heli animate ["Switch_airsce", 0, 1];

// Fuel pump to APU.
_heli animate ["Switch_fuelpump", 0, 1];

// APU CONT to ON.
_heli animate ["Switch_apucont", 0, 1];

// Turn key
_heli animate ["Switch_ignition", 1, 1];

_return = true;
_return
