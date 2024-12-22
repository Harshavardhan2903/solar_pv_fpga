`timescale 1ns / 1ps

module solar_pv(
    input wire [5:0] temp,
    input wire [9:0] irradiance,
    output wire [8:0] power,
    output wire [6:0] efficiency
    );
    
parameter integer ppeak = 9'd300;
parameter integer stdirradiance = 10'd1000;
parameter integer tempcoeff = 4;
parameter integer stdtemp = 6'd25;



assign power  = ((ppeak*(irradiance/stdirradiance))-(tempcoeff*(temp-stdtemp)));

assign efficiency = (power*100)/ppeak;
   
    
    
endmodule
