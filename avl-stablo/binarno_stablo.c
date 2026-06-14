#include "modules/main_thread/main_thread.h"

int main(int argc, char **argn)
{   
    STABLO *koren, *avl_koren;

    main_thread__stdin_check(argc);    
    main_thread__data_load(argc, argn, &koren, &avl_koren);
    main_thread__stdout_print(koren, avl_koren);
    main_thread__clean_up(&koren, &avl_koren);

    return 0;
}
