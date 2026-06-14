onerror {resume}
quietly WaveActivateNextPane {} 0
set tb_name [lindex [find instance /lprs1*] 1]
add wave -noupdate -radix unsigned $tb_name/*
add wave -noupdate $tb_name/uut/s_base
add wave -noupdate $tb_name/uut/s_state
add wave -noupdate $tb_name/uut/s_en*
add wave -noupdate $tb_name/uut/s_cnt_subseq*
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1000000 ps} 0}
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
WaveRestoreZoom {0 ps} {2 us}
