/*
 *	Author: PDT
 *	Checks a unit's behaviour in a loop and does stuff based on its state.
 *
 *	Arguments:
 *  0: _unit <OBJECT> - Unit to monitor.             Defualt: objNull.
*  1: _debug <BOOL>   - Enable debug hints and logs. Default: false.
 *
 *	Return Value:
 *	None.
 *
 */

params [["_unit", objNull], ["_debug", false]];

if (isNull _unit) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_monitorBehavior: '_unit' not defined.", diag_tickTime],
    _debug
  ] call PDT_H60_Startup_fnc_debug;
};


waitUntil {
  if (!alive _unit) then {
    true
  } else {
    // Get the current behaviour of the unit.
    private _behavior = behaviour _unit;

    // Do stuff based on the behaviour.
    switch (_behavior) do {

      // Unit is aware do they should probably turn off lights.
      case "AWARE": {
        // If the unit is not able to turn off lights, let them.
        if !(_unit checkAIFeature "lights") then {
          _unit enableAI "lights";

          // Turn off collision lights so they don't get shot down.
          (vehicle _unit) setCollisionLight false;
        };
      };

      // Unit is in combat they should turn off lights.
      case "COMBAT": {
        // If the unit is not able to turn off lights, let them.
        if !(_unit checkAIFeature "lights") then {
          _unit enableAI "lights";

          // Turn off collision lights so they don't get shot down.
          (vehicle _unit) setCollisionLight false;
        };
      };

      // The unit doesn't care, lights should be on.
      case "CARELESS": {
        // If the unit is able to turn off lights, don't let them.
        if (_unit checkAIFeature "lights") then {
          _unit disableAI "lights";

          // Turn on the lights.
          _unit setPilotLight true;
        };
      };

      // Unit is trying to be stealth they should turn off lights.
      case "STEALTH": {
        // If the unit is not able to turn off lights, let them.
        if !(_unit checkAIFeature "lights") then {
          _unit enableAI "lights";

          // Turn off collision lights so they don't get shot down.
          (vehicle _unit) setCollisionLight false;
        };
      };

      // The unit is safe, lights should be on.
      default {
        // If the unit is able to turn off lights, don't let them.
        if (_unit checkAIFeature "lights") then {
          _unit disableAI "lights";

          // Turn on the lights.
          _unit setPilotLight true;
        };
      };
    };

    // Wait 5 seconds then check again. This is a simple loop but it shouldn't run all the time.
    sleep 5;
    false
  };
};
