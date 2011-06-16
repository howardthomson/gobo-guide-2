indexing
	description: "EiffelVision2 toolbar, implementation interface."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2007-03-22 16:17:43 -0800 (Thu, 22 Mar 2007) $"
	revision: "$Revision: 67481 $"

class
	EV_TOOL_BAR_IMP

inherit
	EV_TOOL_BAR_I
		redefine
			interface
		end

	EV_PRIMITIVE_IMP
		undefine
			update_for_pick_and_drop
		redefine
			make,
			interface,
			initialize,
	--		needs_event_box,
			set_parent_imp
		end

	EV_ITEM_LIST_IMP [EV_TOOL_BAR_ITEM]
		undefine
			item_by_data
		redefine
			make,
			interface,
			insert_i_th,
			initialize
		end

	EV_PND_DEFERRED_ITEM_PARENT

create
	make

feature {NONE} -- Implementation

	needs_event_box: BOOLEAN
			-- Does `a_widget' need an event box?
		do
			Result := True
		end

--	old_make (an_interface: like interface)
--			-- Create the tool-bar.
--		do
--			assign_interface (an_interface)
--	--		set_c_object ({EV_GTK_EXTERNALS}.gtk_toolbar_new)
--		end

	make
			-- Initialize `Current'.
		do
--			Precursor {EV_ITEM_LIST_IMP}
--			Precursor {EV_PRIMITIVE_IMP}

				-- Set widget name so that the style can be used as set in EV_GTK_DEPENDENT_APPLICATION_IMP
	--		a_cs := once "v2toolbar"
	--		{EV_GTK_EXTERNALS}.gtk_widget_set_name (list_widget, a_cs.item)

	--		{EV_GTK_EXTERNALS}.gtk_toolbar_set_show_arrow (list_widget, False)
			has_vertical_button_style := True
			disable_vertical
		end

	initialize
		do
			TODO_class_line ("EV_TOOL_BAR_IMP::initialize", "__LINE__")
		end

	list_widget: POINTER is
			--
		do
			Result := visual_widget
		end

	set_parent_imp (a_container_imp: EV_CONTAINER_IMP) is
			-- Set `parent_imp' to `a_container_imp'.
		do
			Precursor {EV_PRIMITIVE_IMP} (a_container_imp)
			update_toolbar_style
		end

