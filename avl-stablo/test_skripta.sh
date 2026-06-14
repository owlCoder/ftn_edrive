#!/bin/sh

clear
tput bold;
printf "\n\n\t\tУспешно сте покренули аутомазизовану скрипту\n\t\tза тестирање програма balansirano_binarno_stablo\n"
printf "\n\t\tКако би тестирали програм имате могућност\n\t\tда одаберете неке од следећих опција:\n"
printf "\n\t\t1 - Тест подаци за проверу програма (тип 1): \n\t\t(5, 10, -6, 12, 4, 2, 14, 65, 565, 154, 6564)\n"
printf "\n\t\t2 - Тест подаци за проверу програма (тип 2): \n\t\t(4, 656, 2, 14, 65, 6)\n"
printf "\n\t\t3 - Тест подаци за проверу програма (тип 3): \n\t\t(Тест податке уносите ви)\n"
printf "\n\t\t4 - Тест подаци за проверу програма (тип 4): \n\t\t(Адаптирани тест подаци)\n"
printf "\n\t\t5 - Излаз из аутоматизоване скрипте\n"

printf "\n\t\tОдабир опције\n\t\t>> "
read -r b

clear
option="${b}" 
case ${option} in 
    1)  chmod +x compile_run_scripts/test_case1.sh
        sh ./compile_run_scripts/test_case1.sh
        ;;
    2)  chmod +x compile_run_scripts/test_case2.sh
        sh ./compile_run_scripts/test_case2.sh
        ;;
    3)  chmod +x compile_run_scripts/test_case3.sh
        sh ./compile_run_scripts/test_case3.sh
        ;;
    4)  chmod +x compile_run_scripts/test_case4.sh
        sh ./compile_run_scripts/test_case4.sh
        ;;
    5)  printf "\n\t\t\tХвала на коришћењу скрипте и програма!\n\t\t\tНапуштање програма....\n\n"
        ;;
   *) printf "\n\t\t\tОдабрана опција није валидна!\n\t\t\tНапуштање програма....\n\n"
      exit 1 
esac 
