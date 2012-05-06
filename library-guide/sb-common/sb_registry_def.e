note
	description: "[
		The registry maintains a database of persistent settings for an application,
		or suite of applications.
	]"
	author: "Eugene Melekhov <eugene_melekhov@mail.ru>"
	copyright: "Copyright (c) 2002, Eugene Melekhov and others"
	license: "Eiffel Forum Freeware License v2 (see forum.txt)"
	status: "Initial stub implementation"

deferred class SB_REGISTRY_DEF

inherit

	SB_SETTINGS

feature

	make (name, vendor: STRING)
		deferred
		end

	read
		deferred
		end

	write
		deferred
		end

	app_key: STRING
		deferred
		end

	vendor_key: STRING
		deferred
		end

end