feature -- Status report

	has_vertical_button_style: BOOLEAN
			-- Is the `pixmap' displayed vertically above `text' for
			-- all buttons contained in `Current'? If `False', then
			-- the `pixmap' is displayed to left of `text'.

	is_vertical: BOOLEAN
			-- Are the buttons in `Current' arranged vertically?

feature -- Status setting

	enable_vertical_button_style is
			-- Ensure `has_vertical_button_style' is `True'.
		do
			has_vertical_button_style := True
			update_toolbar_style
		end

	disable_vertical_button_style is
			-- Ensure `has_vertical_button_style' is `False'.
		do
			has_vertical_button_style := False
			update_toolbar_style
		end

	enable_vertical is
			-- Enable vertical toolbar style.
		do
			is_vertical := True
	--		{EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_set_orientation (list_widget, 1)
		end

	disable_vertical is
			-- Disable vertical toolbar style (ie: Horizontal).
		do
			is_vertical := False
			TODO_class_line ("EV_TOOLBAR_IMP::disable_vertical", "__LINE__")
		end

feature {EV_DOCKABLE_SOURCE_I} -- Implementation

	block_selection_for_docking is
			--
		do
			-- For now, do nothing.
		end

feature -- Implementation

	item_from_coords (a_x, a_y: INTEGER): EV_PND_DEFERRED_ITEM
			-- Return toolbar item corresponding to coordinates (`a_x', `a_y').
		local
			i: INTEGER
			l_width: INTEGER
			l_item_imp: EV_ITEM_IMP
		do
			from
				i := 1
			until
				i > count or else Result /= Void
			loop
				l_item_imp ?= (child_array @ i).implementation
				l_width := l_width + l_item_imp.width
				if a_x < l_width then
					Result ?= l_item_imp
				end
				i := i + 1
			end
		end

	update_toolbar_style is
			-- Set the style of `Current' relative to items
		local
			tbb_imp: EV_TOOL_BAR_BUTTON_IMP
			has_text, has_pixmap: BOOLEAN
			i, a_style: INTEGER
		do
			if parent_imp /= Void then
				from
					i := 1
				until
					i > interface.count
				loop
					tbb_imp ?= interface.i_th (i).implementation
					if tbb_imp /= Void and then not tbb_imp.text.is_equal ("") then
						has_text := True
					end
					if tbb_imp /= Void and then tbb_imp.internal_pixmap /= Void then
						has_pixmap := True
					end
					i := i + 1
				end

		--		if has_text and has_pixmap then
		--			if has_vertical_button_style then
		--				a_style := {EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_both_enum
		--			else
		--				a_style := {EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_both_horiz_enum
		--			end
		--		elseif has_text then
		--			a_style := {EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_text_enum
		--		else -- has_pixmap
		--			a_style := {EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_icons_enum
		--		end
		--		{EV_GTK_DEPENDENT_EXTERNALS}.gtk_toolbar_set_style (visual_widget, a_style)
			end
		end

	insertion_position: INTEGER
			-- `Result' is index - 1 of item beneath the
			-- current mouse pointer or count + 1 if over the toolbar
			-- and not over a button.
		local
			wid_imp: EV_GTK_WIDGET_IMP
			tbi: EV_TOOL_BAR_ITEM
		do
--			Result := count + 1
--			wid_imp := app_implementation.gtk_widget_imp_at_pointer_position
--			if wid_imp /= Void then
--				tbi ?= wid_imp.interface
--				if tbi /= Void and has (tbi) then
--					Result := index_of (tbi, 1) - 1
--				end
--			end
		end

	insert_i_th (v: like item; i: INTEGER)
			-- Insert `v' at position `i'.
		local
			v_imp: EV_ITEM_IMP
			r: EV_TOOL_BAR_RADIO_BUTTON_IMP
		do
--			v_imp ?= v.implementation
--			v_imp.set_item_parent_imp (Current)
--			{EV_GTK_EXTERNALS}.gtk_toolbar_insert (visual_widget, v_imp.c_object, i - 1)
--
--			r ?= v_imp
--			if r /= Void then
--				{EV_GTK_EXTERNALS}.gtk_radio_tool_button_set_group (r.visual_widget, radio_group)
--				radio_group := r.radio_group
--			end
--
--			child_array.go_i_th (i)
--			child_array.put_left (v)
--			if parent_imp /= Void then
--				update_toolbar_style
--			end
		end

	remove_i_th (i: INTEGER)
			-- Remove item at `i'-th position.
		local
			imp: EV_ITEM_IMP
			item_ptr: POINTER
			r: EV_TOOL_BAR_RADIO_BUTTON_IMP
			l_radio_group: POINTER
		do
--			child_array.go_i_th (i)
--			imp ?= child_array.i_th (i).implementation
--
--			r ?= imp
--			if r /= Void then
--				-- We are removing a radio button from `Current' so we make sure the radio group is valid.
--				l_radio_group := {EV_GTK_EXTERNALS}.gtk_radio_tool_button_get_group (r.visual_widget)
--				check
--					radio_button_not_null: l_radio_group /= default_pointer
--				end
--				if {EV_GTK_EXTERNALS}.g_slist_length (l_radio_group) = 1 then
--					-- This is the last radio button in the group so we set `radio_group' to null.
--					radio_group := default_pointer
--				end
--			end
--
--			item_ptr := imp.c_object
--			{EV_GTK_EXTERNALS}.gtk_container_remove (list_widget, item_ptr)
--			child_array.remove
--			imp.set_item_parent_imp (Void)
		end

feature {EV_TOOL_BAR_RADIO_BUTTON_IMP} -- Implementation

--	radio_group: POINTER
		-- GSList containing the radio peers held within `Current'

feature {EV_ANY_I} -- Implementation

	interface: EV_TOOL_BAR;

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




end -- class EV_TOOL_BAR_IMP
