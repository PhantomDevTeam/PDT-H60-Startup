/*
 *	Author: PDT
 *	enables doorguns
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

// Flip left cover.
_heli animate ["Switch_minigun_safe_cover_l", 1, 1];

// Flip left safty.
_heli animate ["Switch_minigun_safe_l", 1, 1];
[_heli, "l", false] call vtx_uh60_doorguns_fnc_switchSafety;

// Flip right cover.
_heli animate ["Switch_minigun_safe_cover_r", 1, 1];

// Flip right safety.
_heli animate ["Switch_minigun_safe_r", 1, 1];
[_heli, "r", false] call vtx_uh60_doorguns_fnc_switchSafety;

// Attempt to make the guns fire by themselves. It didn't work.
_heli enablePersonTurret [[1],true];
_heli enablePersonTurret [[2],true];

// Make the gunners shoot at stuff.
[_heli] spawn PDT_H60_Startup_fnc_forceShoot;

// Find targets for the gunners to shoot.
[_heli] spawn PDT_H60_Startup_fnc_getTargets;

_return = true;
_return
