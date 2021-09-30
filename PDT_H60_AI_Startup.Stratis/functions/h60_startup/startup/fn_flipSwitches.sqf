/*
 *	Author: PDT
 *	Flips switches. TODO: Add sounds.
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
  [format ["[%1] '_heli' not defined.", diag_tickTime]] call PDT_H60_Startup_fnc_debug;
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
