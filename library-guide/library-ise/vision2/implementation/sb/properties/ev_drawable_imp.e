indexing
	description: "EiffelVision drawable. Slyboots implementation."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "figures, primitives, drawing, line, point, ellipse"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EV_DRAWABLE_IMP

inherit

	EV_ANY_IMP
		redefine
			interface
		end

	EV_DRAWABLE_I
		redefine
			interface
		end

	EV_DRAWABLE_CONSTANTS

	DISPOSABLE
		undefine
			copy,
			default_create
		end

	PLATFORM
		undefine
			copy,
			default_create
		end

	MATH_CONST

feature {NONE} -- Implementation Attribute(s)

	sb_drawable: SB_DRAWABLE

feature {NONE} -- Initialization

	init_default_values is
			-- Set default values. Call during initialization.
		local
			l_mem: INTEGER_16
		do
			l_mem := {INTEGER_16} 3 | ({INTEGER_16} 3 |<< integer_8_bits)
--			set_dashes_pattern (gc, $l_mem)
--			line_style := {EV_GTK_EXTERNALS}.Gdk_line_solid_enum
			set_drawing_mode (drawing_mode_copy)
			set_line_width (1)
		end

feature {EV_ANY_I} -- Implementation


feature {EV_DRAWABLE_IMP} -- Implementation

	line_style: INTEGER
			-- Dash-style used when drawing lines.

	cap_style: INTEGER is
			-- Style used for drawing end of lines.
		do
--			Result := {EV_GTK_EXTERNALS}.gdk_cap_round_enum
		end

	join_style: INTEGER is
			-- Way in which lines are joined together.				
		do
--			Result := {EV_GTK_EXTERNALS}.Gdk_join_bevel_enum
		end

	gc_clip_area: EV_RECTANGLE
			-- Clip area currently used by `gc'.

	height: INTEGER is
			-- Needed by `draw_straight_line'.
		deferred
		end

	width: INTEGER is
			-- Needed by `draw_straight_line'.
		deferred
		end

feature -- Access

	font: EV_FONT is
			-- Font used for drawing text.
		do
			if internal_font_imp /= Void then
				Result := internal_font_imp.interface.twin
			else
				create Result
			end
		end

	foreground_color_internal: EV_COLOR is
			-- Color used to draw primitives.
		local
			l_red, l_green, l_blue: INTEGER
		do
			if internal_foreground_color /= Void then
				l_red := internal_foreground_color.red_8_bit
				l_green := internal_foreground_color.green_8_bit
				l_blue := internal_foreground_color.blue_8_bit
			else
					-- We default to black
			end
			create Result.make_with_8_bit_rgb (l_red, l_green, l_blue)
		end

	background_color_internal: EV_COLOR is
			-- Color used for erasing of canvas.
			-- Default: white.
		local
			l_red, l_green, l_blue: INTEGER
		do
			if internal_background_color /= Void then
				l_red := internal_background_color.red_8_bit
				l_green := internal_background_color.green_8_bit
				l_blue := internal_background_color.blue_8_bit
			else
					-- We default to white
				l_red := 255
				l_green := 255
				l_blue := 255
			end
			create Result.make_with_8_bit_rgb (l_red, l_green, l_blue)
		end

	line_width: INTEGER is
			-- Line thickness.
		do
--			gcvalues := {EV_GTK_EXTERNALS}.c_gdk_gcvalues_struct_allocate
--			{EV_GTK_EXTERNALS}.gdk_gc_get_values (gc, gcvalues)
--			Result := {EV_GTK_EXTERNALS}.gdk_gcvalues_struct_line_width (gcvalues)
--			gcvalues.memory_free
		end

	drawing_mode: INTEGER is
			-- Logical operation on pixels when drawing.
		local
			gdk_drawing_mode: INTEGER
		do
--			gcvalues := {EV_GTK_EXTERNALS}.c_gdk_gcvalues_struct_allocate
--			{EV_GTK_EXTERNALS}.gdk_gc_get_values (gc, gcvalues)
--			gdk_drawing_mode := {EV_GTK_EXTERNALS}.gdk_gcvalues_struct_function (gcvalues)
--			gcvalues.memory_free

--			if gdk_drawing_mode = {EV_GTK_EXTERNALS}.Gdk_copy_enum then
--				Result := drawing_mode_copy
--			elseif gdk_drawing_mode = {EV_GTK_EXTERNALS}.Gdk_xor_enum then
--				Result := drawing_mode_xor
--			elseif gdk_drawing_mode = {EV_GTK_EXTERNALS}.Gdk_invert_enum then
--				Result := drawing_mode_invert
--			elseif gdk_drawing_mode = {EV_GTK_EXTERNALS}.Gdk_and_enum then
--				Result := drawing_mode_and
--			elseif gdk_drawing_mode = {EV_GTK_EXTERNALS}.Gdk_or_enum then
--				Result := drawing_mode_or
--			else
--				check
--					drawing_mode_existent: False
--				end
--			end
		end

	clip_area: EV_RECTANGLE is
			-- Clip area used to clip drawing.
			-- If set to Void, no clipping is applied.
		do
--			if gc_clip_area /= Void then
--				Result := gc_clip_area.twin
--			end
		end

	tile: EV_PIXMAP
			-- Pixmap that is used to fill instead of background_color.
			-- If set to Void, `background_color' is used to fill.

	dashed_line_style: BOOLEAN is
			-- Are lines drawn dashed?
		local
			style: INTEGER
		do
