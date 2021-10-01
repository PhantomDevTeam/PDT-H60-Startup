# PDT-H60-Startup

Allows AI to startup Hatchet H-60 birds and use their door guns.

### How to implement into other missions
1. Copy the `configs` and `functions` folders from `Configs_Functions` into the root of your mission file.

2. Open your `description.ext` and in `class CfgFunctions` paste `#include "configs\CfgFunctions.hpp"`.

3. You should now be able to paste `[this] call PDT_H60_Startup_fnc_startupBird;` in the init of an H-60 bird.

### Demo mission
A demo mission is available in `Demo_Mission`. Paste it into `Documents\Arma 3 - Other Profiles\Your_Profile\missions`.

### Quick start
If you want AI to fly the helicopter paste `[this] call PDT_H60_Startup_fnc_startupBird;` in its init.

If a player will be flying paste: `[this, false, true] call PDT_H60_Startup_fnc_startupBird;` in its init.

### Documentation: Work In Progress.
