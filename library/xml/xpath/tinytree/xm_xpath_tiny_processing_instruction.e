indexing

	description:

		"Tiny tree Processing-instruction nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_PROCESSING_INSTRUCTION

inherit

	XM_XPATH_PROCESSING_INSTRUCTION

	XM_XPATH_TINY_NODE

creation

	make

feature {NONE} -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; a_node_number: INTEGER) is
		require
			valid_document: doc /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= doc.last_node_added
		do
			document := doc
			node_number := a_node_number
		ensure
			document_set: document = doc
			node_number_set: node_number = a_node_number
		end

feature -- Access

		string_value: STRING is
			-- String-value
		local
			start, length: INTEGER
			buffer: STRING
		do
			length := document.beta_value (node_number)
			start := document.alpha_value (node_number)
			create {UC_UTF8_STRING} Result.make_from_substring (document.comment_buffer, start, start + length)
		end

feature {XM_XPATH_NODE} -- Access

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end
end