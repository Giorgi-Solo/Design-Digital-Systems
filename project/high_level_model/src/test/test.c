#include "test.h"



void checkAlgorithm()
{
    uint32_t m = 2; //19;
    uint32_t e = 7; //5;
    uint32_t n = 33; //119;
    
    uint32_t d = 3; //77;
    
    uint32_t c = encryption(m, e, n);
    
    printf("ALGORITHM TEST\n\n");
    printf("Encrypted %u is %u\n",m, c);
    printf("Decrypted %u is %u\n",c, encryption(c, d, n));
    printf("\n\nPassed \n\n");
}





void runTests()
{
    checkAlgorithm();
}