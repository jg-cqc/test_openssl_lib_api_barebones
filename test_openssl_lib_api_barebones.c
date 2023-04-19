
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <openssl/engine.h>
#include <openssl/err.h>
#include <openssl/rand.h>
#include <openssl/randerr.h>

int main(int argc, char *argv[])
{
    int rc = 0;
    ENGINE *pEngine = NULL;
    unsigned char buffer[64];

    //////////////////////////
    // Initialise OpenSSL
    //////////////////////////
    ENGINE_load_builtin_engines(); // Returns void

    rc = ENGINE_register_all_complete();
    if (rc != 1)
    {
        fprintf(stderr, "ERROR: Failed to registration engines (err=0x%lx)\n", ERR_get_error());
        return -1;
    }

    pEngine = ENGINE_by_id("qorand_engine");
    if (pEngine == NULL)
    {
        fprintf(stderr, "ERROR: Failed to find qorand_engine (err=0x%lx)\n", ERR_get_error());
        return -1;
    }

    rc = ENGINE_init(pEngine);
    if (rc == 0)
    {
        fprintf(stderr, "ERROR: Failed to initialise engines (err=0x%lx)\n", ERR_get_error());
        return -1;
    }

    rc = ENGINE_set_default(pEngine, ENGINE_METHOD_RAND);
    if (rc == 0)
    {
        fprintf(stderr, "ERROR: Failed to set the default engine (err=0x%lx)\n", ERR_get_error());
        return -1;
    }

    //////////////////////////
    // Exercise the engine
    //////////////////////////
    rc = RAND_bytes(buffer, sizeof(buffer));
    if (rc != 0 && rc != 1)
    {
        fprintf(stderr, "ERROR: Failed to retrieve randomness (err=0x%lx)\n", ERR_get_error());
        return -1;
    }

    // Print the results
    printf("Randomness received [%lu bytes]: ", sizeof(buffer));
    for (int ii = 0; ii < sizeof(buffer); ii++) { printf("%2.2X", buffer[ii]); }
    printf("\n");

    //////////////////////////
    // Cleanup
    //////////////////////////
    ENGINE_finish(pEngine);
    ENGINE_free(pEngine);
    ENGINE_cleanup();
    RAND_cleanup();  // Good hygiene

    return 0;
}
