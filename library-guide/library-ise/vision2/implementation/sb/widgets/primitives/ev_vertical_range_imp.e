note 
	description: "Eiffel Vision vertical range. GTK+ implementation."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2006-01-22 18:25:44 -0800 (Sun, 22 Jan 2006) $"
	revision: "$Revision: 56675 $"

class
	EV_VERTICAL_RANGE_IMP

inherit
	EV_VERTICAL_RANGE_I
		redefine
			interface
		end

	EV_RANGE_IMP
		redefine
			interface,
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Create the vertical range.
		do
			todo_class_line ("__EV_VERTICAL_RANGE_IMP__", "__LINE__")

--			Precursor {EV_RANGE_IMP} (an_interface)
--			set_c_object ({EV_GTK_EXTERNALS}.gtk_vscale_new (adjustment))
		end

feature {EV_ANY_I} -- Implementation

	interface: EV_VERTICAL_RANGE;

note
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class EV_VERTICAL_RANGE_IMP

