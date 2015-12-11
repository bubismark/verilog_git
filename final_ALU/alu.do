vlib work
vlog -sv -work work alu_tb.v alu_8.v full_alu.v
vsim work.alu_tb

noview wave*
add wave sim:/alu_tb/*

wave zoom full