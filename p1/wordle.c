#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (argc != 3) {
        printf ("wordle: invalid number of args\n");
        exit (1);
    }
    FILE *f = fopen (argv[1], "r");
    if (f == NULL) {
        printf ("wordle: cannot open file\n");
        exit (1);
    }
    char *hasnot = argv[2];
    char word [256];
    while (EOF != fscanf (f, "%s", word)) {
        int reject = 0;
        if (strlen (word) != 5) continue;
        for (int i = 0; i < strlen (hasnot); i++) 
            if (strchr (word, hasnot [i]) != NULL) {
                reject = 1;
                break;
            }
        if (reject) continue;
        printf ("%s\n", word);
    }
    fclose (f);

    return 0;
}
