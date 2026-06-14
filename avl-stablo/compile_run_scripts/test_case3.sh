#!/bin/sh

printf "Унос бројева нпр. 1 2 3\n>> "
IFS=" "
read n1 n2 n3 n4 n5 n6 n7 n8 n9
echo "$n1 $n2 $n3 $n4 $n5 $n6 $n7 $n8 $n9"


DIR="/usr/bin/gcc"
clear
if [ -f "$DIR" ]
then
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ gcc постоји path: ${DIR}\n"
  sleep 1
  tput bold;
  tput setaf 2;
  printf "\nuser"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  tput bold;
  printf "$ Компилација 'binary_tree' модула\n"
  sleep 1;
  tput sgr0;
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ gcc modules/binary_tree/binary_tree.h modules/binary_tree/binary_tree.c "
  sleep 2
  # avl_tree moduli
  tput bold;
  tput setaf 2;
  printf "\n\nuser"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  tput bold;
  printf "$ Компилација 'avl_tree' модула\n"
  sleep 1;
  tput sgr0;
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ gcc modules/avl_tree/avl_tree.h modules/avl_tree/avl_tree.c "
  sleep 2
  # main thread modul
   # glavni program
  tput bold;
  tput setaf 2;
  printf "\n\nuser"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  tput bold;
  printf "$ Компилација 'main_thread' модула\n"
  sleep 1;
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ gcc modules/main_thread/main_thread.h modules/main_thread/main_thread.c "
  sleep 2
  # glavni program
  tput bold;
  tput setaf 2;
  printf "\n\nuser"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  tput bold;
  printf "$ Компилација 'главног' програма\n"
  sleep 1;
  tput sgr0;
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ gcc binarno_stablo.c "
  sleep 2
  ## pokretanja programa
  tput bold;
  tput setaf 2;
  printf "\n\nuser"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ ./balansirano_binarno_stablo $n1 $n2 $n3 $n4 $n5 $n6 $n7 $n8 $n9\n"
  tput bold;
  tput setaf 2;
  printf "user"
  printf "@"
  printf "linuxhost"
  tput sgr0;
  tput bold;
  printf ":"
  tput bold;
  tput setaf 4;
  printf "~"
  tput sgr0;
  printf "$ Покретање програма" 
  sleep 0.5 
  printf "." 
  sleep 0.5 
  printf "." 
  sleep 0.5 
  printf "."
  sleep 0.5 
  printf "."
  sleep 0.5 
  printf "."
  sleep 0.5 
  printf "."
  mkdir complied;
  clear
gcc -o complied/balansirano_binarno_stablo_c3 binarno_stablo.c modules/binary_tree/binary_tree.h modules/binary_tree/binary_tree.c modules/avl_tree/avl_tree.h modules/avl_tree/avl_tree.c modules/main_thread/main_thread.h modules/main_thread/main_thread.c && ./complied/balansirano_binarno_stablo_c3 $n1 $n2 $n3 $n4 $n5 $n6 $n7 $n8 $n9
  printf "\n\n"
else
    tput bold;
    echo -e "\n\t\t\tgcc није инсталиран на овом рачунару!" 
    echo -e "\t\t\ttry: sudo apt install gcc -y\n"
fi
