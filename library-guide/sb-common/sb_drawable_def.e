indexing
	description: "[
				Drawable is an abstract base class for any surface that can be
				drawn upon, such as a SB_WINDOW, or SB_IMAGE.
	]"

	author:		"Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright:	"Copyright (c) 2002, Eugene Melekhov and others"
	license:	"Eiffel Forum Freeware License v2 (see forum.txt)"
	status:		"Mostly complete"
	TODO:	"[
		Define set_width and set_height inherited, respectively,
		from SB_PV_WIDTH, SB_PV_HEIGHT
	]"

deferred class SB_DRAWABLE_DEF

inherit

	SB_SERVER_RESOURCE
      	rename
         	init as init_resource
      	redefine
         	destruct
      	end

	SB_PROPERTIES
		redefine
			add_properties
		end

	SB_PV_WIDTH
	SB_PV_HEIGHT

	SB_COMMON_MACROS

	SB_DEFS

feature -- Attributes

	visual: SB_VISUAL
		-- Visual for this window

feature -- Actions

	set_visual (a_visual: SB_VISUAL) is
			-- Change visual
		require
			a_visual /= Void
			not is_attached
      	do
      		visual := a_visual
		end

	resize (w, h: INTEGER) is
    		--  Resize drawable to the specified width and height
    	do
        	width := w.max (1)
        	height := h.max (1)
      	end

feature -- Destruction

	destruct is
		do
			visual := Void
			Precursor
		end

feature -- Properties

	add_properties is
		local
			p_width: SB_PROPERTY_WIDTH
			p_height: SB_PROPERTY_HEIGHT
		do
			Precursor
			add_property_width
			add_property_height

		--	create p_width;		to.add_last(p_width)
		--	create p_height;	to.add_last(p_height)
		end


feature {NONE} -- Implementation

	make (w, h: INTEGER ) is
		do
			init_resource
			visual := application.default_visual
			width := w.max (1)
			height := h.max (1)
		end

	paint_dc: SB_DC_WINDOW is
		once
			create Result.make_once
		end

invariant
	good_width: width >= 0
	good_height: height >= 0
end
