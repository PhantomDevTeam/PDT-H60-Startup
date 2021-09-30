/*
 *	Author: PDT
 *	Begins the startup sequence. TODO: Remove debug stuff.
 *
 *	Arguments:
 *  0: _heli           <OBJECT> - Heli to affect.  Defualt: objNull.
 *  1: _lightsOn       <BOOL>   - Turn lights on?  Default: false.
 *  2: _enableDoorguns <BOOL>   - Enable doorguns? Defualt true.
 *
 *	Return Value:
 *	None
 *
 */

params [["_heli", objNull], ["_lightsOn", false], ["_enableDoorguns", true]];
if (isNull _heli) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: '_heli' not defined.", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;
};

// Assume stuff will fail.
private _success = false;

// Start flipping switches.
[
  format ["[%1] PDT_H60_Startup_fnc_startupBird: Started flipping switches...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;

[_heli] call PDT_H60_Startup_fnc_flipSwitches;

[
  format ["[%1] PDT_H60_Startup_fnc_startupBird: Switches flipped: %2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;

// Start pulling levers.
[
  format ["[%1] PDT_H60_Startup_fnc_startupBird: Started pulling levers...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;


_success = [_heli] call PDT_H60_Startup_fnc_pullLevers;

[
  format ["[%1] PDT_H60_Startup_fnc_startupBird: Levers pulled: %2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;

// Give the heli fuel. Assumes the bird is spawned without fuel.
_heli setFuel 1;

// Turn on the engine so it can fly.
_heli engineOn true;

// If the lights should be turned on, do it now. TODO: Make functional.
if (_lightsOn) then {
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Started turning on lights...", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli, true, true, true, true] call PDT_H60_Startup_fnc_manageLights;

  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Lights on: %2", diag_tickTime, _success]
  ] call PDT_H60_Startup_fnc_debug;
};

// If the door guns should be controled by ai, do that now.
if (_enableDoorguns) then {
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Started enableing doorguns...", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli] call PDT_H60_Startup_fnc_enableDoorguns;

  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Doorguns enabled: %2", diag_tickTime, _success]
  ] call PDT_H60_Startup_fnc_debug;
};
