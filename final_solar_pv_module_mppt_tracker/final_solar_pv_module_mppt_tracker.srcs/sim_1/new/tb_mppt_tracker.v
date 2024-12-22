`timescale 1ns / 1ps

module tb_mppt_tracker;

    // Testbench signals
    reg clk;
    reg reset;
    reg [8:0] voltage;
    reg [8:0] current;
    wire [7:0] duty_cycle;

    // Clock generation
    always #5 clk = ~clk;
    
    // Instantiate the DUT (Device Under Test)
    top dut (
        .clk(clk),
        .reset(reset),
        .voltage(voltage),
        .current(current),
        .duty_cycle(duty_cycle)
    );

     // 10 ns clock period

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        voltage = 9'd0;
        current = 9'd0;

        // Apply reset
        #20 reset = 0;

        // Test case 1: Increasing power
        #10 voltage = 9'd20; current = 9'd10; // P = 200
        #10 voltage = 9'd25; current = 9'd10; // P = 250
        #10 voltage = 9'd30; current = 9'd10; // P = 300

        // Test case 2: Decreasing power
        #10 voltage = 9'd28; current = 9'd10; // P = 280
        #10 voltage = 9'd32; current = 9'd1; // P = 250

        // Test case 3: Fluctuating power
        #10 voltage = 9'd26; current = 9'd11; // P = 286
        #10 voltage = 9'd27; current = 9'd12; // P = 324

        // End simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0dns, Voltage: %d, Current: %d, Duty Cycle: %d", $time, voltage, current, duty_cycle);
    end

endmodule