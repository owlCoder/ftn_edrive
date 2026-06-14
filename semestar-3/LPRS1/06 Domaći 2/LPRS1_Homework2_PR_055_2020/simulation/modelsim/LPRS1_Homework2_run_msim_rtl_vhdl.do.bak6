transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Danijel/Desktop/LPRS1_Homework2_PR_055_2020/LPRS1_Homework2_PR_055_2020_Solution/lprs1_homework2.vhd}

vcom -93 -work work {C:/Users/Danijel/Desktop/LPRS1_Homework2_PR_055_2020/LPRS1_Homework2_PR_055_2020_Solution/lprs1_homework2_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  lprs1_homework2_tb

do C:/Users/Danijel/Desktop/LPRS1_Homework2_PR_055_2020/lprs1_homework2_tb_run.do
