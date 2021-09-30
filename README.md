# PDT-H60-Startup

Allows AI to startup Hatchet H-60 birds and use their door guns.

### How to implement into other missions
1. Copy the `configs` and `functions` folder into the root of your mission file.

2. Open your `description.ext` and in `class CfgFunctions` paste `#include "configs\CfgFunctions.hpp"`.

3. You should now be able to paste `[this] call PDT_H60_Startup_fnc_startupBird;` in the init of an H-60 bird.

### Documentation: Work In Progress.
