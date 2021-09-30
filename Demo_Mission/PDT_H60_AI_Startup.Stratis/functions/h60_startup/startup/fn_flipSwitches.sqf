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
  [
    format ["[%1] PDT_H60_Startup_fnc_flipSwitches: '_heli' not defined.", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
  _return
};

// Turn on batt 1 and batt 2.
_heli animateSource ["b_batt1", 1];
_heli animateSource ["b_batt2", 1];
//[_heli, "b_batt1", "ON"] call vtx_uh60_engine_fnc_batteryState;
//[_heli, "b_batt2", "ON"] call vtx_uh60_engine_fnc_batteryState;

// Turn on gen 1 and gen 2.
_heli animateSource ["b_gen1", 1];
_heli animateSource ["b_gen2", 1];
//[_heli, "b_gen1", "ON"] call vtx_uh60_engine_fnc_batteryState;
//[_heli, "b_gen2", "ON"] call vtx_uh60_engine_fnc_batteryState;

// Turn on APU generator.
_heli animateSource ["b_apugen", 1];

// Turn on standby.
_heli animateSource ["b_stbyinst", 1];

// AIR SCE HT/STRT to APU.
_heli animateSource ["b_airsce", 1];

// Fuel pump to APU.
_heli animateSource ["fuelPump", 1];
//[_heli, "fuelPump", "ON"] call vtx_uh60_engine_fnc_apuState;

// APU CONT to ON.
_heli animateSource ["apucont", 0];
//[_heli, "apucont", "ON"] call vtx_uh60_engine_fnc_batteryState;
//[_heli, "apucont", "ON"] call vtx_uh60_engine_fnc_apuState;
// Turn key
_heli animateSource ["b_ignition", 1];
//[_heli, "b_ignition", "ON"] call vtx_uh60_engine_fnc_starterState;

_heli animate ["PowerOnOff", 1];
_heli animate ["GeneratorsOnOff", 1];
_heli setVariable ["APU_POWER", true, true];

_return = true;
_return
