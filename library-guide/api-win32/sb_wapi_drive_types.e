expanded class SB_WAPI_DRIVE_TYPES

feature -- Constants

   DRIVE_UNKNOWN: INTEGER = 0
         -- The drive type cannot be determined

   DRIVE_NO_ROOT_DIR: INTEGER = 1
         -- The root directory does not exist

   DRIVE_REMOVABLE: INTEGER = 2
         -- The drive can be removed from the drive

   DRIVE_FIXED: INTEGER = 3
         -- The disk cannot be removed from the drive

   DRIVE_REMOTE: INTEGER = 4
         -- The drive is a remote (network) drive

   DRIVE_CDROM: INTEGER = 5
         -- The drive is a CD-ROM drive

   DRIVE_RAMDISK: INTEGER = 6
         -- The drive is a RAM disk
   
end
