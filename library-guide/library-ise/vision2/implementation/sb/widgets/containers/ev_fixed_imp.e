indexing
	description:
		"Eiffel Vision fixed. Slyboots implementation."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2007-03-21 10:43:22 -0800 (Wed, 21 Mar 2007) $"
	revision: "$Revision: 67434 $"

class
	EV_FIXED_IMP

inherit
	EV_FIXED_I
		undefine
			propagate_foreground_color,
			propagate_background_color
		redefine
			interface,
			extend_with_position_and_size,
			set_item_position_and_size
		end

	EV_WIDGET_LIST_IMP
		redefine
			make,
			interface,
--			initialize
		end

create
	make

feature {NONE} -- Initialization

--	old_make (an_interface: like interface) is
--			-- Create the fixed container.
--		do
--			base_make (an_interface)
--			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			set_c_object ({EV_GTK_DEPENDENT_EXTERNALS}.gtk_fixed_new)
--		end

	make is
			-- Initialize `Current'.
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			{EV_GTK_EXTERNALS}.gtk_fixed_set_has_window (container_widget, True)
--			Precursor
		end

feature -- Status setting

	extend_with_position_and_size (a_widget: EV_WIDGET; a_x, a_y, a_width, a_height: INTEGER)
			-- Add `a_widget' to `Current' with a position of `a_x', a_y' and a dimension of `a_width' and `a_height'.
		local
			l_widget_imp: EV_WIDGET_IMP
--			l_parent_box: POINTER
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			l_widget_imp ?= a_widget.implementation
--			l_parent_box := {EV_GTK_EXTERNALS}.gtk_event_box_new
--			{EV_GTK_EXTERNALS}.gtk_event_box_set_visible_window (l_parent_box, False)
--			{EV_GTK_EXTERNALS}.gtk_container_add (l_parent_box, l_widget_imp.c_object)
--			{EV_GTK_EXTERNALS}.gtk_container_add (list_widget, l_parent_box)
--			child_array.go_i_th (count + 1)
--			child_array.put_left (a_widget)
--			on_new_item (l_widget_imp)
--			if index = count then
--				index := index + 1
--			end
--			{EV_GTK_EXTERNALS}.gtk_fixed_move (container_widget, l_parent_box, a_x, a_y)
--			{EV_GTK_EXTERNALS}.gtk_widget_set_minimum_size (l_parent_box, a_width, a_height)
--			{EV_GTK_EXTERNALS}.gtk_widget_show (l_parent_box)
--			{EV_GTK_EXTERNALS}.gtk_container_check_resize (container_widget)
		end

	set_item_position_and_size (a_widget: EV_WIDGET; a_x, a_y, a_width, a_height: INTEGER)
			-- Assign `a_widget' with a position of `a_x' and a_y', and a dimension of `a_width' and `a_height'.
		local
--			l_parent_box: POINTER
			w_imp: EV_WIDGET_IMP
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			w_imp ?= a_widget.implementation
--			l_parent_box := {EV_GTK_EXTERNALS}.gtk_widget_struct_parent (w_imp.c_object)
--			{EV_GTK_EXTERNALS}.gtk_fixed_move (container_widget, l_parent_box, a_x, a_y)
--			{EV_GTK_EXTERNALS}.gtk_widget_set_minimum_size (l_parent_box, a_width, a_height)
--			{EV_GTK_EXTERNALS}.gtk_container_check_resize (container_widget)
		end

	set_item_position (a_widget: EV_WIDGET; a_x, a_y: INTEGER) is
			-- Set `a_widget.x_position' to `a_x'.
			-- Set `a_widget.y_position' to `a_y'.
		local
			w_imp: EV_WIDGET_IMP
--			l_parent_box, l_parent_window, l_fixed_child: POINTER
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			w_imp ?= a_widget.implementation
--			l_parent_box := {EV_GTK_EXTERNALS}.gtk_widget_struct_parent (w_imp.c_object)
--
--			if app_implementation.rubber_band_is_drawn then
--					-- This is a hack to prevent drawing corruption during pick and drop.
--				app_implementation.erase_rubber_band
--				l_fixed_child := i_th_fixed_child (index_of (a_widget, 1))
--				{EV_GTK_EXTERNALS}.set_gtk_fixed_child_struct_x (l_fixed_child, a_x)
--				{EV_GTK_EXTERNALS}.set_gtk_fixed_child_struct_y (l_fixed_child, a_y)
--				l_parent_window := {EV_GTK_EXTERNALS}.gtk_widget_struct_window (w_imp.c_object)
--				{EV_GTK_EXTERNALS}.gdk_window_move (l_parent_window, a_x, a_y)
--			end
--			{EV_GTK_EXTERNALS}.gtk_fixed_move (container_widget, l_parent_box, a_x, a_y)
		end

	set_item_size (a_widget: EV_WIDGET; a_width, a_height: INTEGER) is
			-- Set `a_widget.width' to `a_width'.
			-- Set `a_widget.height' to `a_height'.
		local
			w_imp: EV_WIDGET_IMP
--			l_parent_box: POINTER
--			l_c_object: POINTER
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			w_imp ?= a_widget.implementation
--			l_c_object := w_imp.c_object
--			l_parent_box := {EV_GTK_EXTERNALS}.gtk_widget_struct_parent (l_c_object)
--			{EV_GTK_EXTERNALS}.gtk_widget_set_minimum_size (l_parent_box, a_width, a_height)
--			{EV_GTK_EXTERNALS}.gtk_container_check_resize (container_widget)
		end

feature {EV_ANY_I} -- Implementation

	i_th_fixed_child (i: INTEGER): POINTER is
			-- `i-th' fixed child of `Current'.
		local
--			glist: POINTER
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			glist := {EV_GTK_EXTERNALS}.gtk_fixed_struct_children (container_widget)
--			Result := {EV_GTK_EXTERNALS}.g_list_nth_data (glist, i - 1)
		end

	x_position_of_child (a_widget_imp: EV_WIDGET_IMP): INTEGER is
			-- X position of `a_widget_imp' within `Current'.
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
--			Result := {EV_GTK_EXTERNALS}.gtk_fixed_child_struct_x (i_th_fixed_child (index_of (a_widget_imp.interface, 1)))
		end

	y_position_of_child (a_widget_imp: EV_WIDGET_IMP): INTEGER is
			-- Y position of `a_widget_imp' within `Current'.
		do
			todo_class_line ("__EV_FIXED_IMP__", "__LINE__")
		end

	interface: EV_FIXED;
			-- Provides a common user interface to platform dependent
			-- functionality implemented by `Current'

indexing
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"




end -- class EV_FIXED

