## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]  ## Map 'clk' to the 100 MHz onboard clock
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## LEDs (connected to the 2-bit counter output)
set_property PACKAGE_PIN U16 [get_ports {state[0]}]  ## LED 0 for LSB
set_property IOSTANDARD LVCMOS33 [get_ports {state[0]}]

set_property PACKAGE_PIN E19 [get_ports {state[1]}]  ## LED 1 for MSB
set_property IOSTANDARD LVCMOS33 [get_ports {state[1]}]
