note

	description:
		"EiffelVision label, gtk implementation."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	id: "$Id: ev_label_imp.e 80388 2009-08-21 21:40:11Z manus $"
	date: "$Date: 2009-08-21 14:40:11 -0700 (Fri, 21 Aug 2009) $"
	revision: "$Revision: 80388 $"

class
	EV_LABEL_IMP

inherit
	EV_LABEL_I
		redefine
			interface
		end

	EV_PRIMITIVE_IMP
		redefine
			interface,
			needs_event_box,
			make
		end

	EV_TEXTABLE_IMP
		redefine
			interface
		end

	EV_FONTABLE_IMP
		redefine
			interface
		end

create
	make

feature {NONE} -- Initialization

	old_make (an_interface: like interface)
			-- Create a gtk label.
		do
			assign_interface (an_interface)
		end

	make
			-- Create and initialize label.
		local
			a_cs: EV_GTK_C_STRING
			int_value: INTEGER
		do
			textable_imp_initialize
			set_c_object (text_label)
			align_text_center
			a_cs := app_implementation.c_string_from_eiffel_string (once "justify")
			{EV_GTK_EXTERNALS}.g_object_get_integer (text_label, a_cs.item, $int_value)
			Precursor
			set_is_initialized (True)
		end

feature -- Access

	angle: REAL
		-- Amount text is rotated counter-clockwise from horizontal plane in radians.

	set_angle (a_angle: REAL)
			--
		do
			{EV_GTK_EXTERNALS}.gtk_label_set_angle (text_label, a_angle / {REAL_32} 3.14 * {REAL_32} 180.0)
			angle := a_angle
		end

feature {NONE} -- Implementation

	needs_event_box: BOOLEAN = True
			-- Does `a_widget' need an event box?

feature {EV_ANY, EV_ANY_I} -- Implementation

	interface: detachable EV_LABEL note option: stable attribute end;

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

end --class LABEL_IMP