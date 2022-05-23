#define T_DIR 1 // DIRECTORY
#define T_FILE 2 // FILE
#define T_DEV 3 // Device

struct stat {
	int readcount; // total number of times read() is invoked by the current running process
	int writecount; // total number of times write() is invoked by the current process
};
