class PDT_H60_Startup
{
  // Functions for starting the bird.
  class startup
  {
    // Main startup function; validates input.
    class startupBird     {file = "functions\h60_startup\startup\fn_startupBird.sqf";};

    // Handles flipping nessasary switches; moved to its own file for consistancy.
    class flipSwitches    {file = "functions\h60_startup\startup\fn_flipSwitches.sqf";};

    // Handles pulling nessasary levers; moved to its own file for consistancy.
    class pullLevers      {file = "functions\h60_startup\startup\fn_pullLevers.sqf";};
  };

  class lights
  {
    class manageLights    {file = "functions\h60_startup\lights\fn_manageLights.sqf";};
  };

  // Misc functions; lights
  class misc
  {
    // Handles lights.
    class monitorBehavior {file = "functions\h60_startup\misc\fn_monitorBehavior.sqf";};
  };

  // Functions for making doorguns work
  class doorguns
  {
    // Handles enabling door guns.
    class enableDoorguns  {file = "functions\h60_startup\doorguns\fn_enableDoorguns.sqf";};

    class forceShoot      {file = "functions\h60_startup\doorguns\fn_forceShoot.sqf";};

    class getTargets      {file = "functions\h60_startup\doorguns\fn_getTargets.sqf";};
  };

  // Functions for debugging.
  class debug
  {
    // Handles debugging stuff; in-game messages, logs, etc.
    class debug           {file = "functions\h60_startup\debug\fn_debug.sqf";};
  };
};
