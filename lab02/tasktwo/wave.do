onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/W
add wave -noupdate /testbench/S
add wave -noupdate /testbench/A
add wave -noupdate /testbench/D
add wave -noupdate /testbench/WIN
add wave -noupdate /testbench/DIE
add wave -noupdate /testbench/WIN_exp
add wave -noupdate /testbench/DIE_exp
add wave -noupdate /testbench/expected
add wave -noupdate /testbench/vectornum
add wave -noupdate /testbench/errors
add wave -noupdate /testbench/testvectors
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/W
add wave -noupdate /testbench/S
add wave -noupdate /testbench/A
add wave -noupdate /testbench/D
add wave -noupdate /testbench/WIN
add wave -noupdate /testbench/DIE
add wave -noupdate /testbench/WIN_exp
add wave -noupdate /testbench/DIE_exp
add wave -noupdate /testbench/expected
add wave -noupdate /testbench/vectornum
add wave -noupdate /testbench/errors
add wave -noupdate /testbench/testvectors
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {204 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {3 ps} {63 ps}