--			gcvalues := {EV_GTK_EXTERNALS}.c_gdk_gcvalues_struct_allocate
--			{EV_GTK_EXTERNALS}.gdk_gc_get_values (gc, gcvalues)
--			style := {EV_GTK_EXTERNALS}.gdk_gcvalues_struct_line_style (gcvalues)
--			gcvalues.memory_free
--			Result := style = {EV_GTK_EXTERNALS}.Gdk_line_on_off_dash_enum
		end

feature -- Element change

	set_font (a_font: EV_FONT) is
			-- Set `font' to `a_font'.
		do
			if internal_font_imp /= a_font.implementation then
				internal_font_imp ?= a_font.implementation
			end
		end

	set_background_color (a_color: EV_COLOR)
			-- Assign `a_color' to `background_color'.
		local
			color_struct: POINTER
		do
			if internal_background_color = Void then
				create internal_background_color.make_with_8_bit_rgb (255, 255, 255)
			end
			if not internal_background_color.is_equal (a_color) then
				internal_background_color.set_red_with_8_bit (a_color.red_8_bit)
				internal_background_color.set_green_with_8_bit (a_color.green_8_bit)
				internal_background_color.set_blue_with_8_bit (a_color.blue_8_bit)
--				color_struct := App_implementation.reusable_color_struct
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_red (color_struct, a_color.red_16_bit)
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_green (color_struct, a_color.green_16_bit)
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_blue (color_struct, a_color.blue_16_bit)
--				{EV_GTK_EXTERNALS}.gdk_gc_set_rgb_bg_color (gc, color_struct)
			end
		end

	set_foreground_color (a_color: EV_COLOR)
			-- Assign `a_color' to `foreground_color'
		local
			color_struct: POINTER
		do
			if internal_foreground_color = Void then
				create internal_foreground_color
			end
			if not internal_foreground_color.is_equal (a_color) then
				internal_foreground_color.set_red_with_8_bit (a_color.red_8_bit)
				internal_foreground_color.set_green_with_8_bit (a_color.green_8_bit)
				internal_foreground_color.set_blue_with_8_bit (a_color.blue_8_bit)
--				color_struct := App_implementation.reusable_color_struct
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_red (color_struct, a_color.red_16_bit)
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_green (color_struct, a_color.green_16_bit)
--				{EV_GTK_EXTERNALS}.set_gdk_color_struct_blue (color_struct, a_color.blue_16_bit)
--				{EV_GTK_EXTERNALS}.gdk_gc_set_rgb_fg_color (gc, color_struct)
			end
		end

	set_line_width (a_width: INTEGER) is
			-- Assign `a_width' to `line_width'.
		do
