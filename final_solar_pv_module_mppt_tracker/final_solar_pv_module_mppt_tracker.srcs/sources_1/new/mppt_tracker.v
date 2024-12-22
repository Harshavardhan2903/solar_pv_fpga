`timescale 1ns / 1ps

module clock_divider(
    input wire clk_in,      // 100 MHz clock input
    input wire reset,       // Reset signal
    output reg clk_out      // 5-second clock output
    );

    reg [31:0] counter;     // Counter for clock division

    // Parameter to calculate the number of clock cycles for a 5-second period
    parameter DIVIDE_BY = 32'd250_000_000; // (100 MHz * 5 seconds) = 500 million cycles

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 32'd0;
            clk_out <= 1'b0;
        end else begin
            if (counter == DIVIDE_BY - 1) begin
                counter <= 32'd0;
                clk_out <= ~clk_out; // Toggle the clock output
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule



module top(
    input wire clk,                   // Onboard 100 MHz clock
    input wire reset,                 // Reset signal
    input wire [7:0] voltage,         // Voltage input (V)
    input wire [6:0] current,         // Current input (I             // Slow clock (5-second period)
    output wire [7:0] duty_cycle      // Duty cycle output from MPPT
    );
    
    wire slow_clk;
    // Instantiate the clock divider
    clock_divider #( 
        .DIVIDE_BY(32'd500_000_000) // Divide by 100 MHz * 5 seconds = 500 million
    ) clk_div (
        .clk_in(clk),                // 100 MHz clock input
        .reset(reset),               // Reset signal
        .clk_out(slow_clk)           // 5-second clock output
    );

    // Instantiate the MPPT tracker
    mppt_tracker tracker (
        .clk(slow_clk),              // Use the 5-second clock as input
        .reset(reset),               // Reset signal
        .voltage(voltage),           // Voltage input
        .current(current),           // Current input
        .duty_cycle(duty_cycle)      // Duty cycle output
    );

endmodule





module mppt_tracker(
    input wire clk,                  // System clock
    input wire reset,                // Reset signal
    input wire [7:0] voltage,        // Voltage input (V)
    input wire [6:0] current,        // Current input (I)
    output reg [7:0] duty_cycle      // PWM duty cycle output
    );

    // Internal registers
    reg [17:0] power;                // Current power
    reg [17:0] prev_power;           // Previous power
    reg [8:0] prev_voltage;          // Previous voltage
    reg signed [17:0] delta_power;   // Change in power (dP)
    reg signed [8:0] delta_voltage;  // Change in voltage (dV)

    parameter signed DELTA_D = 8'd1; // Step size for duty cycle adjustment

    always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset all variables
        power = 18'd0;
        prev_power = 18'd0;
        prev_voltage = 9'd0;
        duty_cycle = 8'd128; // Start with 50% duty cycle
    end 
    else begin
        // Calculate current power
        power = voltage * current;

        // Calculate changes in power and voltage
        delta_power = power - prev_power;
        delta_voltage = voltage - prev_voltage;

        // Apply P&O logic
        if (delta_power > 0) begin
            if (delta_voltage < 0) begin
                // Increase duty cycle
                duty_cycle = (duty_cycle + DELTA_D <= 8'd255) ? duty_cycle + DELTA_D : 8'd255;
            end else if (delta_voltage > 0) begin
                // Decrease duty cycle
                duty_cycle = (duty_cycle >= DELTA_D) ? duty_cycle - DELTA_D : 8'd0;
            end
        end else if (delta_power < 0) begin
            if (delta_voltage < 0) begin
                // Decrease duty cycle
                duty_cycle = (duty_cycle >= DELTA_D) ? duty_cycle - DELTA_D : 8'd0;
            end else if (delta_voltage > 0) begin
                // Increase duty cycle
                duty_cycle = (duty_cycle + DELTA_D <= 8'd255) ? duty_cycle + DELTA_D : 8'd255;
            end
        end
        // If delta_power == 0, keep the duty_cycle constant

        // Update previous values
        prev_power = power;
        prev_voltage = voltage;
    end
end


endmodule