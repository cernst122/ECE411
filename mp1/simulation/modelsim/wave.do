onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /mp1_tb/clk -radix hex
add wave -noupdate /mp1_tb/dut/data_path/pc/out -radix hex
add wave -noupdate -color Gold /mp1_tb/mem_address -radix hex
add wave -noupdate /mp1_tb/mem_read -radix hex
add wave -noupdate /mp1_tb/mem_rdata -radix hex
add wave -noupdate /mp1_tb/mem_write -radix hex
add wave -noupdate /mp1_tb/mem_byte_enable -radix hex
add wave -noupdate /mp1_tb/mem_wdata -radix hex
add wave -noupdate -expand -subitemconfig {{/mp1_tb/dut/data_path/rfile/data[7]} {-color Blue -height 15} {/mp1_tb/dut/data_path/rfile/data[6]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[5]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[4]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[3]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[2]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[1]} {-height 15} {/mp1_tb/dut/data_path/rfile/data[0]} {-height 15}} /mp1_tb/dut/data_path/rfile/data -radix hex
add wave -noupdate /mp1_tb/dut/opcode -radix hex
add wave -noupdate /mp1_tb/dut/data_path/mdr_out -radix hex
add wave -noupdate /mp1_tb/dut/data_path/mar/data -radix hex
add wave -noupdate /mp1_tb/dut/control_unit/next_state -radix hex
add wave -noupdate /mp1_tb/mem_resp -radix hex
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1011415 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {830341 ps} {1486591 ps}
restart -f
run 10000ns
