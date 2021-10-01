/*
 *	Author: PDT
 *	Begins the startup sequence.
 *
 *	Arguments:
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
 *  0: _heli           <OBJECT> - heli to affect. Defualt: objNull.
 *  1: _lightsOn       <BOOL>   - turn on lights? Default: false.
 *  2: _enableDoorguns <BOOL>   - enable doorguns ? Defualt true.
=======
 *  0: _heli           <OBJECT> - Heli to affect.              Defualt: objNull.
 *  1: _debug          <BOOL>   - Enable debug hints and logs. Default: false.
 *  2: _skipStartup    <BOOL>   - Skip startup?                Default: false.
 *  3: _lightsOn       <BOOL>   - Turn lights on?              Default: true.
 *  4: _enableDoorguns <BOOL>   - Enable doorguns?             Defualt: true.
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
 *
 *	Return Value:
 *	None
 *
 */

params [
  ["_heli", objNull], ["_debug", false], ["_skipStartup", false],
  ["_lightsOn", true], ["_enableDoorguns", true]
];
if (isNull _heli) exitWith {
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
=======
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: '_heli' not defined.", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
};

// Assume stuff will fail.
private _success = false;

<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
// Start flipping switches.
[
  format ["[%1] Started flipping switches...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;
=======
if !(_skipStartup) then {
  // Start flipping switches.
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Started flipping switches...", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf

  [_heli] call PDT_H60_Startup_fnc_flipSwitches;

<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
[
  format ["[%1] Completed flipping switches...%2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;

// Start pulling levers.
[
  format ["[%1] Started pulling levers...", diag_tickTime]
] call PDT_H60_Startup_fnc_debug;
=======
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Switches flipped: %2", diag_tickTime, _success],
    _debug
  ] call PDT_H60_Startup_fnc_debug;

  // Start pulling levers.
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Started pulling levers...", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf


  _success = [_heli] call PDT_H60_Startup_fnc_pullLevers;

<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
[
  format ["[%1] Completed pulling levers...%2", diag_tickTime, _success]
] call PDT_H60_Startup_fnc_debug;
=======
  [
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Levers pulled: %2", diag_tickTime, _success],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf

  // Give the heli fuel. Assumes the bird is spawned without fuel.
  _heli setFuel 1;

  // Turn on the engine so it can fly.
  _heli engineOn true;

<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
// If the lights should be turned on, do it now. TODO: Make functional.
if (_lightsOn) then {
  [
    format ["[%1] Started turning on lights...", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli] call PDT_H60_Startup_fnc_lightsOn;

  [
    format ["[%1] Completed turning on lights...%2", diag_tickTime, _success]
  ] call PDT_H60_Startup_fnc_debug;
=======
  // If the lights should be turned on, do it now. TODO: Make functional.
  if (_lightsOn) then {
    [
      format ["[%1] PDT_H60_Startup_fnc_startupBird: Started turning on lights...", diag_tickTime],
      _debug
    ] call PDT_H60_Startup_fnc_debug;

    _success = [_heli] call PDT_H60_Startup_fnc_manageLights;

    [
      format ["[%1] PDT_H60_Startup_fnc_startupBird: Lights on: %2", diag_tickTime, _success],
      _debug
    ] call PDT_H60_Startup_fnc_debug;
  };
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
};

// If the door guns should be controled by ai, do that now.
if (_enableDoorguns) then {
  [
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
    format ["[%1] Started enableing doorguns...", diag_tickTime]
=======
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Started enableing doorguns...", diag_tickTime],
    _debug
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
  ] call PDT_H60_Startup_fnc_debug;

  _success = [_heli] call PDT_H60_Startup_fnc_enableDoorguns;

  [
<<<<<<< HEAD:PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
    format ["[%1] Completed enableing doorguns...%2", diag_tickTime, _success]
=======
    format ["[%1] PDT_H60_Startup_fnc_startupBird: Doorguns enabled: %2", diag_tickTime, _success],
    _debug
>>>>>>> bugfix-improvement-documentation:Demo_Mission/PDT_H60_AI_Startup.Stratis/functions/h60_startup/startup/fn_startupBird.sqf
  ] call PDT_H60_Startup_fnc_debug;
};
