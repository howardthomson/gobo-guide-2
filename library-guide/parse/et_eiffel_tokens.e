note

	description: "Parser token codes"
	generator: "geyacc version 3.4"

class ET_EIFFEL_TOKENS xxx

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_et_keyword_value: ET_KEYWORD
	last_et_precursor_keyword_value: ET_PRECURSOR_KEYWORD
	last_et_symbol_value: ET_SYMBOL
	last_et_position_value: ET_POSITION
	last_et_bit_constant_value: ET_BIT_CONSTANT
	last_et_boolean_constant_value: ET_BOOLEAN_CONSTANT
	last_et_break_value: ET_BREAK
	last_et_character_constant_value: ET_CHARACTER_CONSTANT
	last_et_current_value: ET_CURRENT
	last_et_free_operator_value: ET_FREE_OPERATOR
	last_et_identifier_value: ET_IDENTIFIER
	last_et_integer_constant_value: ET_INTEGER_CONSTANT
	last_et_keyword_operator_value: ET_KEYWORD_OPERATOR
	last_et_manifest_string_value: ET_MANIFEST_STRING
	last_et_real_constant_value: ET_REAL_CONSTANT
	last_et_result_value: ET_RESULT
	last_et_retry_instruction_value: ET_RETRY_INSTRUCTION
	last_et_symbol_operator_value: ET_SYMBOL_OPERATOR
	last_et_void_value: ET_VOID
	last_et_semicolon_symbol_value: ET_SEMICOLON_SYMBOL
	last_et_bracket_symbol_value: ET_BRACKET_SYMBOL
	last_et_question_mark_symbol_value: ET_QUESTION_MARK_SYMBOL

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when E_AGENT then
				Result := "E_AGENT"
			when E_ALIAS then
				Result := "E_ALIAS"
			when E_ALL then
				Result := "E_ALL"
			when E_AS then
				Result := "E_AS"
			when E_CHECK then
				Result := "E_CHECK"
			when E_CLASS then
				Result := "E_CLASS"
			when E_CREATE then
				Result := "E_CREATE"
			when E_CREATION then
				Result := "E_CREATION"
			when E_DEBUG then
				Result := "E_DEBUG"
			when E_DO then
				Result := "E_DO"
			when E_ELSE then
				Result := "E_ELSE"
			when E_ELSEIF then
				Result := "E_ELSEIF"
			when E_END then
				Result := "E_END"
			when E_ENSURE then
				Result := "E_ENSURE"
			when E_EXPORT then
				Result := "E_EXPORT"
			when E_EXTERNAL then
				Result := "E_EXTERNAL"
			when E_FEATURE then
				Result := "E_FEATURE"
			when E_FROM then
				Result := "E_FROM"
			when E_FROZEN then
				Result := "E_FROZEN"
			when E_IF then
				Result := "E_IF"
			when E_INDEXING then
				Result := "E_INDEXING"
			when E_INFIX then
				Result := "E_INFIX"
			when E_INHERIT then
				Result := "E_INHERIT"
			when E_INSPECT then
				Result := "E_INSPECT"
			when E_INSERT then
				Result := "E_INSERT"
			when E_INVARIANT then
				Result := "E_INVARIANT"
			when E_IS then
				Result := "E_IS"
			when E_LIKE then
				Result := "E_LIKE"
			when E_LOCAL then
				Result := "E_LOCAL"
			when E_LOOP then
				Result := "E_LOOP"
			when E_OBSOLETE then
				Result := "E_OBSOLETE"
			when E_ONCE then
				Result := "E_ONCE"
			when E_ONCE_STRING then
				Result := "E_ONCE_STRING"
			when E_PREFIX then
				Result := "E_PREFIX"
			when E_REDEFINE then
				Result := "E_REDEFINE"
			when E_RENAME then
				Result := "E_RENAME"
			when E_REQUIRE then
				Result := "E_REQUIRE"
			when E_RESCUE then
				Result := "E_RESCUE"
			when E_SELECT then
				Result := "E_SELECT"
			when E_STRIP then
				Result := "E_STRIP"
			when E_WHEN then
				Result := "E_WHEN"
			when E_THEN then
				Result := "E_THEN"
			when E_UNDEFINE then
				Result := "E_UNDEFINE"
			when E_UNIQUE then
				Result := "E_UNIQUE"
			when E_UNTIL then
				Result := "E_UNTIL"
			when E_VARIANT then
				Result := "E_VARIANT"
			when E_DEFERRED then
				Result := "E_DEFERRED"
			when E_EXPANDED then
				Result := "E_EXPANDED"
			when E_REFERENCE then
				Result := "E_REFERENCE"
			when E_SEPARATE then
				Result := "E_SEPARATE"
			when E_ATTRIBUTE then
				Result := "E_ATTRIBUTE"
			when E_CONVERT then
				Result := "E_CONVERT"
			when E_RECAST then
				Result := "E_RECAST"
			when E_ASSIGN then
				Result := "E_ASSIGN"
			when E_PRECURSOR then
				Result := "E_PRECURSOR"
			when E_ARROW then
				Result := "E_ARROW"
			when E_DOTDOT then
				Result := "E_DOTDOT"
			when E_LARRAY then
				Result := "E_LARRAY"
			when E_RARRAY then
				Result := "E_RARRAY"
			when E_ASSIGN_SYMBOL then
				Result := "E_ASSIGN_SYMBOL"
			when E_REVERSE then
				Result := "E_REVERSE"
			when E_ASSIGN_CHECK then
				Result := "E_ASSIGN_CHECK"
			when E_ASSIGN_FORCE then
				Result := "E_ASSIGN_FORCE"
			when E_UNKNOWN then
				Result := "E_UNKNOWN"
			when E_BIT then
				Result := "E_BIT"
			when E_FALSE then
				Result := "E_FALSE"
			when E_TRUE then
				Result := "E_TRUE"
			when E_BREAK then
				Result := "E_BREAK"
			when E_CHARACTER then
				Result := "E_CHARACTER"
			when E_CURRENT then
				Result := "E_CURRENT"
			when E_FREEOP then
				Result := "E_FREEOP"
			when E_IDENTIFIER then
				Result := "E_IDENTIFIER"
			when E_BITTYPE then
				Result := "E_BITTYPE"
			when E_TUPLE then
				Result := "E_TUPLE"
			when E_INTEGER then
				Result := "E_INTEGER"
			when E_AND then
				Result := "E_AND"
			when E_OR then
				Result := "E_OR"
			when E_XOR then
				Result := "E_XOR"
			when E_NOT then
				Result := "E_NOT"
			when E_IMPLIES then
				Result := "E_IMPLIES"
			when E_STRPLUS then
				Result := "E_STRPLUS"
			when E_STRMINUS then
				Result := "E_STRMINUS"
			when E_STRSTAR then
				Result := "E_STRSTAR"
			when E_STRSLASH then
				Result := "E_STRSLASH"
			when E_STRDIV then
				Result := "E_STRDIV"
			when E_STRMOD then
				Result := "E_STRMOD"
			when E_STRPOWER then
				Result := "E_STRPOWER"
			when E_STRLT then
				Result := "E_STRLT"
			when E_STRLE then
				Result := "E_STRLE"
			when E_STRGT then
				Result := "E_STRGT"
			when E_STRGE then
				Result := "E_STRGE"
			when E_STRAND then
				Result := "E_STRAND"
			when E_STROR then
				Result := "E_STROR"
			when E_STRXOR then
				Result := "E_STRXOR"
			when E_STRANDTHEN then
				Result := "E_STRANDTHEN"
			when E_STRORELSE then
				Result := "E_STRORELSE"
			when E_STRDOTDOT then
				Result := "E_STRDOTDOT"
			when E_STRBRACKET then
				Result := "E_STRBRACKET"
			when E_STRIMPLIES then
				Result := "E_STRIMPLIES"
			when E_STRFREEOP then
				Result := "E_STRFREEOP"
			when E_STRNOT then
				Result := "E_STRNOT"
			when E_STRING then
				Result := "E_STRING"
			when E_REAL then
				Result := "E_REAL"
			when E_RESULT then
				Result := "E_RESULT"
			when E_RETRY then
				Result := "E_RETRY"
			when E_DIV then
				Result := "E_DIV"
			when E_GE then
				Result := "E_GE"
			when E_LE then
				Result := "E_LE"
			when E_MOD then
				Result := "E_MOD"
			when E_VOID then
				Result := "E_VOID"
			when E_CHARERR then
				Result := "E_CHARERR"
			when E_STRERR then
				Result := "E_STRERR"
			when E_INTERR then
				Result := "E_INTERR"
			when E_OLD then
				Result := "E_OLD"
			when E_NE then
				Result := "E_NE"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	E_AGENT: INTEGER = 258
	E_ALIAS: INTEGER = 259
	E_ALL: INTEGER = 260
	E_AS: INTEGER = 261
	E_CHECK: INTEGER = 262
	E_CLASS: INTEGER = 263
	E_CREATE: INTEGER = 264
	E_CREATION: INTEGER = 265
	E_DEBUG: INTEGER = 266
	E_DO: INTEGER = 267
	E_ELSE: INTEGER = 268
	E_ELSEIF: INTEGER = 269
	E_END: INTEGER = 270
	E_ENSURE: INTEGER = 271
	E_EXPORT: INTEGER = 272
	E_EXTERNAL: INTEGER = 273
	E_FEATURE: INTEGER = 274
	E_FROM: INTEGER = 275
	E_FROZEN: INTEGER = 276
	E_IF: INTEGER = 277
	E_INDEXING: INTEGER = 278
	E_INFIX: INTEGER = 279
	E_INHERIT: INTEGER = 280
	E_INSPECT: INTEGER = 281
	E_INSERT: INTEGER = 282
	E_INVARIANT: INTEGER = 283
	E_IS: INTEGER = 284
	E_LIKE: INTEGER = 285
	E_LOCAL: INTEGER = 286
	E_LOOP: INTEGER = 287
	E_OBSOLETE: INTEGER = 288
	E_ONCE: INTEGER = 289
	E_ONCE_STRING: INTEGER = 290
	E_PREFIX: INTEGER = 291
	E_REDEFINE: INTEGER = 292
	E_RENAME: INTEGER = 293
	E_REQUIRE: INTEGER = 294
	E_RESCUE: INTEGER = 295
	E_SELECT: INTEGER = 296
	E_STRIP: INTEGER = 297
	E_WHEN: INTEGER = 298
	E_THEN: INTEGER = 299
	E_UNDEFINE: INTEGER = 300
	E_UNIQUE: INTEGER = 301
	E_UNTIL: INTEGER = 302
	E_VARIANT: INTEGER = 303
	E_DEFERRED: INTEGER = 304
	E_EXPANDED: INTEGER = 305
	E_REFERENCE: INTEGER = 306
	E_SEPARATE: INTEGER = 307
	E_ATTRIBUTE: INTEGER = 308
	E_CONVERT: INTEGER = 309
	E_RECAST: INTEGER = 310
	E_ASSIGN: INTEGER = 311
	E_PRECURSOR: INTEGER = 312
	E_ARROW: INTEGER = 313
	E_DOTDOT: INTEGER = 314
	E_LARRAY: INTEGER = 315
	E_RARRAY: INTEGER = 316
	E_ASSIGN_SYMBOL: INTEGER = 317
	E_REVERSE: INTEGER = 318
	E_ASSIGN_CHECK: INTEGER = 319
	E_ASSIGN_FORCE: INTEGER = 320
	E_UNKNOWN: INTEGER = 321
	E_BIT: INTEGER = 322
	E_FALSE: INTEGER = 323
	E_TRUE: INTEGER = 324
	E_BREAK: INTEGER = 325
	E_CHARACTER: INTEGER = 326
	E_CURRENT: INTEGER = 327
	E_FREEOP: INTEGER = 328
	E_IDENTIFIER: INTEGER = 329
	E_BITTYPE: INTEGER = 330
	E_TUPLE: INTEGER = 331
	E_INTEGER: INTEGER = 332
	E_AND: INTEGER = 333
	E_OR: INTEGER = 334
	E_XOR: INTEGER = 335
	E_NOT: INTEGER = 336
	E_IMPLIES: INTEGER = 337
	E_STRPLUS: INTEGER = 338
	E_STRMINUS: INTEGER = 339
	E_STRSTAR: INTEGER = 340
	E_STRSLASH: INTEGER = 341
	E_STRDIV: INTEGER = 342
	E_STRMOD: INTEGER = 343
	E_STRPOWER: INTEGER = 344
	E_STRLT: INTEGER = 345
	E_STRLE: INTEGER = 346
	E_STRGT: INTEGER = 347
	E_STRGE: INTEGER = 348
	E_STRAND: INTEGER = 349
	E_STROR: INTEGER = 350
	E_STRXOR: INTEGER = 351
	E_STRANDTHEN: INTEGER = 352
	E_STRORELSE: INTEGER = 353
	E_STRDOTDOT: INTEGER = 354
	E_STRBRACKET: INTEGER = 355
	E_STRIMPLIES: INTEGER = 356
	E_STRFREEOP: INTEGER = 357
	E_STRNOT: INTEGER = 358
	E_STRING: INTEGER = 359
	E_REAL: INTEGER = 360
	E_RESULT: INTEGER = 361
	E_RETRY: INTEGER = 362
	E_DIV: INTEGER = 363
	E_GE: INTEGER = 364
	E_LE: INTEGER = 365
	E_MOD: INTEGER = 366
	E_VOID: INTEGER = 367
	E_CHARERR: INTEGER = 368
	E_STRERR: INTEGER = 369
	E_INTERR: INTEGER = 370
	E_OLD: INTEGER = 371
	E_NE: INTEGER = 372

end
