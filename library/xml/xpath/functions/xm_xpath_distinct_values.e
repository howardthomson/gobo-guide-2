indexing

	description:

		"Objects that implement the XPath distinct-values() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DISTINCT_VALUES

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, analyze
		redefine
			iterator
		end

	XM_XPATH_COLLATING_FUNCTION
		undefine
			iterator
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "distinct-values"
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.any_atomic_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			inspect
				argument_number
			when 1 then
				create Result.make_atomic_sequence
			when 2 then
				create Result.make_single_string
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			an_atomic_comparer: XM_XPATH_ATOMIC_SORT_COMPARER
			a_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_atomic_comparer := atomic_sort_comparer (2, a_context)
			if an_atomic_comparer = Void then
				create {XM_XPATH_INVALID_ITERATOR} Result.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error)
			else
				a_sequence := arguments.item (1).iterator (a_context)
				if a_sequence.is_error then
					Result := a_sequence
				else
					create {XM_XPATH_DISTINCT_ITERATOR} Result.make (a_sequence, an_atomic_comparer)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end
		
end
	