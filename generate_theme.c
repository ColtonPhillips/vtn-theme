#include<stdio.h>
#include <time.h>
#include <stdlib.h>

#define LINE_BUFFER 100

int count_lines( char * filename) 
{
    char line[LINE_BUFFER];
    int lineCount = 0;
    FILE * file = fopen(filename, "r");
    if (file == NULL) perror ("Error opening file");
    else 
    {
        while (fgets(line, LINE_BUFFER, file) != NULL)
        {
            lineCount++;
        }
        fclose(file);
    }
    return lineCount;
}

void get_line(char * filename, int i, char * word) {
    char line[LINE_BUFFER];
    FILE * file = fopen(filename, "r");
    if (file == NULL) perror ("Error opening file");
    else 
    {
        int c = 0;
        while (fgets(line, LINE_BUFFER, file) != NULL)
        {
            if (c == i) break;
            c++;
        }
    }
    // remove newline
    int len = strlen(line);
    if( line[len-1] == '\n' )
        line[len-1] = 0;
    strcpy(word, line);
}
void title(char *str) 
{
    if (str[0] >= 'a' && str[0] < 'z')
    {
        str[0]= str[0] - 32;
    }
}
main()
{
    int verbCount = count_lines("verbs.txt");
    int nounCount = count_lines("nouns.txt");

    srand(time(NULL));

    int i; int vI; int nI;
    char verb[LINE_BUFFER];
    char noun[LINE_BUFFER];
    for (i = 0; i < 100; ++i)
    {
        vI = rand() % verbCount;
        nI = rand() % nounCount;
        get_line("verbs.txt", vI, verb);
        get_line("nouns.txt", nI, noun);
        title(verb); title(noun);
        printf("%s the %s\n", verb, noun);

    }
}
