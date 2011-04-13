/*
	description:

		"C functions used when using the EDP garbage collector"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2007-08-01 13:00:54 +0100 (Wed, 01 Aug 2007) $"
	revision: "$Revision: 6033 $"
*/

/* TODO:
 * 	Need hints for next single free page for small object allocation
 * 	Need free page span info
 */

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC

/*
 *	Use the Boehm garbage collector.
 *	See:
 *		http://en.wikipedia.org/wiki/Boehm_GC
 *		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
 */

#include "gc.h"

/*
 *	GC initialization.
 */
#define GE_init_gc() GC_INIT(); GC_enable_incremental()

/*
 *	Memory allocation.
 */

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#define GE_alloc(x) GE_null(GC_MALLOC(x))

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
#define GE_alloc_cleared

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */

/*
 *	Dispose
 */

/*
 * Call dispose routine `disp' on object `C'.
 */
extern void GE_boehm_dispose(void*, void*);

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, NULL, NULL, NULL)

/*
 * Routine for GC object validation
 */
#define GE_check_valid(obj) (obj)

/*========================================================================================================*/

#else
#ifdef EIF_EDP_GC

#if 0
#define EDP_GC_DEBUG
#endif

#if 1
#define X86_64
#endif

#if 0
#ifdef EDP_GC_DEBUG
#define TRACE_ENTRY_EXIT
#endif
#endif

#ifdef EDP_GC_DEBUG
#if 0
#define EDP_REPORT_GC_ITEM_FREE
#endif
#endif

#ifndef EDP_GC_DEBUG
#define GC_PAGE_CYCLE 10000
#define item__validate(x) (x)
#else
#define GC_PAGE_CYCLE 1000	/* Reduce for debugging ... */
#endif

#ifndef EDP_GC_DEBUG
#ifndef COMPILE_STANDALONE
#define NDEBUG
#endif
#endif

#if 1
#define assert_require(x) assert(x)
#else
#define assert_require(x)
#endif

#if 1
#define assert_ensure(x) assert(x)
#else
#define assert_ensure(x)
#endif

#if 0
#define assert_invariant(x) assert(x)
#else
#define assert_invariant(x)
#endif

#if 1
#define assert_other(x) assert(x)
#else
#define assert_other(x)
#endif

#if 1
#define assert_loop(x) assert(x)
#else
#define assert_loop(x)
#endif

#if 1
#define EDP_GC_INVARIANT
#endif

/* Use the EDP Garbage Collector */

/*
 *	GC initialization.
 */
extern void GE_init_gc();

/*
 *	Memory allocation.
 */
#if 0

#define GE_alloc(x) GE_null(calloc((x),1))
#define GE_alloc_cleared
#define GE_alloc_atomic(x) GE_null(calloc((x),1))
#else
/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#define GE_alloc(x) GE_null(gealloc_size_id(x,0))

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#define GE_alloc_atomic(x) GE_null(gealloc_size_id(x,0))
#endif
/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) /* TODO */

#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#define NO_FREESPACES 8
	/* Smaller sizes: 16,32,64,128,256,512,1024,2048 */

union page_info {
	char pad [6];
	struct {
		u_int16_t status;
			/*
			 * 0 [maps to -1] (default) => page is free
			 * 1-8 [maps to 0-7] => items of size 16 << x
			 * 9+ [maps to 8+] => multi-page [1+ pages] single item
			 */
#if 1
		u_int16_t next_free;
			/*
			 * Index of first free object in this page
			 *
			 * Low (odd) bit defines validity:
			 * 		0 => No free space [value == 0]
			 * 		1 => 0 based byte offset of first free item ...
			 */
#endif
		u_int16_t free_link;
			/*
			 * Index of next page, in this arena, of the same type
			 * that has free space available.
			 * 0 => NULL
			 * 8..4095 page number link
			 */
	} s;
};
typedef union page_info page_info_t;

typedef struct gc_item gc_item_t;

typedef struct gc_arena gc_arena_t;

struct gc_arena {
	/* Page 0 */
	union {
		char cards [4096];

		/* 8 bytes are available, unused cards at the start of the page,
		 * used in the pointer declared here
		 */
		struct gc_arena *next_arena;
			/* Next arena in list, NULL for last */
	} p0;

	/* Pages 1,2,3,4,5,6 */
	union {
		page_info_t page_info [4096];

		/* 48 (6*8) bytes are available at the start of this page set */
		struct ps1_6 {

			u_int16_t free_list [8];
				/*
				 * Index of first page in list with free space of
				 * size corresponding to the index
				 */
		} s;
	} p1_6;

	/* Page 7 */

	union u7 {
		char pad [4096];
		struct ps7 {
			int arena_magic;
				/* Arena Magic Value; check for memory corruption ... */
			gc_item_t *free_item_lists [ NO_FREESPACES ];
				/* Cuurent block[s] of consecutive free item allocations */
			gc_arena_t *arena_free_cache [ NO_FREESPACES ];
				/* Indexes of blocks known to have free space */
		} s;
	} p7;
};

#define PAGE_NOT_MAPPED (1 << 15)
#define PAGE_TYPE_MASK ((1 << 12) - 1)

/*
 *	GC initialization.
 */
extern void GE_init_gc();

/* Memory allocation */
extern void *gealloc_size_id(int, int);

extern void *gc__root_object;
		/* Pointer to the first created object in the system */

