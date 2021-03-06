indexing

	description:

		"Eiffel character constants of the form '%%A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2005/07/13 19:39:28 $"
	revision: "$Revision: 1.11 $"

	edp_mods: "[
		Added hash_code to implement HASHABLE for DIFF comparison
		Added has_same_text
	]"

class ET_C2_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

create

	make

feature -- Token comparison

	has_same_text (other: ET_AST_LEAF): BOOLEAN is
		local
			oc: like Current
		do
			oc ?= other
			if oc /= Void then
				Result := value = oc.value
			end
		end

feature -- Hashing

	hash_code: INTEGER is
		do
			Result := value.code
		end

feature {NONE} -- Initialization

	make (a_value: CHARACTER) is
			-- Create a new character constant.
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	literal: CHARACTER is
			-- Character A such as '%A' is current character
		do
			inspect value
			when '%A' then
				Result := 'A'
			when '%B' then
				Result := 'B'
			when '%C' then
				Result := 'C'
			when '%D' then
				Result := 'D'
			when '%F' then
				Result := 'F'
			when '%H' then
				Result := 'H'
			when '%L' then
				Result := 'L'
			when '%N' then
				Result := 'N'
			when '%Q' then
				Result := 'Q'
			when '%R' then
				Result := 'R'
			when '%S' then
				Result := 'S'
			when '%T' then
				Result := 'T'
			when '%U' then
				Result := 'U'
			when '%V' then
				Result := 'V'
			when '%%' then
				Result := '%%'
			when '%'' then
				Result := '%''
			when '%"' then
				Result := '%"'
			when '%(' then
				Result := '('
			when '%)' then
				Result := ')'
			when '%<' then
				Result := '<'
			when '%>' then
				Result := '>'
			else
					-- Should never happen.
				Result := value
			end
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 3)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_c2_character_constant (Current)
		end

end
