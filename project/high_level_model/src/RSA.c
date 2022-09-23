
#include "RSA.h"

uint32_t encryption(uint32_t M, uint32_t e, uint32_t n)
{
    uint32_t c = 1;
    uint32_t p = M;
    uint32_t i = 0;
    uint32_t k = 32;
    uint32_t j = 1;
    for(i = 0; i < k - 1; ++i){
        if(e & j)
        {
            c = squareMod(c,p,n); //c * p;
            
        }
        
        p = squareMod(p, p, n);
        j = j*2;
    }

    return c;
}

uint32_t squareMod(uint32_t a, uint32_t b, uint32_t n)
{
    uint32_t r = 0;
    uint32_t i = 0;
    uint32_t k = 32;
    uint32_t j = 1;
    j = j << 31;
    

    for(i = 0; i < k; ++i)
    {
        r = (a & j) ? 2*r + b : 2*r; 

        if(r >= n) // TODO 1 : maybe better way
            r -= n;
            if(r >= n)
                r -= n;

        j = j/2;
    }

    return r;

}