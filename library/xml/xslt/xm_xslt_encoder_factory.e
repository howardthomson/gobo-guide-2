indexing

	description:

		"Objects that create output encoders"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ENCODER_FACTORY

inherit

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	outputter (an_encoding: STRING; a_raw_outputter: XM_OUTPUT): XM_XSLT_OUTPUT_ENCODER is
			-- Output encoder for `an_encoding'
		require
			encoding_not_void: an_encoding /= Void
			raw_outputter_not_void: a_raw_outputter /= Void
		local
			encoding: STRING
		do
			encoding := STRING_.to_upper (an_encoding)
			if encoding.count > 3 and then encoding.substring (1,3).is_equal ("UTF") then
				create {XM_XSLT_UNICODE_ENCODER} Result.make (encoding, a_raw_outputter)
			end
		end
	
end
