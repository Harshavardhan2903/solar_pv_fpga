
set_property PACKAGE_PIN W5 [get_ports clk]  
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

##input reset


## Input: current (7-bit input)
set_property PACKAGE_PIN R2 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN T1 [get_ports {current[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[0]}]
set_property PACKAGE_PIN U1 [get_ports {current[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[1]}]
set_property PACKAGE_PIN W2 [get_ports {current[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[2]}]
set_property PACKAGE_PIN R3 [get_ports {current[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[3]}]
set_property PACKAGE_PIN T2 [get_ports {current[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[4]}]
set_property PACKAGE_PIN T3 [get_ports {current[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[5]}]
set_property PACKAGE_PIN V2 [get_ports {current[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {current[6]}]


## Input: voltage (8-bit input)
set_property PACKAGE_PIN W13 [get_ports {voltage[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[0]}]
set_property PACKAGE_PIN W14 [get_ports {voltage[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[1]}]
set_property PACKAGE_PIN V15 [get_ports {voltage[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[2]}]
set_property PACKAGE_PIN W15 [get_ports {voltage[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[3]}]
set_property PACKAGE_PIN W17 [get_ports {voltage[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[4]}]
set_property PACKAGE_PIN W16 [get_ports {voltage[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[5]}]
set_property PACKAGE_PIN V16 [get_ports {voltage[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[6]}]
set_property PACKAGE_PIN V17 [get_ports {voltage[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {voltage[7]}]


##output : pwm signal duty cycle (8 bit output)

## Output: Power (9-bit output)
set_property PACKAGE_PIN L1 [get_ports {duty_cycle[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[0]}]
set_property PACKAGE_PIN P1 [get_ports {duty_cycle[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[1]}]
set_property PACKAGE_PIN N3 [get_ports {duty_cycle[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[2]}]
set_property PACKAGE_PIN P3 [get_ports {duty_cycle[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[3]}]
set_property PACKAGE_PIN U3 [get_ports {duty_cycle[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[4]}]
set_property PACKAGE_PIN W3 [get_ports {duty_cycle[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[5]}]
set_property PACKAGE_PIN V3 [get_ports {duty_cycle[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[6]}]
set_property PACKAGE_PIN V13 [get_ports {duty_cycle[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[7]}]