--			{EV_GTK_EXTERNALS}.gdk_gc_set_line_attributes (gc, a_width,
--				line_style, cap_style, join_style)
		end

	set_drawing_mode (a_mode: INTEGER) is
			-- Set drawing mode to `a_mode'.
		local
--			l_gc: like gc
		do
--			l_gc := gc
--			inspect
--				a_mode
--			when drawing_mode_copy then
--				{EV_GTK_EXTERNALS}.gdk_gc_set_function (l_gc, {EV_GTK_EXTERNALS}.Gdk_copy_enum)
--			when drawing_mode_xor then
--				{EV_GTK_EXTERNALS}.gdk_gc_set_function (l_gc, {EV_GTK_EXTERNALS}.Gdk_xor_enum)
--			when drawing_mode_invert then
--				{EV_GTK_EXTERNALS}.gdk_gc_set_function (l_gc, {EV_GTK_EXTERNALS}.Gdk_invert_enum)
--			when drawing_mode_and then
--				{EV_GTK_EXTERNALS}.gdk_gc_set_function (l_gc, {EV_GTK_EXTERNALS}.Gdk_and_enum)
--			when drawing_mode_or then
--				{EV_GTK_EXTERNALS}.gdk_gc_set_function (l_gc, {EV_GTK_EXTERNALS}.Gdk_or_enum)
--			else
--				check
--					drawing_mode_existent: False
--				end
--			end
		end

	set_clip_area (an_area: EV_RECTANGLE) is
			-- Set an area to clip to.
		local
			rectangle_struct: POINTER
		do
			gc_clip_area := an_area.twin
--			rectangle_struct := {EV_GTK_EXTERNALS}.c_gdk_rectangle_struct_allocate
--			{EV_GTK_DEPENDENT_EXTERNALS}.set_gdk_rectangle_struct_x (rectangle_struct, an_area.x)
--			{EV_GTK_DEPENDENT_EXTERNALS}.set_gdk_rectangle_struct_y (rectangle_struct, an_area.y)
--			{EV_GTK_DEPENDENT_EXTERNALS}.set_gdk_rectangle_struct_width (rectangle_struct, an_area.width)
--			{EV_GTK_DEPENDENT_EXTERNALS}.set_gdk_rectangle_struct_height (rectangle_struct, an_area.height)
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_region (gc, default_pointer)
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_rectangle (gc, rectangle_struct)
--			rectangle_struct.memory_free
		end

	set_clip_region (a_region: EV_REGION) is
			-- Set a region to clip to.
		local
			a_region_imp: EV_REGION_IMP
			rectangle_struct: POINTER
		do
--			rectangle_struct := {EV_GTK_EXTERNALS}.c_gdk_rectangle_struct_allocate
--			a_region_imp ?= a_region.implementation
--			{EV_GTK_EXTERNALS}.gdk_region_get_clipbox (a_region_imp.gdk_region, rectangle_struct)
--				-- Set the gc clip area.
--			create gc_clip_area.make (
--				{EV_GTK_EXTERNALS}.gdk_rectangle_struct_x (rectangle_struct),
--				{EV_GTK_EXTERNALS}.gdk_rectangle_struct_y (rectangle_struct),
--				{EV_GTK_EXTERNALS}.gdk_rectangle_struct_width (rectangle_struct),
--				{EV_GTK_EXTERNALS}.gdk_rectangle_struct_height (rectangle_struct)
--			)
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_rectangle (gc, default_pointer)
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_region (gc, a_region_imp.gdk_region)
--			rectangle_struct.memory_free
		end

	remove_clipping is
			-- Do not apply any clipping.
		do
			gc_clip_area := Void
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_rectangle (gc, default_pointer)
--			{EV_GTK_EXTERNALS}.gdk_gc_set_clip_region (gc, default_pointer)
		end

	set_tile (a_pixmap: EV_PIXMAP) is
			-- Set tile used to fill figures.
			-- Set to Void to use `background_color' to fill.
		local
			tile_imp: EV_PIXMAP_IMP
		do
			create tile
			tile.copy (a_pixmap)
			tile_imp ?= tile.implementation
--			{EV_GTK_EXTERNALS}.gdk_gc_set_tile (gc, tile_imp.drawable)
		end

	remove_tile is
			-- Do not apply a tile when filling.
		do
			tile := Void
		end

	enable_dashed_line_style is
			-- Draw lines dashed.
		do
--			line_style := {EV_GTK_EXTERNALS}.Gdk_line_on_off_dash_enum
--			{EV_GTK_EXTERNALS}.gdk_gc_set_line_attributes (gc, line_width,
--				line_style, cap_style, join_style)
		end

	disable_dashed_line_style is
			-- Draw lines solid.
		do
--			line_style := {EV_GTK_EXTERNALS}.Gdk_line_solid_enum
--			{EV_GTK_EXTERNALS}.gdk_gc_set_line_attributes (gc, line_width,
--				line_style, cap_style, join_style)
		end

