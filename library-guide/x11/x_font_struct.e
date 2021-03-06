indexing
	todo: "[
		Fix text_extents / X_CHAR_STRUCT
	]"

class X_FONT_STRUCT
  -- Interface to XFontStruct
  --
  --| Stephane Hillion
  --| 1998/01/28

inherit 

	X_STRUCT

creation { X_FONT }

	from_x_struct,
	from_external	-- FIXGC

feature -- Destruction

	free is
			-- Frees the memory allocated by the Xlib.
		do
--			x_free_font_info (to_external, .....)
		end

feature -- Consultation

  	fid: INTEGER is
    	do
      		result := c_font_struct_fid (to_external)
    	end

  	text_width (str: STRING): INTEGER is
      		-- the width in pixels of the specified character string
    	require
      		str /= Void
    	do
      		result := c_text_width (to_external, str.area.item_address (0), str.count)
    	end

    text_width_n (s: STRING; offset, count: INTEGER): INTEGER is
    		-- width in pixels of part string
    	require
    		non_void_string: s /= Void
    		valid_offset: offset >= 0 and then offset < s.count
    		valid_count: (offset + count) <= s.count
    	do
    	
--	print (once "X_FONT_STRUCT:text_width_n%N  offset = ")
--	print (offset.out)
--	print (once "  s.count = ")
--	print (s.count.out)
--	print (once "%N")
    		Result := c_text_width (to_external, s.area.item_address (offset), count)
    	end

	ascent: INTEGER is
		do
			Result := c_font_struct_ascent (to_external)
		end

	descent: INTEGER is
		do
			Result := c_font_struct_descent (to_external)
		end

feature {NONE}

	size: INTEGER is
    	once
      		result := c_font_struct_size
    	end

feature {NONE} -- External functions

--	x_free_font_info (p1, p2: POINTER; i: INTEGER) is
--		external
--			"C use <X11/Xlib.h>"
--		alias
--			"XFreeFontInfo"
--    	end
	
	c_font_struct_fid				(p : POINTER) : INTEGER is external "C struct XFontStruct access fid				use <X11/Xlib.h>" end
	c_font_struct_direction			(p : POINTER) : INTEGER is external "C struct XFontStruct access direction			use <X11/Xlib.h>" end
	c_font_struct_min_char_or_byte2	(p : POINTER) : INTEGER is external "C struct XFontStruct access min_char_or_byte2	use <X11/Xlib.h>" end
	c_font_struct_max_char_or_byte2	(p : POINTER) : INTEGER is external "C struct XFontStruct access max_char_or_byte2	use <X11/Xlib.h>" end
	c_font_struct_min_byte1			(p : POINTER) : INTEGER is external "C struct XFontStruct access min_byte1			use <X11/Xlib.h>" end
	c_font_struct_max_byte1			(p : POINTER) : INTEGER is external "C struct XFontStruct access max_byte1			use <X11/Xlib.h>" end
	c_font_struct_all_chars_exist	(p : POINTER) : INTEGER is external "C struct XFontStruct access all_chars_exist	use <X11/Xlib.h>" end
	c_font_struct_default_char		(p : POINTER) : INTEGER is external "C struct XFontStruct access default_char		use <X11/Xlib.h>" end
	c_font_struct_n_properties		(p : POINTER) : INTEGER is external "C struct XFontStruct access n_properties		use <X11/Xlib.h>" end
	c_font_struct_properties		(p : POINTER) : POINTER is external "C struct XFontStruct access properties			use <X11/Xlib.h>" end
--	c_font_struct_min_bounds		(p : POINTER) : INTEGER is external "C struct XFontStruct access min_bounds			use <X11/Xlib.h>" end
--	c_font_struct_max_bounds		(p : POINTER) : INTEGER is external "C struct XFontStruct access max_bounds			use <X11/Xlib.h>" end
	c_font_struct_per_char			(p : POINTER) : POINTER is external "C struct XFontStruct access per_char			use <X11/Xlib.h>" end
	c_font_struct_ascent			(p : POINTER) : INTEGER is external "C struct XFontStruct access ascent				use <X11/Xlib.h>" end
	c_font_struct_descent			(p : POINTER) : INTEGER is external "C struct XFontStruct access descent			use <X11/Xlib.h>" end
	

	c_font_struct_size: INTEGER is
    	external "C inline use <X11/Xlib.h>"
    	alias "sizeof(XFontStruct)"
    	end

	c_text_width (fs, str : POINTER; sz : INTEGER) : INTEGER is
    	external
    		"C use <X11/Xlib.h>"
    		alias "XTextWidth"
    	end

	c_text_extents (fs, str: POINTER; i: INTEGER; d1, d2, bc, cs: POINTER) is
    	external
    		"C use <X11/Xlib.h>"
    		alias "XTextExtents"
    	end

end 
