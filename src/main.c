#include <stdbool.h>
#include <stdio.h>

#include "parsexec.h"

static char input[100] = "look around";

static bool getInput(void) {
    printf("\n--> ");
    return fgets(input, sizeof input, stdin) != NULL;
}

int main() {

    printf("~*~*~* Welcome to Underland *~*~*~\n");
    while (parseAndExecute(input) && getInput())
        ;
    printf("\nOk bye!\n");

    return 0;
}
