#include "types.h"
#include "user.h"
#include "stat.h"

int main (int argc, char *argv[]){
	int val;

	if (argc != 3){
		exit();
		}

	char buff[10];
        struct iostat test;
	test.readcount = 0;
	test.writecount = 0; 

	int m = (int) argv[1];
	int n = (int) argv[2];

	for (int i = 0; i < m; i++){
		read(1, buff, 5);
		}

	for (int j = 0; j < n; j++){
		write(1, buff, 5);
		}

	val = getiocounts(&test);
	printf(1, "%d", val);
	exit();
	}

