note
   description: "SB_TOOL_BAR commands."
   author: "Eugene Melekhov <eugene_melekhov@mail.ru>"
   copyright: "Copyright (c) 2002, Eugene Melekhov and others"
   license: "Eiffel Forum Freeware License v1 (see forum.txt)"
   status: "Mostly complete"

expanded class SB_TOOL_BAR_COMMANDS

inherit

   SB_PACKER_COMMANDS
      rename Id_last as PACKER_ID_LAST
      end

feature

   ID_UNDOCK: INTEGER
      -- Undock the toolbar
      once
         Result := PACKER_ID_LAST;
      end

   ID_DOCK_TOP: INTEGER
      -- Dock on the top
      once
         Result := PACKER_ID_LAST + 1;
      end

   ID_DOCK_BOTTOM: INTEGER
      -- Dock on the bottom
      once
         Result := PACKER_ID_LAST + 2;
      end

   ID_DOCK_LEFT: INTEGER
      -- Dock on the left
      once
         Result := PACKER_ID_LAST + 3;
      end

   ID_DOCK_RIGHT: INTEGER
      -- Dock on the right
      once
         Result := PACKER_ID_LAST + 4;
      end

   ID_TOOLBARGRIP: INTEGER
      -- Notifications from toolbar grip
      once
         Result := PACKER_ID_LAST + 5;
      end

   Id_last: INTEGER
      once
         Result := PACKER_ID_LAST + 6;
      end

end