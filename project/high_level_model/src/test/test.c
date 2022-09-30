#include "test.h"



int checkAlgorithm()
{
    uint32_t m = 2; //19;
    uint32_t e = 7; //5;
    uint32_t n = 33; //119;
    
    uint32_t d = 3; //77;
    
    uint32_t c = encryption(m, e, n);

    printf("---------------------------------------------------------------------------------\n");
    printf("ALGORITHM TEST\n\n");
    printf("Encrypted %u is %u\n",m, c);
    printf("Decrypted %u is %u\n",c, encryption(c, d, n));
    printf("\nPassed \n");
    printf("---------------------------------------------------------------------------------\n\n");

    return 0;
}

int checkModularMult()
{
    printf("---------------------------------------------------------------------------------\n");
    printf("ALGORITHM MODULAR MULTIPLICATION\n\n");

    uint32_t a = 2; //19;
    uint32_t b = 7; //5;
    uint32_t n = 33; //119;
    int retVal = 0;

    uint32_t result = squareMod(a,b,n);
    printf("(%u * %u) mod %u = %u\n",a,b,n,result);
    if(result == ((a*b)%n))
    {
        printf("\nPassed \n");
        retVal = 0;
    }
    else
    {
        printf("\nNot Passed \n");
        retVal = 1;
    }    
    printf("---------------------------------------------------------------------------------\n\n");

    return retVal;

}





void runTests()
{
    int i = 0;
    i += checkAlgorithm();
    i += checkModularMult();

    if(i == 0)
        printf("All Tests Passed\n");
    else
        printf("%d Tests Failed\n", i);
}