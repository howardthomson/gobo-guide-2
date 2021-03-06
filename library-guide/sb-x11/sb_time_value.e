class SB_TIME_VALUE

create

	make_from_now

feature

	make_from_now is
		local
			r: INTEGER
		do
			if area = Void then
				make
			end
			r := c_gettimeofday (ptr, default_pointer)
		end

	seconds: INTEGER is
		do
			Result := c_seconds (ptr)
		end

	microseconds: INTEGER is
		do
			Result := c_microseconds (ptr)
		end

feature -- Implementation

   	make is
		do
			create area.make (external_size)
			ptr := area.item
		ensure
			pointer_valid: ptr /= default_pointer
		end

	area: MANAGED_POINTER

	ptr: POINTER

	external_size: INTEGER is
		external "C macro use <sys/time.h>"
		alias "sizeof (struct timeval)"
		end

	c_gettimeofday (p1, p2: POINTER): INTEGER is
		external "C use <sys/time.h>"
		alias "gettimeofday"
		end

	c_seconds		(p: POINTER): INTEGER is external "C struct struct timeval access tv_sec use <sys/time.h>" end
	c_microseconds	(p: POINTER): INTEGER is external "C struct struct timeval access tv_usec use <sys/time.h>" end

end
