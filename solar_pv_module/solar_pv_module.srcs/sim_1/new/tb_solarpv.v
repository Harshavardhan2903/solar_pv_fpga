`timescale 1ns / 1ps

module solar_pv_tb;

    // Declare testbench variables
    reg [5:0] temp;              // Temperature input (6-bit)
    reg [9:0] irradiance;        // Irradiance input (10-bit)
    wire [8:0] power;            // Power output (9-bit)
    wire [6:0] efficiency;       // Efficiency output (7-bit)

    // Instantiate the DUT (Device Under Test)
    solar_pv uut (
        .temp(temp),
        .irradiance(irradiance),
        .power(power),
        .efficiency(efficiency)
    );

    // Testbench logic
    initial begin
        // Test case 1: Standard conditions
        temp = 6'd25;           // Standard temperature
        irradiance = 10'd1000;  // Standard irradiance
        #10;                    // Wait 10 time units

        // Test case 2: Lower irradiance
        temp = 6'd25;           // Standard temperature
        irradiance = 10'd800;   // Lower irradiance
        #10;                    // Wait 10 time units

        // Test case 3: Higher temperature
        temp = 6'd35;           // Higher temperature
        irradiance = 10'd1000;  // Standard irradiance
        #10;                    // Wait 10 time units

        // Test case 4: Lower temperature
        temp = 6'd15;           // Lower temperature
        irradiance = 10'd900;   // Slightly lower irradiance
        #10;                    // Wait 10 time units

        // End simulation
        $finish;
    end

    // Monitor outputs for debugging
    initial begin
        $monitor("Time: %0d | Temp: %d | Irradiance: %d | Power: %d | Efficiency: %d", 
                 $time, temp, irradiance, power, efficiency);
    end

endmodule
