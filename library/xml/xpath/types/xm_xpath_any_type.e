indexing

	description:

		"Objects that implement xs:anyType"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_TYPE

inherit

	XM_XPATH_SCHEMA_TYPE

creation

	make
	
feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			local_name := "anyType"
			namespace_uri := Xml_schema_uri
			fingerprint := Any_type_code
			is_abstract := True
		end

feature -- Access

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		
		do
			Result := True 
		end

		super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			do_nothing
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := fingerprint
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		local
			an_any_type: like Current
		do
			an_any_type ?= other
			Result := an_any_type /= Void
		end

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages
		do
			Result := "xa:anyType"
		end

end
	