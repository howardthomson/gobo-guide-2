indexing

	description: 

		"XML parser skeletons using a native Eiffel parser"

	implements: "XML 1.0 (Second Edition) - W3C Recommendation 6 October 2000"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_EIFFEL_PARSER_SKELETON

inherit

	XM_NON_INCREMENTAL_PARSER

	XM_FORWARD_CALLBACKS
		redefine
			on_error
		end

	XM_FORWARD_DTD_CALLBACKS

	YY_NEW_PARSER_SKELETON
		rename
			make as make_parser
		redefine
			report_error
		end

	XM_EIFFEL_TOKENS
		export {NONE} all end

	XM_EIFFEL_PARSER_ERRORS
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES
		export {NONE} all end

	XM_EIFFEL_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end
		
feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			make_scanner
			make_parser
				-- Parser state:
			in_external_dtd := False
				-- Callbacks forwarding
			create {XM_CALLBACKS_NULL} callbacks.make
				-- Entities:
			entities := new_entities_table
			pe_entities := new_entities_table
				-- Resolvers
			dtd_resolver := null_resolver
			entity_resolver := null_resolver
			use_namespaces := True
		end

	null_resolver: XM_NULL_EXTERNAL_RESOLVER is
			-- Null resolver.
		once
			create Result
		end
		
feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			from
			until
				scanners.is_empty
			loop
				scanner := scanners.item
				scanners.remove
			end
			scanner.reset
			in_external_dtd := False
			entities.wipe_out
			pe_entities.wipe_out
		end

feature -- Parsing

	parse_from_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML document from input stream.
		do
			reset
			scanner.set_input_stream (a_stream)
			on_start
			parse
			on_finish
		end

	parse_from_string (a_string: STRING) is
			-- Parse XML document from `a_string'.
		local
			a_stream: KL_STRING_INPUT_STREAM
		do
			create a_stream.make (utf8.to_utf8 (a_string))
			parse_from_stream (a_stream)
		end

feature -- Obsolete

	parse_stream (a_stream: KI_CHARACTER_INPUT_STREAM) is
			-- Parse XML Document from input stream.
		obsolete
			"[020815] Use `parse_from_stream' instead."
		require
			a_stream_not_void: a_stream /= Void
			is_open_read: a_stream.is_open_read
		do
			parse_from_stream (a_stream)
		end

feature -- Namespace mode

	disable_namespaces is
			-- Disable namespace parsing and allow strict 
			-- XML 1.0 names (eg ":" or ":a:b:c:"). 
			-- Namespace field in events is always Void. 
			
		do
			use_namespaces := False
		end
		
	use_namespaces: BOOLEAN
			-- Are namespaces parsed?
			
feature {NONE} -- Namespaces

	namespace_force_last (a_name: XM_EIFFEL_PARSER_NAME; a_string: STRING) is
			-- Force last namespace name component, or error.
		require
			a_name_not_void: a_name /= Void
			a_string_not_void: a_string /= Void
		do
			if a_name.can_force_last (a_string) then
				a_name.force_last (a_string)
			else
				force_error (Error_namespaces_name_misformed)
			end
		end
		
feature -- Error reporting

	is_correct: BOOLEAN is
			-- Has no error been detected?
		do
			Result := not syntax_error
		end

	last_error: INTEGER is
			-- Code of last error
			-- (See XM_ERROR_CODES.)
		do
			if is_correct then
				Result := Xml_err_unknown
			else
				Result := Xml_err_none
			end
		end

	last_error_description: STRING
			-- Textual description of last error

feature -- Error diagnostic

	line: INTEGER is
			-- Current line
		do
			Result := scanner.line
		end

	column: INTEGER is
			-- Current column
		do
			Result := scanner.column
		end

	byte_position: INTEGER is
			-- Current byte index
		do
			Result := scanner.position
		end

	position: XM_POSITION is
			-- Current position in the source of the XML document
		do
			create {XM_DEFAULT_POSITION} Result.make (source, byte_position, column, line)
		end

	filename: STRING is
			-- Current file
		do
			Result := scanner.filename
		ensure
			filename_not_void: Result /= Void
		end

	source: XM_SOURCE is
			-- Source of the XML document beeing parsed
		do
			Result := scanner.source
		end

	error_header: STRING is
			-- Header for error message
			-- (<filename>:<line>:<column>:)
		do
			Result := clone (filename)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, line.out)
			Result.append_character (':')
			Result := STRING_.appended_string (Result, column.out)
			Result.append_character (':')
		ensure
			error_header_not_void: Result /= Void
		end

