onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lprs1_homework1_tb/uut/i_x
add wave -noupdate /lprs1_homework1_tb/uut/i_y
add wave -noupdate /lprs1_homework1_tb/uut/i_z
add wave -noupdate /lprs1_homework1_tb/uut/i_sel
add wave -noupdate /lprs1_homework1_tb/uut/o_res
add wave -noupdate /lprs1_homework1_tb/uut/o_cmp
add wave -noupdate /lprs1_homework1_tb/uut/o_enc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3000000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 407
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 us}
