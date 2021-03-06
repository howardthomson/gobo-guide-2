indexing
	description: "[
		Window showing the complete structure of windows and attached widgets
		in the application, including (read-only ??!) the windows and dialogs, etc
		used in the design process.

		Selectable hiding preferable for non-application created windows &c
	]"
	author:		"Howard Thomson"
	copyright:	"Copyright (c) 2004, Howard Thomson and others"
	license:	"Eiffel Forum Freeware License v2"
	status:		"Initial draft -- design intention"

	todo: "[
		Update tree on window closure/deletion to ensure continuing
		mapping between window tree from root window and tree display
	]"

class SB_WIDGETS_DISPLAY_TREE

inherit
	SB_TOP_WINDOW
		rename
			make as make_top_window
		redefine
			class_name,
			handle_2,
			destruct
		end

	SB_TREE_LIST_CONSTANTS

creation { SB_APPLICATION_DEF }
	make

feature -- Attributes

	tree: SB_TREE_LIST

feature -- class name

	class_name: STRING is
		once
			Result := "SB_WIDGETS_DISPLAY_TREE"
		end

feature -- Creation

	make is
		do
			make_top(get_app, "Windows and Widgets display tree",
				Void,			-- Icon
				Void,			-- Mini-icon
				Decor_all,		-- Options
				0,0, 100,100,	-- x,y,w,h
				0,0,0,0,		-- pl,pr,pt,pb	(padding)
				0,0)			-- hs,vs		(spacing ??)
			create tree.make(Current, 20,
				Current, 0,
				Layout_fill_x | Layout_fill_y | Treelist_normal
				| Treelist_shows_lines | Treelist_shows_boxes | Treelist_root_boxes)
			add_tree
			show
		end

feature -- creation implementation

	add_tree_test is
			-- Add all the windows and components to
			-- the display tree
		local
			p, c: SB_TREE_LIST_ITEM
		do
			tree.create_item_last(p, "Item 1", Void, Void, Void, False).discard_result
			p := tree.create_item_last(Void, "Item 2", Void, Void, Void, False)
			c := tree.create_item_last(p, "Item 2 Child", Void, Void, Void, False)
			c.set_expanded(True)
		end

	add_tree is
			-- Add all the windows and components to
			-- the display tree
		local
			w: SB_WINDOW
			p, c: SB_TREE_LIST_ITEM
		do
			from
				w := get_app.root_window.first_child
			until
				w = Void
			loop
				p := tree.create_item_last(Void,
									"Window # " + w.window_key.out + " (" + w.class_name + ")",
									Void, Void, Void, False)
			--	fx_trace(0, <<"Root window # ", w.window_key.out, " (", w.class_name, ")">>)
			--	p.set_expanded(True)
				p.set_data(w)
				add_children(w, p)
				w := w.next
			end
		end

	add_children(a_w: SB_WINDOW; a_p: SB_TREE_LIST_ITEM) is
			-- Add child items for subwindows to parent item
		require
			valid_window: a_w /= Void
			valid_tree_item: a_p /= Void
		local
			w: SB_WINDOW
			p, c: like a_p
		do
			from
				w := a_w.first_child
				p := a_p
			until
				w = Void
			loop
				c := tree.create_item_last(p, w.class_name, Void, Void, Void, False)	-- .discard_result
			--	fx_trace(0, <<"Child window: ", w.class_name>>)
				w.trace_values
			--	c.set_expanded(True)
				c.set_data(w)
				if w.first_child /= Void then
					w := w.first_child
					p := c
					c := Void
				else
					from
					until
						w.parent = a_w or else w.next /= Void
					loop
						w := w.parent
						p := p.parent
					end
					w := w.next
				end
			end
		end

feature -- Window tree modification

	add_window(aw: SB_WINDOW) is
			-- add window into display tree
		local
			w: SB_WINDOW
			i, new_i: SB_TREE_LIST_ITEM
			done: BOOLEAN
			root_window: SB_WINDOW
		do
			root_window := get_app.root_window
			if aw.parent = root_window then
				new_i := tree.create_item_last(Void, "Window # " + aw.window_key.out + " (" + aw.class_name + ")",
									Void, Void, Void, False)
				new_i.set_data(aw)
			else
				from
					i := tree.first_item
				until
					i = Void or else done
				loop
					if aw.parent = i.data then
						done := True
						new_i := tree.create_item_last(i, aw.class_name, Void, Void, Void, False)
						new_i.set_data(aw)
					else
						if i.first_child /= Void then
							i := i.first_child
						else
							from
							until
								i.next /= Void or else i.parent = Void
							loop
								i := i.parent
							end
							i := i.next
						end
					end
				end
			end
		end

	remove_window(aw: SB_WINDOW) is
			-- Remove window item(s) on destruction
		local
			w: SB_WINDOW
			i: SB_TREE_LIST_ITEM
			done: BOOLEAN
			root_window: SB_WINDOW
		do
--			root_window := get_app.root_window
--			if aw.parent = root_window then
				
		end

feature -- Destruction, of this window

	destruct is
		do
			application.on_widgets_display_window_close
			Precursor
		end

feature -- Event handling

	handle_2 (sender: SB_MESSAGE_HANDLER; type, sel: INTEGER; data: ANY): BOOLEAN is
		do
			if sender = tree then
				if match_function_2 (Sel_rightbuttonpress, 0, type, sel)
				or else match_function_2 (Sel_rightbuttonrelease, 0, type, sel) then
				--	fx_trace(0, <<"SB_WIDGETS_DISPLAY_TREE::handle - ",
				--											"seltype: ",
				--											seltype(sel).out,
				--											" Sel_ID: ",
				--											selid(sel).out
				--											>>)
				end
			else
				Result := Precursor(sender, type, sel, data)
			end
		end

end