feature {NONE} -- Error reporting

	on_error (an_error: STRING) is
			-- On error.
		do
			last_error_description := an_error
			Precursor (an_error)
		end

	report_error (an_error: STRING) is
			-- On error.
		do
			on_error (an_error)
		end

	force_error (a_message: STRING) is
			-- Report error message.
		do
			on_error (a_message)
			abort
		end

feature {NONE} -- State

	entities: DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING]
			-- Defined entites

	pe_entities: DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING]
			-- Defined PE entities

	in_external_dtd: BOOLEAN
			-- Is the scanner in an external DTD?

feature {NONE} -- Factory

	new_namespace_name: XM_EIFFEL_PARSER_NAME is
			-- New namespace name
		do
			if use_namespaces then
				create Result.make_namespaces
			else
				create Result.make_no_namespaces
			end
		ensure
			namespace_name_not_void: Result /= Void
			namespace_name_empty: Result.is_empty
		end

	new_name_set: DS_HASH_SET [XM_EIFFEL_PARSER_NAME] is
			-- New name set for checking
		do
			create Result.make_equal (10)
		ensure
			name_set_not_void: Result /= Void
		end

	new_dtd_attribute_content: XM_DTD_ATTRIBUTE_CONTENT is
			-- New dtd attribute content
		do
			create Result.make
		ensure
			content_not_void: Result /= Void
		end

	new_dtd_attribute_content_list: DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] is
			-- New dtd attribute content list
		do
			create Result.make
		ensure
			content_list_not_void: Result /= Void
		end

	new_dtd_external_id: XM_DTD_EXTERNAL_ID is
			-- New dtd external id
		do
			create Result.make
		ensure
			external_id: Result /= Void
		end

feature {NONE} -- Encoding

	apply_encoding (an_encoding: STRING) is
			-- Set encoding on current scanner.
		require
			not_void: an_encoding /= Void
		do
			if scanner.is_valid_encoding (an_encoding) then
				scanner.set_encoding (an_encoding)
			else
				force_error (Error_unsupported_encoding)
			end
		end
		
feature {NONE} -- DTD

	set_element_repetition (a_node: XM_DTD_ELEMENT_CONTENT; a_value: STRING) is
			-- Set repetition status of a node.
		require
			a_node_not_void: a_node /= Void
		do
			a_node.set_one
			if a_value = One_or_more_repetition then
				a_node.set_one_or_more
			elseif a_value = Zero_or_one_repetition then
				a_node.set_zero_or_one
			elseif a_value = Zero_or_more_repetition then
				a_node.set_zero_or_more
			end
		end

	One_or_more_repetition: STRING is "+"
	Zero_or_one_repetition: STRING is "?"
	Zero_or_more_repetition: STRING is "*"

	element_name (a_name: STRING): XM_DTD_ELEMENT_CONTENT is
			-- New element content name node
		require
			a_name_not_void: a_name /= Void
		do
			create Result.make_name (a_name)
		ensure
			element_name_not_void: Result /= Void
		end

	on_attribute_declarations (ele_name: STRING; some_attributes: DS_LINEAR [XM_DTD_ATTRIBUTE_CONTENT]) is
			-- Send all element declarations.
		require
			ele_not_void: ele_name /= Void
			some_attributes_not_void: some_attributes /= Void
			no_void_attributes: not some_attributes.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_DTD_ATTRIBUTE_CONTENT]
		do
			a_cursor := some_attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
					-- TODO: missing part
				on_attribute_declaration (ele_name, a_cursor.item.name, a_cursor.item)
				a_cursor.forth
			end
		end

feature {NONE} -- Entities

	new_literal_entity (a_value: STRING): XM_EIFFEL_ENTITY_DEF is
			-- New literal entity definition
		require
			a_value_not_void: a_value /= Void
		do
			create Result.make_literal (a_value)
		ensure
			entity_not_void: Result /= Void
		end

	new_external_entity (a_value: XM_DTD_EXTERNAL_ID): XM_EIFFEL_ENTITY_DEF is
			-- New external entity definition
		require
			a_value_not_void: a_value /= Void
		do
			create Result.make_external (entity_resolver, a_value.system_id)
		ensure
			entity_not_void: Result /= Void
		end

