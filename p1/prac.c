#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <string.h>

void aposRemoval(char* buff){
	if (buff == NULL)
		return;

	char str[128];
	int j = 0;
	for (int i = 0; i < strlen(buff); i++){
        	if ((buff[i] >= 'a' && buff[i] <= 'z') || (buff[i] >= 'A' && buff[i] <= 'Z') || (buff[i] >= '0' && buff[i] <= '9')){
            		str[j] = buff[i];
            		j++;
        			}
    		}
	str[j] = '\0';
	strcpy(buff, str);
	}
		


int main(int argc, char *argv[]) {
	printf("start");
	FILE *fp;
	char buffer[1000];
	char *buff;
	int result;
	int option;
	extern char *optarg;
	char *filename;
	char *prefix;
	int f_flag = 0;
	int index; 
	char temp[1000];
	
	printf("here");

	while((option = getopt(argc, argv, "Vhf:")) != -1){
		switch (option){
			case 'V':
				printf("my-look from CS537 Spring 2022\n");
				exit(0);
			case 'h':
				printf("my-look takes string as an input and returns any lines in a file that contains that string as a prerfix.");
				exit(0);
			case 'f':
				f_flag++;
				filename = optarg;				
				break; 
			case '?':
				if (optopt == 'f'){
					printf("my-look: invalid command line\n");
					exit(1);
					}
			default:
				printf("my-look: invalid command line\n");
				exit(1);
				}
			}
	
	for (index = optind; index < argc; index++){
		prefix = argv[index];
 		}
				
	if (f_flag == 1){
		fp = fopen(filename, "r");
		}

	if (fp == NULL && f_flag == 1){
		printf("my-look: cannot open file\n");
		exit(1);
		}else{
			if(f_flag == 1){
				while(!feof(fp)){
					buff = fgets(buffer, 1000,fp);
					strcpy(temp, buffer);
					aposRemoval(buff);
					if (buff == NULL){
						break;
						}
					result = strncasecmp(buff, prefix, strlen(prefix));
					if (result == 0){
						printf("%s", temp);
							}
						}
					}
				}


	if (f_flag == 0){
		char *text = calloc(1,1);
		while(fgets(buffer, 1000, stdin)){
			text = realloc(text, strlen(text)+1+strlen(buffer));
			if (!text)
				return 0;
			strcpy(text, buffer);
			aposRemoval(text);
			if (text == NULL){
				break;
				}
			result = strncasecmp(text, prefix, strlen(prefix));
			if (result == 0){
				printf("%s", text);
					}
				}
			}	
	
	fclose(fp);
	return 0;
	}




