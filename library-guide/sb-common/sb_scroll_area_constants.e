indexing
	description:"SB_SCROLL_AREA_CONSTANTS"
	author:		"Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright:	"Copyright (c) 2002, Eugene Melekhov and others"
	license:	"Eiffel Forum Freeware License v2 (see forum.txt)"
	status:		"mostly complete"

class SB_SCROLL_AREA_CONSTANTS

feature -- Scrollbar options

   SCROLLERS_NORMAL	: INTEGER is 0         	-- Show the scrollbars when needed
   HSCROLLER_ALWAYS	: INTEGER is 0x00008000	-- Always show horizontal scrollers
   HSCROLLER_NEVER	: INTEGER is 0x00010000	-- Never show horizontal scrollers
   VSCROLLER_ALWAYS	: INTEGER is 0x00020000	-- Always show vertical scrollers
   VSCROLLER_NEVER	: INTEGER is 0x00040000	-- Never show vertical scrollers
   HSCROLLING_ON	: INTEGER is 0         	-- Horizontal scrolling turned on (default)
   VSCROLLING_ON	: INTEGER is 0         	-- Vertical scrolling turned on (default)

   HSCROLLING_OFF: INTEGER is
         -- Horizontal scrolling turned off
      once
         Result := (HSCROLLER_NEVER | HSCROLLER_ALWAYS)
      end

   VSCROLLING_OFF: INTEGER is
         -- Vertical scrolling turned off
      once
         Result := (VSCROLLER_NEVER | VSCROLLER_ALWAYS);
      end

   SCROLLERS_TRACK		: INTEGER is 0			-- Scrollers track continuously for smooth scrolling
   SCROLLERS_DONT_TRACK	: INTEGER is 0x00080000	-- Scrollers don't track continuously

feature -- Scrollbar options, BIT Version

--	SCROLLERS_NORMAL: BIT 32 is 0B;
         -- Show the scrollbars when needed

--	HSCROLLER_ALWAYS: BIT 32 is 1000000000000000B;
         -- Always show horizontal scrollers

--	HSCROLLER_NEVER: BIT 32 is 10000000000000000B;
         -- Never show horizontal scrollers

--	VSCROLLER_ALWAYS: BIT 32 is 100000000000000000B;
         -- Always show vertical scrollers

--	VSCROLLER_NEVER: BIT 32 is 1000000000000000000B;
         -- Never show vertical scrollers

--	HSCROLLING_ON: BIT 32 is 0B;
         -- Horizontal scrolling turned on (default)

--	HSCROLLING_OFF: BIT 32 is
         -- Horizontal scrolling turned off
--		once
--			Result := (HSCROLLER_NEVER or HSCROLLER_ALWAYS)
--		end

--	VSCROLLING_ON: BIT 32 is 0B;
         -- Vertical scrolling turned on (default)

--	VSCROLLING_OFF: BIT 32 is
         -- Vertical scrolling turned off
--	  once
--	     Result := (VSCROLLER_NEVER or VSCROLLER_ALWAYS);
--	  end

--	SCROLLERS_TRACK: BIT 32 is 0B;
--			-- Scrollers track continuously for smooth scrolling

--	SCROLLERS_DONT_TRACK: BIT 32 is 10000000000000000000B;
--			-- Scrollers don't track continuously
end