feature -- Clearing operations

	clear is
			-- Erase `Current' with `background_color'.
		do
			clear_rectangle (0, 0, width, height)
		end

	clear_rectangle (x, y, a_width, a_height: INTEGER) is
			-- Erase rectangle specified with `background_color'.
		local
			l_fg_color: EV_COLOR
		do
			if sb_drawable /= Void then
				l_fg_color := foreground_color
				set_foreground_color (background_color)

--				{EV_GTK_EXTERNALS}.gdk_draw_rectangle (drawable, gc, 1,
--					x,
--					y,
--					a_width,
--					a_height)

				set_foreground_color (l_fg_color)
				update_if_needed
			end
		end

feature -- Drawing operations

	draw_point (x, y: INTEGER) is
			-- Draw point at (`x', `y').
		do
--			if sb_drawable /= Void then
--	 			{EV_GTK_EXTERNALS}.gdk_draw_point (drawable, gc, x, y)
--	 			update_if_needed
--			end
		end

	draw_text (x, y: INTEGER; a_text: STRING_GENERAL) is
			-- Draw `a_text' with left of baseline at (`x', `y') using `font'.
		do
			draw_text_internal (x, y, a_text, True, -1, 0)
		end

	draw_rotated_text (x, y: INTEGER; angle: REAL; a_text: STRING_GENERAL) is
			-- Draw rotated text `a_text' with left of baseline at (`x', `y') using `font'.
			-- Rotation is number of radians counter-clockwise from horizontal plane.
		do
			draw_text_internal (x, y, a_text, True, -1, angle)
		end

	draw_ellipsed_text (x, y: INTEGER; a_text: STRING_GENERAL; clipping_width: INTEGER) is
			-- Draw `a_text' with left of baseline at (`x', `y') using `font'.
			-- Text is clipped to `clipping_width' in pixels and ellipses are displayed
			-- to show truncated characters if any.
		do
			draw_text_internal (x, y, a_text, True, clipping_width, 0)
		end

	draw_ellipsed_text_top_left (x, y: INTEGER; a_text: STRING_GENERAL; clipping_width: INTEGER) is
			-- Draw `a_text' with top left corner at (`x', `y') using `font'.
			-- Text is clipped to `clipping_width' in pixels and ellipses are displayed
			-- to show truncated characters if any.
		do
			draw_text_internal (x, y, a_text, False, clipping_width, 0)
		end

	draw_text_top_left (x, y: INTEGER; a_text: STRING_GENERAL) is
			-- Draw `a_text' with top left corner at (`x', `y') using `font'.
		do
			draw_text_internal (x, y, a_text, False, -1, 0)
		end

	draw_text_internal (x, y: INTEGER; a_text: STRING_GENERAL; draw_from_baseline: BOOLEAN; a_width: INTEGER; a_angle: REAL) is
			-- Draw `a_text' at (`x', `y') using `font'.
		do
