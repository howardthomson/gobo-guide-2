indexing

	description:

		"Standard tree attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_ATTRIBUTE
	
inherit
	
	XM_XPATH_ATTRIBUTE
		undefine
			document_element, next_sibling, previous_sibling, local_part
		end

	XM_XPATH_TREE_NODE
		redefine
			name_code, is_same_node, sequence_number,
			next_sibling, previous_sibling, previous_node_in_document_order, next_node_in_document_order
		end

creation

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; an_element: XM_XPATH_TREE_ELEMENT; an_index: INTEGER) is
			-- Establish invariant
		require
			element_not_void: an_element /= Void
			strictly_positive_index: an_index > 0
		do
			document := a_document
			node_type := Attribute_node
			parent_node := an_element
			child_index := an_index
			string_value := an_element.attribute_value_by_index (child_index)
			name_code := an_element.attribute_name_code (child_index)
		ensure
			parent_set: parent_node = an_element
			child_index_set: child_index = an_index
		end

feature -- Access

	string_value: STRING
			--Value of the item as a string

	name_code: INTEGER
			-- Name code this node - used in displaying names

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
			-- In this implementation, parent nodes (elements and roots)
			--  have a zero least-significant word, while namespaces,
			--  attributes, text nodes, comments, and PIs have
			--  the top word the same as their owner and the
			--  bottom half reflecting their relative position.
		do
			create Result.make_from_sequence_number_with_double_offset (parent_node.sequence_number, child_index)
		end

	previous_sibling: XM_XPATH_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end
	
	next_sibling: XM_XPATH_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_TREE_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		local
			another_attribute: XM_XPATH_TREE_ATTRIBUTE
		do
			if other = Current then
				Result := True
			else
				another_attribute ?= other
				if another_attribute /= Void then
					Result := parent_node.is_same_node (another_attribute.parent_node) and then name_code = another_attribute.name_code
				end
			end
		end

feature {XM_XPATH_TREE_NODE} -- Restricted

	previous_node_in_document_order: XM_XPATH_TREE_NODE is
			-- Previous node within the document
		do
			Result := parent
		end

	next_node_in_document_order (an_anchor: XM_XPATH_TREE_NODE): XM_XPATH_TREE_NODE is
			-- Next node within the document (skipping attributes);
			-- The scan stops if it encounters `an_anchor'
		do
			if an_anchor /= Current then
				Result := parent.next_node_in_document_order (an_anchor)
			end
		end

	
feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

invariant

	parent_not_void: parent_node /= Void

end
	