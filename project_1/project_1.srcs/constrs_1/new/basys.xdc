
set_property PACKAGE_PIN W5 [get_ports clk]  
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


set_property PACKAGE_PIN U16 [get_ports {state[0]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {state[0]}]

set_property PACKAGE_PIN E19 [get_ports {state[1]}]  
set_property IOSTANDARD LVCMOS33 [get_ports {state[1]}]
