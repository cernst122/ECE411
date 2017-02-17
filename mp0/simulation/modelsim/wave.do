onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 /mp0_tb/clk
add wave -noupdate -height 15 /mp0_tb/dut/data_path/pc/out
add wave -noupdate -height 15 /mp0_tb/mem_address
add wave -noupdate -height 15 /mp0_tb/mem_read
add wave -noupdate -height 15 /mp0_tb/mem_rdata
add wave -noupdate -height 15 /mp0_tb/mem_write
add wave -noupdate -height 15 /mp0_tb/mem_byte_enable
add wave -noupdate -height 15 /mp0_tb/mem_wdata
add wave -noupdate -height 15 -expand -subitemconfig {{/mp0_tb/dut/data_path/rfile/data[7]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[6]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[5]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[4]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[3]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[2]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[1]} {-height 15} {/mp0_tb/dut/data_path/rfile/data[0]} {-height 15}} /mp0_tb/dut/data_path/rfile/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 234
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
WaveRestoreZoom {199050 ps} {199531 ps}
