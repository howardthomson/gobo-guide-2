indexing
	description:

		"A flag (an option that does not require extra arguments)"

	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_FLAG

inherit

	AP_OPTION

create

	make,
	make_with_long_form,
	make_with_short_form

feature -- Access

	occurrences: INTEGER
		-- Number of times this flag was encountered

feature -- Status report

	needs_parameter: BOOLEAN is
			-- Does this option need a parameter?
		do
			Result := False
		end

feature{AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing.
			-- (export status {AP_PARSER})
		do
			occurrences := occurrences + 1
		end

	reset is
			-- Reset the option to a clean state before parsing.
		do
			occurrences := 0
		end

invariant

	flags_do_not_have_parameters: not needs_parameter

end