--			if sb_drawable /= Void then
--				-- TODO
--			end
		end

	draw_segment (x1, y1, x2, y2: INTEGER) is
			-- Draw line segment from (`x1', 'y1') to (`x2', 'y2').
		do
--			if sb_drawable /= Void then
--				{EV_GTK_EXTERNALS}.gdk_draw_line (drawable, gc, x1, y1, x2, y2)
--				update_if_needed
--			end
		end

	draw_arc (x, y, a_width, a_height: INTEGER; a_start_angle, an_aperture: REAL) is
			-- Draw a part of an ellipse bounded by top left (`x', `y') with
			-- size `a_width' and `a_height'.
			-- Start at `a_start_angle' and stop at `a_start_angle' + `an_aperture'.
			-- Angles are measured in radians.
		local
			a_radians: INTEGER
		do
--			if sb_drawable /= Void then
--				a_radians := radians_to_gdk_angle
--				{EV_GTK_EXTERNALS}.gdk_draw_arc (
--					drawable,
--					gc,
--					0,
--					x,
--					y,
--					a_width,
--					a_height,
--					(a_start_angle * a_radians + 0.5).truncated_to_integer,
--					(an_aperture * a_radians + 0.5).truncated_to_integer
--				)
--				update_if_needed
--			end
		end

	draw_pixmap (x, y: INTEGER; a_pixmap: EV_PIXMAP) is
			-- Draw `a_pixmap' with upper-left corner on (`x', `y').
		do
			draw_full_pixmap (x, y, a_pixmap, 0, 0, a_pixmap.width, a_pixmap.height)
		end

	draw_full_pixmap (x, y: INTEGER; a_pixmap: EV_PIXMAP; x_src, y_src, src_width, src_height: INTEGER) is
		local
			pixmap_imp: EV_PIXMAP_IMP
--			l_src_rect, l_dest_rect, l_src_intersection_rect, l_dest_intersection_rect: EV_RECTANGLE
--			l_adjusted_x, l_adjusted_y: INTEGER
--			l_adjusted_x_src, l_adjusted_y_src, l_adjusted_src_width, l_adjusted_src_height: INTEGER
		do
--			if sb_drawable /= Void then

--					-- Find adjusted values for source rectangle.
--				create l_dest_rect.make (0, 0, a_pixmap.width, a_pixmap.height)
--				create l_src_rect.make (x_src, y_src, src_width, src_height)
--				l_src_intersection_rect := l_src_rect.intersection (l_dest_rect)
--				l_adjusted_x_src := l_src_intersection_rect.x
--				l_adjusted_y_src := l_src_intersection_rect.y
--				l_adjusted_src_width := l_src_intersection_rect.width
--				l_adjusted_src_height := l_src_intersection_rect.height
--				l_adjusted_x := x - x_src.min (0)
--				l_adjusted_y := y - y_src.min (0)

--				if l_adjusted_src_width > 0 and then l_adjusted_src_height > 0 then
--						-- Optimize destination rectangle.
--					l_dest_rect.move_and_resize (0, 0, width, height)
--					l_src_rect.move_and_resize (
--						l_adjusted_x,
--						l_adjusted_y,
--						l_adjusted_src_width,
--						l_adjusted_src_height
--					)
--					l_dest_intersection_rect := l_src_rect.intersection (l_dest_rect)

--					l_adjusted_x := l_dest_intersection_rect.x
--					l_adjusted_y := l_dest_intersection_rect.y
--						-- If destination origin is negative then adjust the source origin to take this in to account.
--					if l_adjusted_x < 0 then
--						l_adjusted_x_src := l_adjusted_x_src - l_adjusted_x
--					end
--					if l_adjusted_y_src < 0 then
--						l_adjusted_y_src := l_adjusted_y_src - l_adjusted_y
--					end
--					l_adjusted_src_width := l_dest_intersection_rect.width
--					l_adjusted_src_height := l_dest_intersection_rect.height

--					if l_dest_intersection_rect.width > 0 and then l_dest_intersection_rect.height > 0 then
--						pixmap_imp ?= a_pixmap.implementation
--						if pixmap_imp.mask /= default_pointer then
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_mask (gc, pixmap_imp.mask)
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_origin (gc, l_adjusted_x - l_adjusted_x_src, l_adjusted_y - l_adjusted_y_src)
--						end
--						{EV_GTK_DEPENDENT_EXTERNALS}.gdk_draw_drawable (
--							drawable,
--							gc,
--							pixmap_imp.drawable,
--							l_adjusted_x_src,
--							l_adjusted_y_src,
--							l_adjusted_x,
--							l_adjusted_y,
--							l_adjusted_src_width,
--							l_adjusted_src_height
--						)

--						if pixmap_imp.mask /= default_pointer then
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_mask (gc, pixmap_imp.mask)
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_origin (gc, x - x_src, y - y_src)
--						end
--						{EV_GTK_DEPENDENT_EXTERNALS}.gdk_draw_drawable (
--							drawable,
--							gc,
--							pixmap_imp.drawable,
--							x_src,
--							y_src,
--							x,
--							y,
--							src_width,
--							src_height
--						)
--						update_if_needed
--						if pixmap_imp.mask /= default_pointer then
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_mask (gc, default_pointer)
--							{EV_GTK_EXTERNALS}.gdk_gc_set_clip_origin (gc, 0, 0)
--						end
--					end
--				end
--			end
		end

	sub_pixmap (area: EV_RECTANGLE): EV_PIXMAP is
			-- Pixmap region of `Current' represented by rectangle `area'
		local
			pix_imp: EV_PIXMAP_IMP
			a_pix: POINTER
		do
--			create Result
--			pix_imp ?= Result.implementation
--			a_pix := pixbuf_from_drawable_at_position (area.x, area.y, 0, 0, area.width, area.height)
--			pix_imp.set_pixmap_from_pixbuf (a_pix)
--			{EV_GTK_EXTERNALS}.object_unref (a_pix)
		end

	draw_sub_pixmap (x, y: INTEGER; a_pixmap: EV_PIXMAP; area: EV_RECTANGLE) is
			-- Draw `area' of `a_pixmap' with upper-left corner on (`x', `y').
		do
			draw_full_pixmap (x, y, a_pixmap, area.x, area.y, area.width, area.height)
		end

	draw_sub_pixel_buffer (a_x, a_y: INTEGER; a_pixel_buffer: EV_PIXEL_BUFFER; area: EV_RECTANGLE)
			-- Draw `area' of `a_pixel_buffer' with upper-left corner on (`a_x', `a_y').
		do
			-- TODO
		end

	draw_rectangle (x, y, a_width, a_height: INTEGER) is
			-- Draw rectangle with upper-left corner on (`x', `y')
			-- with size `a_width' and `a_height'.
		do
--			if sb_drawable /= Void then
--				if a_width > 0 and then a_height > 0 then
--						-- If width or height are zero then nothing will be rendered.
--					{EV_GTK_EXTERNALS}.gdk_draw_rectangle (drawable, gc, 0, x, y, a_width - 1, a_height - 1)
--					update_if_needed
--				end
--			end
		end

	draw_ellipse (x, y, a_width, a_height: INTEGER) is
			-- Draw an ellipse bounded by top left (`x', `y') with
			-- size `a_width' and `a_height'.
		do
--			if sb_drawable /= Void then
--				if (a_width > 0 and a_height > 0 ) then
--					{EV_GTK_EXTERNALS}.gdk_draw_arc (drawable, gc, 0, x,
--						y, (a_width - 1),
--						(a_height - 1), 0, whole_circle)
--					update_if_needed
--				end
--			end
		end

	draw_polyline (points: ARRAY [EV_COORDINATE]; is_closed: BOOLEAN) is
			-- Draw line segments between subsequent points in
			-- `points'. If `is_closed' draw line segment between first
			-- and last point in `points'.
		local
			tmp: SPECIAL [INTEGER]
		do
--			if sb_drawable /= Void then
--				tmp := coord_array_to_gdkpoint_array (points).area
--				if is_closed then
--					{EV_GTK_EXTERNALS}.gdk_draw_polygon (drawable, gc, 0, $tmp, points.count)
--					update_if_needed
--				else
--					{EV_GTK_EXTERNALS}.gdk_draw_lines (drawable, gc, $tmp, points.count)
--					update_if_needed
--				end
--			end
		end

	draw_pie_slice (x, y, a_width, a_height: INTEGER; a_start_angle, an_aperture: REAL) is
			-- Draw a part of an ellipse bounded by top left (`x', `y') with
			-- size `a_width' and `a_height'.
			-- Start at `a_start_angle' and stop at `a_start_angle' + `an_aperture'.
			-- The arc is then closed by two segments through (`x', `y').
			-- Angles are measured in radians
		local
			left, top, right, bottom: INTEGER
			x_start_arc, y_start_arc, x_end_arc, y_end_arc: INTEGER
			semi_width, semi_height: DOUBLE
			tang_start, tang_end: DOUBLE
			x_tmp, y_tmp: DOUBLE
		do
			left := x
			top := y
			right := left + a_width
			bottom := top + a_height

			semi_width := a_width / 2
			semi_height := a_height / 2
			tang_start := tangent (a_start_angle)
			tang_end := tangent (a_start_angle + an_aperture)

			x_tmp := semi_height / (sqrt (tang_start^2 + semi_height^2 / semi_width^2))
			y_tmp := semi_height / (sqrt (1 + semi_height^2 / (semi_width^2 * tang_start^2)))
			if sine (a_start_angle) > 0 then
				y_tmp := - y_tmp
			end
			if cosine (a_start_angle) < 0 then
				x_tmp := - x_tmp
			end
			x_start_arc := (x_tmp + left + semi_width).rounded
			y_start_arc := (y_tmp + top + semi_height).rounded

			x_tmp := semi_height / (sqrt (tang_end^2 + semi_height^2 / semi_width^2))
			y_tmp := semi_height / (sqrt (1 + semi_height^2 / (semi_width^2 * tang_end^2)))
			if sine (a_start_angle + an_aperture) > 0 then
				y_tmp := - y_tmp
			end
			if cosine (a_start_angle + an_aperture) < 0 then
				x_tmp := - x_tmp
			end
			x_end_arc := (x_tmp + left + semi_width).rounded
			y_end_arc := (y_tmp + top + semi_height).rounded

			draw_arc (x, y, a_width, a_height, a_start_angle, an_aperture)
			draw_segment (x + (a_width // 2), y + (a_height // 2), x_start_arc, y_start_arc)
			draw_segment (x + (a_width // 2), y + (a_height // 2), x_end_arc, y_end_arc)
			update_if_needed
		end

feature -- filling operations

	fill_rectangle (x, y, a_width, a_height: INTEGER) is
			-- Draw rectangle with upper-left corner on (`x', `y')
			-- with size `a_width' and `a_height'. Fill with `background_color'.
		do
--			if sb_drawable /= Void then
--				if tile /= Void then
--					{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_tiled_enum)
--				end
--				{EV_GTK_EXTERNALS}.gdk_draw_rectangle (drawable, gc, 1, x, y, a_width, a_height)
--				{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_solid_enum)
--				update_if_needed
--			end
		end

	fill_ellipse (x, y, a_width, a_height: INTEGER) is
			-- Draw an ellipse bounded by top left (`x', `y') with
			-- size `a_width' and `a_height'.
			-- Fill with `background_color'.
		do
--			if sb_drawable /= Void then
--				if tile /= Void then
--					{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_tiled_enum)
--				end
--				{EV_GTK_EXTERNALS}.gdk_draw_arc (drawable, gc, 1, x,
--					y, a_width,
--					a_height, 0, whole_circle)
--				update_if_needed
--				{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_solid_enum)
--			end
		end

	fill_polygon (points: ARRAY [EV_COORDINATE]) is
			-- Draw line segments between subsequent points in `points'.
			-- Fill all enclosed area's with `background_color'.
		local
			tmp: SPECIAL [INTEGER]
		do
--			if sb_drawable /= Void then
--				tmp := coord_array_to_gdkpoint_array (points).area
--				if tile /= Void then
--					{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_tiled_enum)
--				end
--				{EV_GTK_EXTERNALS}.gdk_draw_polygon (drawable, gc, 1, $tmp, points.count)
--				{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_solid_enum)
--				update_if_needed
--			end
		end

	fill_pie_slice (x, y, a_width, a_height: INTEGER; a_start_angle, an_aperture: REAL) is
			-- Draw a part of an ellipse bounded by top left (`x', `y') with
			-- size `a_width' and `a_height'.
			-- Start at `a_start_angle' and stop at `a_start_angle' + `an_aperture'.
			-- The arc is then closed by two segments through (`x', `y').
			-- Angles are measured in radians.
		do
--			if sb_drawable /= Void then
--				if tile /= Void then
--					{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_tiled_enum)
--				end
--				{EV_GTK_EXTERNALS}.gdk_draw_arc (
--					drawable,
--					gc,
--					1,
--					x,
--					y,
--					a_width,
--					a_height,
--					(a_start_angle * radians_to_gdk_angle).truncated_to_integer ,
--					(an_aperture * radians_to_gdk_angle).truncated_to_integer
--				)
--				{EV_GTK_EXTERNALS}.gdk_gc_set_fill (gc, {EV_GTK_EXTERNALS}.Gdk_solid_enum)
--				update_if_needed
--			end
		end

feature {NONE} -- Implementation

--	app_implementation: EV_APPLICATION_IMP is
--			-- Return the instance of EV_APPLICATION_IMP.
--		deferred
--		end

	internal_foreground_color: EV_COLOR
			-- Color used to draw primitives.

	internal_background_color: EV_COLOR
			-- Color used for erasing of canvas.
			-- Default: white.

	flush is
			-- Force all queued expose events to be called.
		deferred
		end

	update_if_needed is
			-- Force update of `Current' if needed
		deferred
		end

	whole_circle: INTEGER is 23040
		-- Number of 1/64 th degrees in a full circle (360 * 64)

	radians_to_gdk_angle: INTEGER is 3667 --
			-- Multiply radian by this to get no of (1/64) degree segments.

	internal_font_imp: EV_FONT_IMP

	interface: EV_DRAWABLE

invariant
	gc_not_void: is_usable implies gc /= default_pointer

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




end -- class EV_DRAWABLE_IMP
