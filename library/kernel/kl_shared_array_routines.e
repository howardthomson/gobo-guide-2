indexing

	description:

		"Shared routines that ought to be in class ARRAY"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class KL_SHARED_ARRAY_ROUTINES

feature -- Access

	any_array_: KL_ARRAY_ROUTINES [ANY] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			any_array__not_void: Result /= Void
		end

	integer_array_: KL_ARRAY_ROUTINES [INTEGER] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			integer_array__not_void: Result /= Void
		end

	string_array_: KL_ARRAY_ROUTINES [STRING] is
			-- Routines that ought to be in class ARRAY
		once
			!! Result
		ensure
			string_array__not_void: Result /= Void
		end

end -- class KL_SHARED_ARRAY_ROUTINES
