/*
 *	Author: PDT
 *	Turns lights on or off. For control pannel lights with adjustable brightness, that can be set as well.
 *
 *	Arguments:
 *  0: _heli             <OBJECT> - heli to affect.                             Defualt: objNull.
 *  1: _collisionLights  <BOOL>   - Turn on collision lights.                   Default: true.
 *  2: _positionLights   <BOOL>   - Turn on position lights.                    Default: true.
 *  3: _cockpitLight     <BOOL>   - Turn on cockpit light.                      Default: false.
 *  4: _landingLight     <BOOL>   - Turn on landing light.                      Default: false.
 *  5: _upperConsole     <NUMBER> - Upper console brightness, from 0 to 10.     Default: 2.
 *  6: _lowerConsole     <NUMBER> - Lower console brightness, from 0 to 10.     Default: 2.
 *  7: _instrumentPannel <NUMBER> - Instrument pannel brightness, from 0 to 10. Default: 2.
 *
 *	Return Value:
 *	None.
 *
 */

params [
  ["_heli", objNull], ["_collisionLights", true], ["_positionLights", true],
  ["_cockpitLight", false], ["_landingLight", false],
  ["_upperConsole", 2], ["_lowerConsole", 2], ["_instrumentPannel", 2]
];

if (isNull _heli) exitWith {
  [
    format ["[%1] PDT_H60_Startup_fnc_getTargets: '_heli' not defined.", diag_tickTime]
  ] call PDT_H60_Startup_fnc_debug;
};

_heli setPilotLight true;

// Collision lights
if (_collisionLights) then {
  _heli animateSource ["Switch_lights_collision", 1];
  _heli setCollisionLight true;
} else {
  _heli animateSource ["Switch_lights_collision", 0.5];
  _heli setCollisionLight false;
};

// Position lights
if (_positionLights) then {
  _heli animateSource ["Switch_lights_position", 1];
  _heli animateSource ["PositionLight_Show", 1];
} else {
  _heli animateSource ["Switch_lights_position", 0.5];
  _heli animateSource ["PositionLight_Show", 0];
};

if (_cockpitLight) then {
  _heli animateSource ["Switch_lights_cockpit", 1];
  _heli animateSource ["CockpitLight_Show", 1];
} else {
  _heli animateSource ["Switch_lights_cockpit", 0.5];
  _heli animateSource ["CockpitLight_Show", 0];
};

if (_landingLight) then {
  (driver _heli) action ["lightOn", _heli];
  _heli animateSource ["LandingLight_Show", 1];
  _heli setPilotLight true;
} else {
  (driver _heli) action ["lightOff", _heli];
  _heli animateSource ["LandingLight_Show", 0];
  _heli setPilotLight false;
};

if (_upperConsole > 0) then {
  _heli setObjectMaterialGlobal [
    0,
    format ["\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_%1.rvmat", round(_upperConsole)]
  ];
} else {
  _heli setObjectMaterialGlobal [
    0,
    "\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_0.rvmat"
  ];
};

if (_lowerConsole > 0) then {
  _heli setObjectMaterialGlobal [
    2,
    format ["\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_%1.rvmat", round(_lowerConsole)]
  ];
} else {
  _heli setObjectMaterialGlobal [
    2,
    "\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_0.rvmat"
  ];
};

if (_instrumentPannel > 0) then {
  _heli setObjectMaterialGlobal [
    1,
    format ["\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_%1.rvmat", round(_instrumentPannel)]
  ];
} else {
  _heli setObjectMaterialGlobal [
    1,
    "\z\vtx\addons\UH60\Data\Cockpit\Emmisive\Emmisive_0.rvmat"
  ];
};

_heli animateSource ["LandingLight_Show", 0];
_heli animateSource ["CockpitLight_Show", 0];
_heli animateSource ["PositionLight_Show", 0];
