/* C load/store macros */

#define c_load_reference(p)			(* (EIF_REFERENCE		*) p)
#define c_load_pointer(p)			(* (EIF_POINTER			*) p)
#define c_load_boolean(p)			(* (EIF_BOOLEAN			*) p)
#define c_load_character(p)			(* (EIF_CHARACTER		*) p)
#define c_load_wide_character(p)	(* (EIF_WIDE_CHARACTER	*) p)
#define c_load_integer_8(p)			(* (EIF_INTEGER_8		*) p)
#define c_load_integer_16(p)		(* (EIF_INTEGER_16		*) p)
#define c_load_integer_32(p)		(* (EIF_INTEGER_32		*) p)
#define c_load_integer_64(p)		(* (EIF_INTEGER_64		*) p)
#define c_load_natural_8(p)			(* (EIF_NATURAL_8		*) p)
#define c_load_natural_16(p)		(* (EIF_NATURAL_16		*) p)
#define c_load_natural_32(p)		(* (EIF_NATURAL_32		*) p)
#define c_load_natural_64(p)		(* (EIF_NATURAL_64		*) p)
#define c_load_real_32(p)			(* (EIF_REAL_32			*) p)
#define c_load_real_64(p)			(* (EIF_REAL_64			*) p)

#define c_store_reference(p,v)		(* (EIF_REFERENCE		*) p = v)
#define c_store_pointer(p,v)		(* (EIF_POINTER			*) p = v)
#define c_store_boolean(p,v)		(* (EIF_BOOLEAN			*) p = v)
#define c_store_character(p,v)		(* (EIF_CHARACTER		*) p = v)
#define c_store_wide_character(p,v)	(* (EIF_WIDE_CHARACTER	*) p = v)
#define c_store_integer_8(p,v)		(* (EIF_INTEGER_8		*) p = v)
#define c_store_integer_16(p,v)		(* (EIF_INTEGER_16		*) p = v)
#define c_store_integer_32(p,v)		(* (EIF_INTEGER_32		*) p = v)
#define c_store_integer_64(p,v)		(* (EIF_INTEGER_64		*) p = v)
#define c_store_natural_8(p,v)		(* (EIF_NATURAL_8		*) p = v)
#define c_store_natural_16(p,v)		(* (EIF_NATURAL_16		*) p = v)
#define c_store_natural_32(p,v)		(* (EIF_NATURAL_32		*) p = v)
#define c_store_natural_64(p,v)		(* (EIF_NATURAL_64		*) p = v)
#define c_store_real_32(p,v)		(* (EIF_REAL_32			*) p = v)
#define c_store_real_64(p,v)		(* (EIF_REAL_64			*) p = v)
