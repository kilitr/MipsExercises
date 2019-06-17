 
#include <stdio.h>
#include <string.h>

/* Die Routine soll in einem C-String an der Adresse str alle
 * Grossbuchstaben in Kleinbuchstaben verwandeln.
 */
void strtolower(char *str)
{
    printf("vorher: %s\n", str);
    int i = 0;
    while(str[i] != '\0') {
        if(str[i] >= 'A' && str[i] <= 'Z') {
            str[i] = str[i] + ('a' - 'A');
        }
        i = i + 1;
    }
    printf("nachher: %s\n", str);
}


/* Die Routine soll in einem C-String an der Adresse str die Reihenfolge
 * der Zeichen umkehren.
 */
void strturnaround(char *str)
{
    printf("vorher: %s\n", str);
    
    
    int i, rpos;
    char temp;
    
    int length = 0;
    while(str[length] != '\0') {
        length++;
    }
    i = length / 2;
    length = length - 1;
    for(i; i >= 0; i--) {
        rpos = length-i;
        temp = str[i];
        str[i] = str[rpos];
        str[rpos] = temp;
    }
    
    printf("nachher: %s\n", str);
}

/* Die Routine soll prüfen, ob der C-String an der Adresse str ein Palindrom
 * ist. Wenn ja soll der Wert 1, sonst der Wert 0 zurückgegeben werden.
 */
void strispalindrom(char *str)
{
    int begin, middle, end, length = 0;
    while(str[length] != '\0')
        length++;
    
    end = length - 1;
    middle = length / 2;
    
    for(begin = 0; begin < middle; begin++) {
        if(str[begin] != str[end]) {
            printf("Not a palindrome.\n");
            break;
        }
        end--;
    }
    if(begin == middle)
        printf("Palindrome.\n");
}

int main(int argc, char *argv[])
{
    char str1[6] = "Lager";
    str1[5] = '\0';
    strtolower(str1);
    strturnaround(str1);
    strispalindrom(str1);
    return 0;
}
