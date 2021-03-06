indexing

	description:

		"Eiffel integer constants in hexadecimal format"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009-03-11 13:13:29 +0000 (Wed, 11 Mar 2009) $"
	revision: "$Revision: 6607 $"

	edp_mods: "[
		Added hash_code to implement HASHABLE for DIFF comparison
	]"

class ET_HEXADECIMAL_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT
		redefine
			is_integer_8,
			is_integer_16,
			is_integer_32,
			is_integer_64,
			to_integer_8,
			to_integer_16,
			to_integer_32,
			to_integer_64,
			is_hexadecimal
		end

create

	make

feature -- Hashing

	hash_code: INTEGER is
		do
			-- TODO hash_code
		end

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
--			valid_literal: (0[xX](_*[0-9a-fA-F]+_*)+).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
			compute_value
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	to_integer_8: INTEGER_8 is
			-- INTEGER_8 value of current integer constant
		do
			if sign /= Void and then sign.is_minus then
				if value = integer_8_min_value_abs then
					Result := {INTEGER_8}.Min_value
				else
					Result := -value.as_integer_8
				end
			elseif value <= {INTEGER_8}.max_value.as_natural_64 then
				Result := value.as_integer_8
			else
				Result := (value - integer_8_min_value_abs).as_integer_8 + {INTEGER_8}.Min_value
			end
		end

	to_integer_16: INTEGER_16 is
			-- INTEGER_16 value of current integer constant
		do
			if sign /= Void and then sign.is_minus then
				if value = integer_16_min_value_abs then
					Result := {INTEGER_16}.Min_value
				else
					Result := -value.as_integer_16
				end
			elseif value <= {INTEGER_16}.max_value.as_natural_64 then
				Result := value.as_integer_16
			else
				Result := (value - integer_16_min_value_abs).as_integer_16 + {INTEGER_16}.Min_value
			end
		end

	to_integer_32: INTEGER_32 is
			-- INTEGER_32 value of current integer constant
		do
			if sign /= Void and then sign.is_minus then
				if value = integer_32_min_value_abs then
					Result := {INTEGER_32}.Min_value
				else
					Result := -value.as_integer_32
				end
			elseif value <= {INTEGER_32}.max_value.as_natural_64 then
				Result := value.as_integer_32
			else
				Result := (value - integer_32_min_value_abs).as_integer_32 + {INTEGER_32}.Min_value
			end
		end

	to_integer_64: INTEGER_64 is
			-- INTEGER_64 value of current integer constant
		do
			if sign /= Void and then sign.is_minus then
				if value = integer_64_min_value_abs then
					Result := {INTEGER_64}.Min_value
				else
					Result := -value.as_integer_64
				end
			elseif value <= {INTEGER_64}.max_value.as_natural_64 then
				Result := value.as_integer_64
			else
				Result := (value - integer_64_min_value_abs).as_integer_64 + {INTEGER_64}.Min_value
			end
		end

feature -- Status report

	is_hexadecimal: BOOLEAN is True
			-- Is current constant in hexadecimal format

	is_integer_8: BOOLEAN is
			-- Is current integer constant representable as an INTEGER_8?
		do
			if has_overflow then
				Result := False
			elseif sign = Void then
				Result := value <= {NATURAL_8}.Max_value
			elseif sign.is_minus then
				Result := value <= integer_8_min_value_abs
			else
				Result := value <= {INTEGER_8}.Max_value.as_natural_64
			end
		end

	is_integer_16: BOOLEAN is
			-- Is current integer constant representable as an INTEGER_16?
		do
			if has_overflow then
				Result := False
			elseif sign = Void then
				Result := value <= {NATURAL_16}.Max_value
			elseif sign.is_minus then
				Result := value <= integer_16_min_value_abs
			else
				Result := value <= {INTEGER_16}.Max_value.as_natural_64
			end
		end

	is_integer_32: BOOLEAN is
			-- Is current integer constant representable as an INTEGER_32?
		do
			if has_overflow then
				Result := False
			elseif sign = Void then
				Result := value <= {NATURAL_32}.Max_value
			elseif sign.is_minus then
				Result := value <= integer_32_min_value_abs
			else
				Result := value <= {INTEGER_32}.Max_value.as_natural_64
			end
		end

	is_integer_64: BOOLEAN is
			-- Is current integer constant representable as an INTEGER_64?
		do
			if has_overflow then
				Result := False
			elseif sign = Void then
				Result := True
			elseif sign.is_minus then
				Result := value <= integer_64_min_value_abs
			else
				Result := value <= {INTEGER_64}.Max_value.to_natural_64
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_hexadecimal_integer_constant (Current)
		end

feature {NONE} -- Implementation

	compute_value is
			-- Compute value of current integer constant.
			-- Make result available in `value' or set
			-- `has_overflow' to true if an overflow
			-- occurred during computation.
		local
			v, d: NATURAL_64
			i, nb: INTEGER
			l_n1: NATURAL_64
			l_n2: NATURAL_64
			c: CHARACTER
		do
			l_n1 := {NATURAL_64}.Max_value // 16
			l_n2 := {NATURAL_64}.max_value \\ 16
			has_overflow := False
			nb := literal.count
			from i := 3 until i > nb loop
				c := literal.item (i)
				if c /= '_' then
					inspect c
					when '0' then
						d := 0
					when '1' then
						d := 1
					when '2' then
						d := 2
					when '3' then
						d := 3
					when '4' then
						d := 4
					when '5' then
						d := 5
					when '6' then
						d := 6
					when '7' then
						d := 7
					when '8' then
						d := 8
					when '9' then
						d := 9
					when 'a', 'A' then
						d := 10
					when 'b', 'B' then
						d := 11
					when 'c', 'C' then
						d := 12
					when 'd', 'D' then
						d := 13
					when 'e','E' then
						d := 14
					when 'f', 'F' then
						d := 15
					end
					if v < l_n1 or (v = l_n1 and d <= l_n2) then
						v := 16 * v + d
					else
							-- Overflow.
						has_overflow := True
						i := nb + 1
					end
				end
				i := i + 1
			end
			value := v
		end

invariant

--	valid_literal: (0[xX](_*[0-9a-fA-F]+_*)+).recognizes (literal)

end
