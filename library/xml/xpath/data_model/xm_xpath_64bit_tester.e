indexing

	description:

		"XPath 64-bit equality testers"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_64BIT_TESTER

inherit

	KL_EQUALITY_TESTER [XM_XPATH_64BIT_NUMERIC_CODE]
		redefine
			test
		end

feature -- Status report

	test (v, u: XM_XPATH_64BIT_NUMERIC_CODE): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.is_equal (u)
			end
		end

end
