indexing
	description:"Timer"
	author:		"Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright:	"Copyright (c) 2002, Eugene Melekhov and others"
	license:	"Eiffel Forum Freeware License v2 (see forum.txt)"
	status:		"Initial stub implementation"

class SB_TIMER

inherit
	SB_RAW_EVENT_DEF
	SB_SEL_TYPE
	SB_MESSAGE_COMMON
	
feature

	process(app: SB_APPLICATION) is
		do
			if target.handle(app, mksel(Sel_timeout, message), Void) then
				app.refresh
			end
		--	app.free_timer(Current)	-- ?????
		end

	next: SB_TIMER

	set_next(t: SB_TIMER) is
		do
			next := t
		end

	target: SB_MESSAGE_HANDLER
	message: INTEGER

	set_target(new_target: like target) is
		do
			target := new_target
		end

	set_message(new_message: like message) is
		do
			message := new_message
		end

--	time: INTEGER

--	set_time(new_time: like time) is
--		do
--			time := new_time
--		end

	seconds,
	micro_secs:	INTEGER			-- Time due

	set_time(a_seconds, a_micro_secs: INTEGER) is
		do
			seconds := a_seconds
			micro_secs := a_micro_secs
		end

--	is_due(st: SUS_TIME_VALUE): BOOLEAN is
--	is_due(st: EPX_TIME_VALUE): BOOLEAN is
--			-- Is this time on or after 'st' ?
--		do
--			if st.seconds > seconds
--			or else (st.seconds = seconds
--					and then st.microseconds >= micro_secs) then
--				Result := True
--			end
--		end

	precedes(other: like Current): BOOLEAN is
			-- Does Current precede other in time ?
		do
			Result := other.seconds > seconds
			or else (other.seconds = seconds and then other.micro_secs > micro_secs)
		end

invariant
--	target_not_void: target /= Void				
end
