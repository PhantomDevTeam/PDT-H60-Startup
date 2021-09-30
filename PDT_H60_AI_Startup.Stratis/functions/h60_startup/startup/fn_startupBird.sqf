/*
 *	Author: PDT
 *	Begins the startup sequence. TODO: Remove debug stuff.
 *
 *	Arguments:
 *  0: _heli           <OBJECT> - heli to affect. Defualt: objNull.
 *  1: _lightsOn       <BOOL>   - turn on lights? Default: false.
 *  2: _enableDoorguns <BOOL>   - enable doorguns ? Defualt true.
 *
 *	Return Value:
 *	None
 *
 */

params [["_heli", objNull], ["_lightsOn", false], ["_enableDoorguns", true]];
if (isNull _heli) exitWith {
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
};

// Assume stuff will fail.
private _success = false;

// Start flipping switches.
[
  format ["[%1] Started flipping switches...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;

[_heli] call PDT_H60_Startup_fnc_flipSwitches;

[
  format ["[%1] Completed flipping switches...%2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;

// Start pulling levers.
[
  format ["[%1] Started pulling levers...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;


_success = [_heli] call PDT_H60_Startup_fnc_pullLevers;

[
  format ["[%1] Completed pulling levers...%2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;

// Give the heli fuel. Assumes the bird is spawned without fuel.
_heli setFuel 1;

// Turn on the engine so it can fly.
_heli engineOn true;

// If the lights should be turned on, do it now. TODO: Make functional.
if (_lightsOn) then {
  [
    format ["[%1] Started turning on lights...", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli] call PDT_H60_Startup_fnc_lightsOn;

  [
    format ["[%1] Completed turning on lights...%2", diag_tickTime, _success]
  ] call PDT_H60_Startup_fnc_debug;
};

// If the door guns should be controled by ai, do that now.
if (_enableDoorguns) then {
  [
    format ["[%1] Started enableing doorguns...", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli] call PDT_H60_Startup_fnc_enableDoorguns;

  [
    format ["[%1] Completed enableing doorguns...%2", diag_tickTime, _success]
  ] call PDT_H60_Startup_fnc_debug;
};
