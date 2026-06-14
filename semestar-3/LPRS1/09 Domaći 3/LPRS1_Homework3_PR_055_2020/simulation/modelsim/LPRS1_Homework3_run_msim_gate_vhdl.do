transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {LPRS1_Homework3.vho}

vcom -93 -work work {C:/Users/Danijel/Desktop/LPRS1_Homework3_PR_055_2020/LPRS1_Homework3_PR_055_2020_Solution/lprs1_homework3_tb.vhd}

vsim -t 1ps -L altera -L altera_lnsim -L fiftyfivenm -L gate_work -L work -voptargs="+acc"  lprs1_homework3_tb

do C:/Users/Danijel/Desktop/LPRS1_Homework3_PR_055_2020/lprs1_homework3_tb_run.do