feature {NONE} -- Entities

	when_entity_declared (a_name: STRING; a_def: XM_EIFFEL_ENTITY_DEF) is
			-- Entity has been declared.
		require
			a_name_not_void: a_name /= Void
		do
			debug ("xml_parser")
				std.error.put_string ("Entity declared: ")
				std.error.put_string (a_name)
				std.error.put_string (" value: ")
				std.error.put_string (a_def.value)
				std.error.put_new_line
			end
				-- 4.2: when multiple declaration first one is binding.
			if a_def /= Void then
				if not entities.has (a_name) then
					entities.force (a_def, a_name)
				end
				check has: entities.has (a_name) end
			end
		end

	when_pe_entity_declared (a_name: STRING; in_def: XM_EIFFEL_ENTITY_DEF) is
			-- PE entity has been declared.
		require
			a_name_not_void: a_name /= Void
		local
			a_def: XM_EIFFEL_PE_ENTITY_DEF
		do
			debug ("xml_parser")
				std.error.put_string ("PE entity declared: ")
				std.error.put_string (a_name)
				std.error.put_string (" value: ")
				std.error.put_string (in_def.value)
				std.error.put_new_line
			end
				-- 4.2: when multiple declaration take first one.
			if in_def /= Void then
					-- Convert to PE.
				create a_def.make_def (in_def)
				if not pe_entities.has (a_name) then
					pe_entities.force (a_def, a_name)
				end
				check has: pe_entities.has (a_name) end
			end
		end

	entity_referenced_in_entity_value (a_name: STRING): STRING is
			-- Named parameter entity has been referenced in entity value
		require
			a_name_not_void: a_name /= Void
		do
			if in_external_dtd then
				if pe_entities.has (a_name) then
					Result := defined_entity_referenced (pe_entities.item (a_name))
				else
						-- 4.4.4 Forbidden.
					force_error (Error_external_reference_in_quoted_value)
				end
			else
				force_error (Error_doctype_peref_only_in_dtd)
			end
		end

	defined_entity_referenced (a_def: XM_EIFFEL_ENTITY_DEF): STRING is
			-- Resolved defined entity in quoted value
		require
			a_def_not_void: a_def /= Void
		do
			if a_def.is_literal then
					-- 4.4.5 Included in literal.
				Result := a_def.value
			else
				Result := external_entity_to_string (a_def.value)
			end
		end

	external_entity_to_string (a_sys: STRING): STRING is
			-- External entity to string
		require
			a_sys_not_void: a_sys /= Void
		local
			a_stream: XM_EIFFEL_INPUT_STREAM
			i: INTEGER
		do
			entity_resolver.resolve (a_sys)
			if not entity_resolver.has_error then
				create a_stream.make_from_stream (entity_resolver.last_stream)
				a_stream.read_string (INTEGER_.Platform.Maximum_integer)
				Result := a_stream.last_string
				if entity_resolver.last_stream.is_closable then
					entity_resolver.last_stream.close
				end
				
				-- newline normalization XML1.0:2.11
				-- TODO: should be done in scanner?
				from
					i := 1
				until
					i >= Result.count
				loop
					if Result.item (i) = '%R' and Result.item (i+1) = '%N' then
						Result.remove (i)
					end
					i := i + 1
				end
				from
					i := 1
				until
					i > Result.count
				loop
					if Result.item (i) = '%R' then
						Result.put ('%N', i)
					end
					i := i + 1
				end
			else
				force_error (entity_resolver.last_error)
			end
		end

feature {NONE} -- DTD

	when_external_dtd (a_system: XM_DTD_EXTERNAL_ID) is
			-- Load external DTD from system name.
		require
			a_system_not_void: a_system /= Void
			has_system: a_system.system_id /= Void
		do
			debug ("xml_parser")
				std.error.put_string ("[when_external_dtd]")
			end
				
			dtd_resolver.resolve (a_system.system_id)
			if not dtd_resolver.has_error then
				-- Push old scanner.
				scanners.force (scanner)
				create {XM_EIFFEL_SCANNER_DTD} scanner.make_scanner
				scanner.set_input_stream (dtd_resolver.last_stream)
			else
				if dtd_resolver = null_resolver then
					force_error (Error_doctype_external_no_resolver)
				else
					force_error (dtd_resolver.last_error)
				end
			end
		end

