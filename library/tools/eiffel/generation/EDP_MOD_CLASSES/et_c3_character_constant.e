indexing

	description:

		"Eiffel character constants of the form '%%/code/'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2005/07/13 19:39:28 $"
	revision: "$Revision: 1.11 $"

	edp_mods: "[
		Added hash_code to implement HASHABLE for DIFF comparison
		Added has_same_text
	]"

class ET_C3_CHARACTER_CONSTANT

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
				Result := literal = oc.literal
			end
		end

feature -- Hashing

	hash_code: INTEGER is
		do
			Result := value.code
		end

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: CHARACTER) is
			-- Create a new character constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]).recognizes (a_literal)
		do
			literal := a_literal
			value := a_value
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	literal: STRING
			-- Literal value of character code

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count + 4)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_c3_character_constant (Current)
		end

invariant

	literal_not_void: literal /= Void
	-- valid_literal: ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]).recognizes (literal)

end
