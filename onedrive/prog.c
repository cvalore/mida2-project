#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char** argv) {
	if(argc < 2) {
		printf("Inserire stringa da convertire\n");
		return -1;
	}

	int len = strlen(argv[1]);
	char* converted = malloc(len + 1);

	int i = 0;
	for(i = 0; i < len; i++) {
		if(argv[1][i] != ' ' && (argv[1][i] < '0' || argv[1][i] > '9') && argv[1][i] != '-' && argv[1][i] != '_') {
			if(!islower(argv[1][i])) {
				converted[i] = tolower(argv[1][i]);
			}
			else {
				converted[i] = argv[1][i];
			}
		}

		else if(argv[1][i] == ' ') {
			converted[i] = '-';
		}

		else {
			converted[i] = argv[1][i];	
		}
	}

	printf("%s\n", converted);

	free(converted);
}
