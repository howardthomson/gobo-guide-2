indexing

	description:

		"XML character data nodes (plain text)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_CHARACTER_DATA

inherit

	XM_NODE

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_parent: like parent; c: like content) is
			-- Create a new character data node.
		require
			a_parent_not_void: a_parent /= Void
			c_not_void: c /= Void
		do
			parent := a_parent
			content := c
		ensure
			parent_set: parent = a_parent
			content_set: content = c
		end

feature -- Access

	content: STRING
			-- Actual character data

feature -- Element change

	append_content (other: like Current) is
			-- Append the content of 'other' to
			-- the content of `Current'.
		require
			other_not_void: other /= Void
		do
			content := STRING_.appended_string (content, other.content)
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_character_data (Current)
		end

invariant

	content_not_void: content /= Void

end
