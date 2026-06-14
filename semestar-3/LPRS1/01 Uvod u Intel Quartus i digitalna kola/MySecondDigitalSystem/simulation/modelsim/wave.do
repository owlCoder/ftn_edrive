onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /myseconddigitalsystem_tb/sX0
add wave -noupdate /myseconddigitalsystem_tb/sX1
add wave -noupdate /myseconddigitalsystem_tb/sX2
add wave -noupdate /myseconddigitalsystem_tb/sY0
add wave -noupdate /myseconddigitalsystem_tb/sY1
add wave -noupdate /myseconddigitalsystem_tb/sY2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 190
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1366050 ps}
