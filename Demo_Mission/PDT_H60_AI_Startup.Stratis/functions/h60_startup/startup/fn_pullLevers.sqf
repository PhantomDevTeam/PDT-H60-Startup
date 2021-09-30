/*
 *	Author: PDT
 *	Pulls levers.
 *
 *	Arguments:
 *  0: _heli     <OBJECT> - heli to affect. Defualt: objNull.
 *
 *	Return Value:
 *	None
 *
 */

params [["_heli", objNull]];
private _return = false;
if (isNull _heli) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_pullLevers: '_heli' not defined.", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;
  _return
};

// Left fuel to DIR.
_heli animate ["b_fuelsys1", 0.6, 1];

// Left ENG CONT to fly.
_heli animate ["b_engpowercont1", 0.85, 1];

// Right fuel to DIR.
_heli animate ["b_fuelsys2", 0.6, 1];

// Right ENG CONT to fly.
_heli animate ["b_engpowercont1", 0.85, 1];

// APU CONT to ON.
_heli animate ["apucont", 0.5, 1];

// AIR SCE HT/STRT to ENG.
_heli animate ["b_airsce", 1, 1];

_return = true;
_return
