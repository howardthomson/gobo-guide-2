-- system:     "Calculator with memory"
-- compiler:   "ISE Eiffel 4.5"
-- author:     "Eric Bezault <ericb@gobosoft.com>"
-- copyright:  "Copyright (c) 1997-2000, Eric Bezault and others"
-- license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
-- date:       "$Date$"
-- revision:   "$Revision$"

system

	mcalc

root

	MCALC: execute

default

	console_application (yes);
	--debug (yes);
#ifdef ASSERTION
	assertion (all);
#else
	--assertion (all);
#endif
	--precompiled ("$EIFFEL4/precomp/spec/$PLATFORM/base")

cluster

	mcalc:				"$GOBO/example/parse/mcalc";

#include "$GOBO/library/parse/hact-skl.ace"

#include "$GOBO/library/structure/hact.ace"

#include "$GOBO/library/kernel/hact.ace"

		-- EiffelBase
	kernel:				"$EIFFEL4/library/base/kernel";
	support:			"$EIFFEL4/library/base/support";
	access:				"$EIFFEL4/library/base/structures/access";
	cursors:			"$EIFFEL4/library/base/structures/cursors";
	cursor_trees:		"$EIFFEL4/library/base/structures/cursor_tree";
	dispenser:			"$EIFFEL4/library/base/structures/dispenser";
	iteration:			"$EIFFEL4/library/base/structures/iteration";
	list:				"$EIFFEL4/library/base/structures/list";
	set:				"$EIFFEL4/library/base/structures/set";
	sort:				"$EIFFEL4/library/base/structures/sort";
	storage:			"$EIFFEL4/library/base/structures/storage";
	table:				"$EIFFEL4/library/base/structures/table";
	traversing:			"$EIFFEL4/library/base/structures/traversing";
	tree:				"$EIFFEL4/library/base/structures/tree";

external

	include_path: "$GOBO/library/kernel/include"

end