#ifdef TRACE_ENTRY_EXIT
#define TRACE_ENTRY(x) if (x <= 0) { printf("Entry to  %s ...\n", __PRETTY_FUNCTION__); fflush(stdout); }
#define TRACE_EXIT(x)  if (x <= 0) { printf("Exit from %s ...\n", __PRETTY_FUNCTION__); fflush(stdout); }
#else
#define TRACE_ENTRY(x)
#define TRACE_EXIT(x)
#endif

#if 0
#define TRACE_ROUTINE(x) if (x <= 0) { printf("Tracing %s at line: %d\n", __PRETTY_FUNCTION__, __LINE__); fflush(stdout); }
#else
#define TRACE_ROUTINE(x)
#endif

void trace_line_no(int);
#define TRACE_LINE_NO(x) trace_line_no(x)

struct gc_item {
	int16_t id;
		/* Class ID */
	int16_t gc_flags;
		/* Flags for the GC */
	int16_t gc_item_count;
		/* Count of free items in this free block */
	int16_t gc_item_next;
		/* Offset, in bytes, of next free item in this block */
#ifdef COMPILE_STANDALONE
	gc_item_t *gc_reference;
		/* XXXXX */
#endif
};

struct gc_bitmap {
	int64_t allocated[4];
			/* Bitmap of allocated bitmap areas of
			 * the remainder of this page.
			 * 128 bits => 32 bytes per map
			 */

	int64_t bitmaps [127][4];
			/* Each map is 4x8 = 32 bytes.
			 * Max 32x8 = 256 bits entries
			 */
};
typedef struct gc_bitmap gc_bitmap_t;

#define IS_32_IF_64_BITS 0	/* TODO: 64 Bits */

/* Item flags */
#if 0
#define ITEM_IS_ALLOCATED	(1 << (31 + IS_32_IF_64_BITS))
#define ITEM_IS_MARKED		(1 << (30 + IS_32_IF_64_BITS))
#define ITEM_IS_BLACK		(1 << (29 + IS_32_IF_64_BITS))
#define ITEM_ID_MASK		(~((~0) << 29))
#else
#define ITEM_IS_ALLOCATED	(1 << 0)
#define ITEM_IS_MARKED		(1 << 1)
#define ITEM_IS_BLACK		(1 << 2)
#define ITEM_IS_ATOMIC		(1 << 3)
#endif
/* card__ marking */
inline				card__mark (void *);

/* item__ ... routines */
inline int 			item__is_free (gc_item_t *item);
inline void 		item__set_free (gc_item_t *item);
inline gc_arena_t *	item__to_arena (gc_item_t *item);
inline int 			item__to_page_no (gc_item_t *item);
inline void 		item__mark (gc_item_t *item);
inline int 			item__is_marked (gc_item_t *item);
inline void 		item__set_black (gc_item_t *item);
inline int 			item__is_black (gc_item_t *item);
inline int			item__is_atomic (gc_item_t *item);
inline void 		item__unmark (gc_item_t *p_item);
gc_item_t *			item__indexed (gc_item_t *item, int index, int size);

inline int page__type(gc_arena_t *, int);

/* ARENA__ ... routines */
inline gc_item_t *	ARENA__address (gc_arena_t *, int, int);
void				ARENA__clear_marks (gc_arena_t *pa);
int 				ARENA__scan_mark (gc_arena_t *pa);
int 				ARENA__mark_page (gc_arena_t *pa, int page_no);
inline void			ARENA__free_multi_page_item (gc_arena_t *pa, int page_no);
void 				ARENA__scan_free (gc_arena_t *pa);
int 				ARENA__invariant (gc_arena_t *);
inline int			ARENA__free_list(gc_arena_t *, int);
inline void			ARENA__set_free_list(gc_arena_t *, int, int);

/* GC__ ... routines */
void GC__full_collect();

long free_space;
long used_space;
long mapped_space;

#define ARENA_MAGIC 0xa0e0a234

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) /* do nothing */

struct GC_stack_descriptor {
	int16_t	init_flag;
				/* != 0 implies initialization completed */
	int16_t	nb_references;
				/* Including locals, arguments and temporaries */
	int16_t	nb_locals;
	int16_t	nb_arguments;
	int16_t offsets[];
				/* This an array of size nb_references */
};
typedef struct GC_stack_descriptor GE_stack_t;

#define GE_stack_t_N(x) 											\
struct {															\
	int16_t	init_flag;												\
				/* != 0 implies initialization completed */			\
	int16_t	nb_references;											\
				/* Including locals, arguments and temporaries */	\
	int16_t	nb_locals;												\
	int16_t	nb_arguments;											\
	int16_t offsets[x];												\
				/* This an array of size nb_references */			\
}

extern void **stack_bottom;

extern gc_item_t *gc__last_item_validated;

extern gc_item_t *GC__last_item_allocated;
		/* Most recently allocated item. Part of the Root Set
		 * to fix the 'hidden' [grom the GC] reference within
		 * the GE_ma... routines that generate Mainifest Arrays
		 */

/*========================================================================================================*/

#else

/*
 *	No garbage collector.
 */

/*
 *	GC initialization.
 */
#define GE_init_gc() /* do nothing */

/*
 *	Memory allocation.
 */

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#define GE_alloc(x) GE_null(malloc(x))

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_cleared */

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#define GE_alloc_atomic(x) GE_null(malloc(x))

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */

/*
 *	Dispose
 */

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) /* do nothing */

/*
 * Routine for GC object validation
 */
#define GE_check_valid(obj) (obj)

#endif
#endif

#endif