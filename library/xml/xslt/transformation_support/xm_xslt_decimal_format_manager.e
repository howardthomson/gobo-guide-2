indexing

	description:

		"Objects that manage xsl:decimal-formats"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT_MANAGER

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create format_map.make_map (5)
			using_original_default := True
		end

feature -- Access
	
	default_decimal_format: XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Default decimal format
		do
			if default_format /= Void then
				Result := default_format
			else
				Result := all_defaults
			end
		ensure
			default_decimal_format_not_void: Result /= Void
		end

	named_format (a_fingerprint: INTEGER): XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Decimal-format named by `a_fingerprint'
		require
			positive_fingerprint: a_fingerprint > -1
			has_named_format: has_named_format (a_fingerprint)
		do
			Result := format_map.item (a_fingerprint).decimal_format
		ensure
			named_format_not_void: Result /= Void
		end

feature -- Status report

	has_named_format (a_fingerprint: INTEGER): BOOLEAN is
		-- Does `Current' have a decimal format named by `a_fingerprint'?
		require
			nearly_positive_fingerprint: a_fingerprint > -2
		do
			if has (a_fingerprint) then
				Result := format_map.item (a_fingerprint).is_decimal_format
			end
		end
			
	has (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `Current' have an entry for `a_fingerprint'?
		require
			nearly_positive_fingerprint: a_fingerprint > -2
		do
			Result := format_map.has (a_fingerprint)
		end

	is_default_format_set: BOOLEAN is
			-- Has the default decimal format been declared yet?
		do
			Result := default_format /= Void
		end

	is_different_from_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN is
			-- Does `a_default_format' differ from `default_decimal_format' by any value?
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
		do
			if default_format = Void then
				Result := True
			else
				Result := a_default_format.is_different_from (default_format)
			end
		end

	is_duplicate_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY): BOOLEAN is
			-- Does `a_format' differ from all other formats by any value?
		require
			is_not_a_default_format: a_format /= Void and then a_format.fingerprint > - 1 and then has (a_format.fingerprint)
		do
			Result := not a_format.is_different_from (named_format (a_format.fingerprint))
		end

feature -- Element change

	set_default_format (a_default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Set the default decimal_format
		require
			is_a_default_format: a_default_format /= Void and then a_default_format.fingerprint = -1
			default_format_not_set: not is_default_format_set
		do
			default_format := a_default_format
			using_original_default := False
			set_named_format (default_format) -- to trigger fixup
		ensure
			default_format_set: default_format = a_default_format
		end

	set_named_format (a_format: XM_XSLT_DECIMAL_FORMAT_ENTRY) is
			-- Add a named decimal format.
		require
			format_not_void: a_format /= Void
			not_a_duplicate: not has_named_format (a_format.fingerprint)
		local
			an_entry: XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY
			a_list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER]
			an_old_entry: XM_XSLT_DECIMAL_FORMAT_ENTRY
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_FORMAT_NUMBER]
		do
			if has (a_format.fingerprint) then
				an_entry := format_map.item (a_format.fingerprint)
				check
					entry_is_list: an_entry.is_list 
					-- From pre-condition
				end
				from
					a_list := an_entry.list; a_cursor := a_list.new_cursor; a_cursor.start
				variant
					a_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_cursor.item.fixup (a_format)
					a_cursor.forth
				end
				format_map.remove (a_format.fingerprint)
			end
			create an_entry.make (a_format)
			format_map.put (an_entry, a_format.fingerprint)
		ensure
			named_format_added: has_named_format (a_format.fingerprint)
		end

	fixup_default_default is
			-- Call at the end of stylesheet compilation to fix up any format-number() calls
			--  to the "default default" decimal format.
		do
			if using_original_default then
				set_named_format (default_decimal_format)
			end
		end

	register_usage (a_fingerprint: INTEGER; a_callback: XM_XSLT_FORMAT_NUMBER) is
			-- Register a format-number() function call that uses a particular decimal format.
			-- This allows early compile time resolution where possible,
			--  even in the case of a forwards reference
		require
			nearly_positive_fingerprint: a_fingerprint > -2
			call_not_void: a_callback /= Void
		local
			a_list: DS_ARRAYED_LIST [XM_XSLT_FORMAT_NUMBER]
			an_entry: XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY
		do
			if format_map.has (a_fingerprint) then
				an_entry := format_map.item (a_fingerprint)
				if an_entry.is_list then

					-- it's another forward reference

					a_list.force_last (a_callback)
				else

					-- it's a backwards reference

					a_callback.fixup (an_entry.decimal_format)
				end
			else

				-- it's a forward reference

				create a_list.make_default
				a_list.put_last (a_callback)
				create an_entry.make_list (a_list)
				format_map.put (an_entry, a_fingerprint)
			end
		end

feature {NONE} -- Implementation

	using_original_default: BOOLEAN
			-- Are we using the original (default) default?

	format_map: DS_HASH_TABLE [XM_XSLT_DECIMAL_FORMAT_MANAGER_ENTRY, INTEGER]
			-- Map of fingerprints to decimal-formats

	default_format: XM_XSLT_DECIMAL_FORMAT_ENTRY
			-- Default format

	all_defaults: XM_XSLT_DECIMAL_FORMAT_ENTRY is
			-- Default default format
		once
			create Result.make (-1)
		ensure
			default_default_decimal_format_not_void: Result /= Void			
		end

invariant

	format_map_not_void: format_map /= Void

end
	
