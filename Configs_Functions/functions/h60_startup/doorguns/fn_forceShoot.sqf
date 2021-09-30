/*
 *	Author: PDT
 *	Forces the AI to shoot door guns.
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
    format ["[%1] PDT_H60_Startup_fnc_forceShoot: '_heli' not defined.", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;
  _return
};

// Maximum distance from the target the gun can be pointing.
private _maxOffsetDistance = 15;

// The entity using the left gun.
private _leftGunner = _heli turretUnit [1];

// The entity using the right gun.
private _rightGunner = _heli turretUnit [2];

// List of targets for the left gunner.
private _leftTargets = [];

//List of targets for the right gunner.
private _rightTargets = [];

// Just used to prevent drawing lines over and over. Comment out when not debugging.
//_count = 0;
waitUntil {

  // The heli is dead, exit the loop.
  if !(alive _heli) then {
    true
  };

  _leftTargets = (_heli getVariable ["PDT_H60_Gunner_Left_Targets", []]);
  _rightTargets = (_heli getVariable ["PDT_H60_Gunner_Right_Targets", []]);

  // The gunners have no ammo, wait until they do.
  if (_leftGunner ammo "vtx_wpn_m134" isEqualTo 0 &&
    {_rightGunner ammo "vtx_wpn_m134_2nd" isEqualTo 0}
  ) then {
    waitUntil {
      // The gunners have ammo, continue.
      if !((_leftGunner ammo "vtx_wpn_m134") isEqualTo 0 &&
      {(_rightGunner ammo "vtx_wpn_m134_2nd") isEqualTo 0}) then {
        true
      } else {
        // The gunners have no ammo, wait 20 seconds then check again.
        uiSleep 20;
        false
      };
    };
  };

  // The group is careless, skip.
  if (combatMode (group _leftGunner) isEqualTo "CARELESS") then {
    false
  };

  // The left gunner and the right gunner have no targets, wait until they do.
  if (_leftTargets isEqualTo [] && _rightTargets isEqualTo []) then {
    waitUntil {
      // Get the left and right gunner's targets again. Needed for checking in the loop.
      _leftTargets = (_heli getVariable ["PDT_H60_Gunner_Left_Targets", []]);
      _rightTargets = (_heli getVariable ["PDT_H60_Gunner_Right_Targets", []]);

      // They have no targets, wait 5 seconds then check again.
      if (_leftTargets isEqualTo [] && _rightTargets isEqualTo []) then {
        uiSleep 5;
        false
      } else {
        // They have targets, continue.
        true
      };
    };
  };

  /* Stuff to draw lines. Comment out unless debugging.
  // Get left gunners's vectors.
  ([_heli, [1]] call ace_common_fnc_getTurretDirection) params ["_leftGunPos", "_leftGunDir"];

  // Get right gunners vectors.
  ([_heli, [2]] call ace_common_fnc_getTurretDirection) params ["_rightGunPos", "_rightGunDir"];

  // Make the variables global so they can be used by drawLine3D calls.

  // Direction the left gun is facing.
  leftGunDir = _leftGunDir;

  // Direction the right gun is facing.
  rightGunDir = _rightGunDir;

  // The left gunner.
  leftGunner = _leftGunner;

  // The right gunner.
  rightGunner = _rightGunner;

  // Only draw the lines once
  if (_count == 0) then {

    // Should be a mission event handler for stacking but it's fine for debug purposes.
    onEachFrame {
      // Where the left gunners line should begin.
      _leftVectorBegin = ASLToAGL eyePos leftGunner;

      // Where the left gunners line should end.
      // The last value ("10000") is the line length in (what I assume) meters.
      _leftVectorEnd = _leftVectorBegin vectorAdd (leftGunDir vectorMultiply (10000));

      // Draw the left gunners line (red).
      drawLine3D [_leftVectorBegin, _leftVectorEnd, [1,0,0,1]];

      // Where the right gunners line should begin.
      _rightVectorBegin = ASLToAGL eyePos rightGunner;

      // Where the right gunners line should end.
      // The last value ("10000") is the line length in (what I assume) meters.
      _rightVectorEnd = _rightVectorBegin vectorAdd (rightGunDir vectorMultiply (10000));

      // Draw the right gunners line (green).
      drawLine3D [_rightVectorBegin, _rightVectorEnd, [0,1,0,1]];
    };

    // Increment count so this doesn't run again.
    _count = _count + 1;
  }; */

  // The left gunner as targets, make him shoot.
  if !(_leftTargets isEqualTo []) then {

    // Select a random target to shoot at.
    // TODO: Prioritize targets. Vehicles on side > Infantry on side > any side.
    private _leftTarget = selectRandom _leftTargets;

    // Get the left gun's direction and postion.
    ([_heli, [1]] call ace_common_fnc_getTurretDirection) params ["_leftGunPos", "_leftGunDir"];

    /*
    This bit is a pain in the butt and I spent 6 hours getting it to work.
    What lines 158-163 are doing is: Finding the direction the gun is pointing, drawing a line
    from the gunners eyes to where the gun is pointing (tehcnically from where the gunner is
    looking but good enough), then getting the distance from that point to the target.

    Lines 162-163 are checking if the distance between those two points are equal to or greater
    than _maxOffsetDistance. If it is then the gunner fires, if not it doesn't.
    */
    private _leftVectorBegin = ASLToAGL eyePos _leftGunner;
    private _leftVectorEnd = _leftVectorBegin vectorAdd (
      _leftGunDir vectorMultiply (_leftVectorBegin vectorDistance (getPos _leftTarget))
    );

    private _leftVectorDistance = getPos _leftTarget vectorDistance _leftVectorEnd;

    if (_leftVectorDistance <= _maxOffsetDistance) then {
      _leftGunner forceWeaponFire ["vtx_wpn_m134", "far"];
    };
  };

  // Select a random target to shoot at.
  // TODO: Prioritize targets. Vehicles on side > Infantry on side > any side.
  if !(_rightTargets isEqualTo []) then {
    private _rightTarget = selectRandom _rightTargets;

    // Get the right gun's direction and postion.
    ([_heli, [2]] call ace_common_fnc_getTurretDirection) params ["_rightGunPos", "_rightGunDir"];

    /*
    This bit is a pain in the butt and I spent 6 hours getting it to work.
    What lines 184-186 are doing is: Finding the direction the gun is pointing, drawing a line
    from the gunners eyes to where the gun is pointing (tehcnically from where the gunner is
    looking but good enough), then getting the distance from that point to the target.

    Lines 184-192 are checking if the distance between those two points are equal to or greater
    than _maxOffsetDistance. If it is then the gunner fires, if not it doesn't.
    */
    private _rightVectorBegin = ASLToAGL eyePos _rightGunner;
    private _rightVectorEnd = _rightVectorBegin vectorAdd (
      _rightGunDir vectorMultiply (_rightVectorBegin vectorDistance (getPos _rightTarget))
    );

    private _rightVectorDistance = getPos _rightTarget vectorDistance _rightVectorEnd;

    if (_rightVectorDistance <= _maxOffsetDistance) then {
      _rightGunner forceWeaponFire ["vtx_wpn_m134_2nd", "far"];
    };
  };

  // Continue looping.
  false
};
