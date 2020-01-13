-- my bindings for keyboard layouts
-- see windows.lua

return {
    modifiers = {'alt'},
    showHelp  = true,
    trigger   = 'space',
    mappings  = {
      { {},         'f',      'maximize' },
      { {},         's',      'centerWithFullHeight' },
      { {},         'a',      'left' },
      { {},         'x',      'down' },
      { {},         'w',      'up' },
      { {},         'd',      'right' },
      { {},         'q',      'upLeft' },
      { {},         'e',      'upRight' },
      { {},         'z',      'downLeft' },
      { {},         'c',      'downRight' },
      { {},         'escape',    'exit'}
      -- { {'shift'},  'a',      'left40' },
      -- { {'shift'},  'd',      'right60' },
      -- { {},         'n',      'nextScreen' },
      -- { {},         'right',  'moveOneScreenEast' },
      -- { {},         'left',   'moveOneScreenWest' },
    }
  }
  