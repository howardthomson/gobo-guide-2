expanded class SB_WAPI_PROCESS_AND_THREAD_FUNCTIONS

feature

   CreateProcess (lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes: POINTER;
                  bInheritHandles: INTEGER; dwCreationFlags: INTEGER_32;
                  lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation: POINTER): INTEGER





      external "C use <windows.h>"
      alias "CreateProcessA"





      end
	----------------------------
	
   OpenProcess(dwDesiredAccess: INTEGER_32; bInheritHandle: INTEGER; dwProcessId: INTEGER): POINTER





      external "C use <windows.h>"
      alias "OpenProcess"





      end
	----------------------------

   GetCurrentProcess: POINTER





      external "C use <windows.h>"
      alias "GetCurrentProcess"





      end
	----------------------------

   GetCurrentProcessId : INTEGER





      external "C use <windows.h>"
      alias "GetCurrentProcessId"





      end
	----------------------------

   GetExitCodeProcess (hProcess: POINTER ;lpExitCode: POINTER): INTEGER





      external "C use <windows.h>"
      alias "GetExitCodeProcess"





      end
	----------------------------

   GetPriorityClass (hProcess : POINTER) : INTEGER





      external "C use <windows.h>"
      alias "GetPriorityClass"





      end
	----------------------------

   SetPriorityClass (hProcess : POINTER; dwPriorityClass : INTEGER) : INTEGER





      external "C use <windows.h>"
      alias "SetPriorityClass"





      end
	----------------------------

   GetEnvironmentVariable (lpName,lpBuffer: POINTER; nSize: INTEGER): INTEGER





      external "C use <windows.h>"
      alias "GetEnvironmentVariableA"





      end
	----------------------------

   SetEnvironmentVariable (lpName,lpValue: POINTER): INTEGER





      external "C use <windows.h>"
      alias "SetEnvironmentVariableA"





      end
	----------------------------

feature -- Thread functions

   GetCurrentThread: POINTER





      external "C use <windows.h>"
      alias "GetCurrentThread"





      end
	----------------------------

   GetCurrentThreadId: INTEGER





      external "C use <windows.h>"
      alias "GetCurrentThreadId"





      end
	----------------------------

   GetExitCodeThread (hThread: POINTER; lpExitCode: POINTER): INTEGER





      external "C use <windows.h>"
      alias "GetExitCodeThread"





      end
	----------------------------

   Sleep (dwMilliseconds: INTEGER)





      external "C use <windows.h>"
      alias "Sleep"





      end
	----------------------------

end
