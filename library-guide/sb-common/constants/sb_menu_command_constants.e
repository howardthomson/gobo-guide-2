note
	description:"SB_MENU_COMMAND constants"
	author:		"Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright:	"Copyright (c) 2002, Eugene Melekhov and others"
	license:	"Eiffel Forum Freeware License v2 (see forum.txt)"
	status:		"Mostly complete"

class SB_MENU_COMMAND_CONSTANTS

feature

	MENUSTATE_NORMAL: INTEGER = 0;
    	-- Normal, unchecked state
	MENUSTATE_CHECKED: INTEGER = 1;
		-- Checked with a checkmark
	MENUSTATE_RCHECKED: INTEGER = 2;
		-- Checked with a bullet

end