feature {NONE} -- Scanner implementation

	make_scanner is
			-- Initialize main scanner and saved
			-- scannners stack.
		do
			create scanner.make_scanner
			create scanners.make
		end

	scanner: XM_EIFFEL_SCANNER
			-- Scanner for PE entity

	scanners: DS_LINKED_STACK [XM_EIFFEL_SCANNER]
			-- Scanner stack for entities etc.

	last_token: INTEGER
			-- Last token read by `read_token'

	read_token is
			-- Read token from scanner.
		local
			last_text: STRING
		do
				-- Read token from scanner.
			scanner.read_token
			last_token := scanner.last_token
			last_string_value := scanner.last_value
			debug ("xml_parser")
				
				std.error.put_string (token_name (last_token))
				std.error.put_string ("/")
				if last_string_value /= Void then
					std.error.put_string (last_string_value.out)
					std.error.put_string ("/")
				end
				std.error.put_string (scanner.text_count.out)
				std.error.put_new_line
			end
				-- Unwind scanner stack if end of current one.
			if scanner.end_of_file and not scanners.is_empty then
				scanner.close_input
				scanner := scanners.item
				scanners.remove
				read_token
			end
				-- If this is a PE entity reference, temporarily
				-- switch scanner. Token is left for validation.
			last_text := last_string_value
			--check for_all tokens_below: last_value is STRING end
			
			if last_token = DOCTYPE_PEREFERENCE then
				process_pe_entity (onstring_ascii (last_text))
			elseif last_token = DOCTYPE_PEREFERENCE_UTF8 then
				process_pe_entity (onstring_utf8 (last_text))

			elseif last_token = CONTENT_ENTITY  then
				process_entity (onstring_ascii (last_text))
			elseif last_token = CONTENT_ENTITY_UTF8  then
				process_entity (onstring_utf8 (last_text))

			elseif last_token = ATTRIBUTE_ENTITY then
				process_attribute_entity (onstring_ascii (last_text))
			elseif last_token = ATTRIBUTE_ENTITY_UTF8 then
				process_attribute_entity (onstring_utf8 (last_text))
			end
		end

feature {NONE} -- Scanner entity processing

	process_pe_entity (a_name: STRING) is
			-- Push PE entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if pe_entities.has (a_name) then
				process_entity_scanner (pe_entities.item (a_name))
			else
				force_error (Error_doctype_undefined_pe_entity)
			end
		end

	process_entity (a_name: STRING) is
			-- Push entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if entities.has (a_name) then
				process_entity_scanner (entities.item (a_name))
			else
					-- 4.4.4 Forbidden.
				force_error (Error_entity_undefined)
			end
		end

	process_attribute_entity (a_name: STRING) is
			-- Push entity scanner on stack.
		require
			a_name_not_void: a_name /= Void
		do
			if entities.has (a_name) then
				if entities.item (a_name).is_literal then
					process_entity_scanner (entities.item (a_name))
				else
					force_error (Error_entity_literal_in_attribute)
				end
			else
					-- 4.4.4 Forbidden.
				force_error (Error_entity_undefined)
			end
		end

	process_entity_scanner (a_def: XM_EIFFEL_ENTITY_DEF) is
			-- Save previous scannner, create new scanner, and
			-- reset it with previous scanner state. 
		require
			a_def_not_void: a_def /= Void
		do
			a_def.apply_input_buffer
			if a_def.has_error then
				force_error (a_def.last_error)
			else
					-- Push scanner.
				debug ("xml_parser")
					std.error.put_string ("Pushing entity scanner. Start condition: " + scanner.start_condition.out)
					std.error.put_new_line
				end
				a_def.set_start_condition (scanner.start_condition)
				scanners.force (scanner)
				scanner := a_def
			end
		end

feature {NONE} -- String mode

	onstring_ascii (a_string: STRING): STRING is
			-- Incoming ascii string.
		require
			ascii: unicode.is_ascii_string (a_string)
		do
			if is_string_mode_unicode then -- force all unicode
				Result := new_unicode_string_from_utf8 (a_string)
			else
				Result := a_string
			end
		end
		
	onstring_utf8 (a_string: STRING): STRING is
			-- Incoming UTF8 encoded string.
		require
			not_ascii: not unicode.is_ascii_string (a_string)
		do
			if is_string_mode_ascii then
				force_error (Error_unicode_in_ascii_string_mode)
			else
				Result := new_unicode_string_from_utf8 (a_string)
			end
		end
		
	shared_empty_string: STRING is
			-- Shared empty string (type depends on string mode)
		do
			if is_string_mode_unicode then
				Result := shared_empty_string_uc
			else
				Result := shared_empty_string_string
			end
		ensure
			empty_string_not_void: Result /= Void
		end
				
feature {NONE} -- String mode: shared empty string implementation

	shared_empty_string_string: STRING is
			-- Empty string of type STRING
		once
			Result := STRING_.make_empty
		ensure
			string_type: Result.same_type ("")
		end
		
	shared_empty_string_uc: UC_STRING is
			-- Empty string of type UC_STRING
		once
			create Result.make (0)
		end

invariant

	scanner_not_void: scanner /= Void
	scanners_not_void: scanners /= Void
	no_void_scanner: not scanners.has (Void)

end
