expanded class SB_WAPI_DYNAMIC_LINK_LIBRARY_FUNCTIONS

feature -- Access

   GetModuleHandle (lpszModule: POINTER): POINTER is





      external "C use <windows.h>"
      alias "GetModuleHandleA"





      end

end
