indexing

	author:	"Howard Thomson"
	copyright: "[
		--|---------------------------------------------------------|
		--| Copyright (c) Howard Thomson 1999,2000,2004				|
		--| 52 Ashford Crescent										|
		--| Ashford, Middlesex TW15 3EB								|
		--| United Kingdom											|
		--|---------------------------------------------------------|
	]"

class SB_MMAP_INTERFACE

feature

	Prot_none : INTEGER is 0	-- Page can be read.
	Prot_read : INTEGER is 1	-- Page can be written.
	Prot_write: INTEGER is 2	-- Page can be executed.
	Prot_exec : INTEGER is 4	-- Page can not be accessed.

	-- Sharing types (must choose one and only one of these).
	Map_shared	 : INTEGER is 1		-- Share changes.
	Map_private	 : INTEGER is 2		-- Changes are private.
	Map_fixed	 : INTEGER is 16	-- Interpret addr exactly.
	Map_anonymous: INTEGER is 32	-- Don't use a file.

--	Mremap_maymove: INTEGER is XXX
--	Mremap_fixed: INTEGER is XXX

	Map_failed: POINTER is
			-- Return value indicating failure
			-- Value equivalent to C's (void *)(-1)
		once
			Result := Result + (-1)
		end

	c_mmap (start: POINTER; length: INTEGER; prot, flags, fd, offset: INTEGER): POINTER is
		external "C use <sys/mman.h>"
		alias "mmap"
		end

	c_mremap (old_address: POINTER; old_size: INTEGER; new_size: INTEGER; flags: INTEGER; new_address: POINTER): POINTER is
		external "C use <sys/mman.h>"
		alias "mremap"
		end

	c_munmap (start: POINTER; length: INTEGER): INTEGER is
		external "C use <sys/mman.h>"
		alias "munmap"
		end

end