onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/reset
add wave -noupdate /testbench/left
add wave -noupdate /testbench/right
add wave -noupdate /testbench/la
add wave -noupdate /testbench/lb
add wave -noupdate /testbench/lc
add wave -noupdate /testbench/ra
add wave -noupdate /testbench/rb
add wave -noupdate /testbench/rc
add wave -noupdate /testbench/expected
add wave -noupdate /testbench/vectornum
add wave -noupdate /testbench/errors
add wave -noupdate /testbench/testvectors
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {266 ps} 0}
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
WaveRestoreZoom {0 ps} {312 ps}
