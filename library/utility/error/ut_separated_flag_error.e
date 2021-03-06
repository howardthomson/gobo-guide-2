indexing

	description:

		"Error: Command-line flag must be given separately"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SEPARATED_FLAG_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_flag: STRING) is
			-- Create a new error reporting that flag
			-- `a_flag' must be given separately.
		require
			a_flag_not_void: a_flag /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_flag, 1)
		end

feature -- Access

	default_template: STRING is "$0: $1 flag must be given separately"
			-- Default template used to built the error message

	code: STRING is "UT0001"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = flag

end
