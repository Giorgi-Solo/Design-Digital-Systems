/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include "RSA.h"
#include <stdint.h>
int main()
{
    uint32_t m = 2; //19;
    uint32_t e = 7; //5;
    uint32_t n = 33; //119;
    
    uint32_t d = 3; //77;
    
    uint32_t c = encryption(m, e, n);
    
    printf("Encrypted %u is %u\n",m, c);
    printf("Decrypted %u is %u\n",c, encryption(c, d, n));

    return 0;
}
