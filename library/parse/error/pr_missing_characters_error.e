indexing

	description:

		"Error: Missing characters"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_MISSING_CHARACTERS_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; chars: STRING) is
			-- Create a new error reporting that
			-- `chars' is missing.
		require
			filename_not_void: filename /= Void
			chars_not_void: chars /= Void
		do
			create parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (chars, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: missing $3"
			-- Default template used to built the error message

	code: STRING is "PR0001"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = missing characters

end
