indexing
	
	description:

		"Interface for absolute URI resolver"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_URI_RESOLVER

inherit

	ANY
	
	KL_IMPORTED_STRING_ROUTINES
	
feature -- Operation(s)

	scheme: STRING is
			-- Scheme name (constant).
		deferred
		ensure
			result_not_void: Result /= Void
			result_not_empty: not Result.is_empty
		end
		
	resolve (a_uri: UT_URI) is
			-- Resolve URI to stream.
		require
			a_uri_not_void: a_uri /= Void
			a_uri_absolute: a_uri.is_absolute
			a_uri_scheme: STRING_.same_string (scheme, a_uri.scheme)
		deferred
		end
		
feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from external entity
		require
			not_error: not has_error
		deferred
		ensure
			not_void: Result /= Void
		end
	
	has_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		deferred
		end
		
	last_error: STRING is
			-- Last error message
		require
			has_error: has_error
		deferred
		ensure
			not_void: Result /= Void
		end

end