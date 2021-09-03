/*
 *	Author: PDT
 *	Gets a list of targets for the door guns.
 *
 *	Arguments:
 *  0: _heli <OBJECT> - heli to affect. Defualt: objNull.
 *
 *	Return Value:
 *	None
 *
 */

params [["_heli", objNull]];
private _return = false;
if (isNull _heli) exitWith {
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
  _return
};

// The entity using the left gun.
private _leftGunner = _heli turretUnit [1];

// The entity using the right gun.
private _rightGunner = _heli turretUnit [2];

waitUntil {

  // The heli is dead, exit the loop.
  if !(alive _heli) then {
    true
  } else {

    // A list of possible targets for the left gunner.
    private _leftTargets = _leftGunner targets [true, 5000, []];

    // A list of possible targets for the right gunner.
    private _rightTargets = _rightGunner targets [true, 5000, []];

    // List of verified targets for the left gunner.
    private _leftVerifiedTargets = [];

    // List of verified targets for the left gunner.
    private _rightVerifedTargets = [];

    // Only targets if the left gunner is alive.
    if (alive _leftGunner) then {
      // Only get a list of targets that are alive, known to the target, and are not unconscious.
      _leftVerifiedTargets = _leftTargets select {
        alive _x && {(_leftGunner knowsAbout _x) >= 0} &&
        {!(_x getVariable ["ACE_isUnconscious", false])}
      };
    };

    // Only check targets if the right gunner is alive.
    if (alive _rightGunner) then {
      // Only get a list of targets that are alive, known to the target, and are not unconscious.
      _rightVerifiedTargets = _rightTargets select {
        alive _x && {(_rightGunner knowsAbout _x) >= 0} &&
        {!(_x getVariable ["ACE_isUnconscious", false])}
      };
    };

    // Update the target lists.
    _heli setVariable ["PDT_H60_Gunner_Left_Targets", _leftVerifiedTargets, true];
    _heli setVariable ["PDT_H60_Gunner_Right_Targets", _rightVerifedTargets, true];

    // Wait 5 seconds before checking again.
    uiSleep 5;
    false
  };
};
