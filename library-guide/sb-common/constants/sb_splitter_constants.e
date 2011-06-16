indexing
	description:"SB_SPLITTER constants"
	author:		"Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright:	"Copyright (c) 2002, Eugene Melekhov and others"
	license:	"Eiffel Forum Freeware License v2 (see forum.txt)"
	status:		"mostly complete"

class SB_SPLITTER_CONSTANTS

feature

	SPLITTER_HORIZONTAL : INTEGER is 0			-- Split horizontally
	SPLITTER_VERTICAL   : INTEGER is 0x00008000	-- Split vertically
	SPLITTER_REVERSED   : INTEGER is 0x00010000	-- Reverse-anchored
	SPLITTER_TRACKING   : INTEGER is 0x00020000	-- Track continuous during split
	SPLITTER_NORMAL     : INTEGER is 0

	SPLITTER_MASK: INTEGER is
		once
			Result := SPLITTER_REVERSED | SPLITTER_VERTICAL | SPLITTER_TRACKING;
		end

end