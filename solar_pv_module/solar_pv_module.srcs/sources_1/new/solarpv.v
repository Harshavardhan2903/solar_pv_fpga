`timescale 1ns / 1ps

module solar_pv(
    input wire [5:0] temp,           // Temperature input (6-bit)
    input wire [9:0] irradiance,     // Irradiance input (10-bit)
    output reg [8:0] power,          // Power output (9-bit)
    output reg [6:0] efficiency      // Efficiency output (7-bit)
    );

    // Parameters
    parameter integer P_PEAK = 300;        // Peak power (300W)
    parameter integer STD_IRRADIANCE = 1000; // Standard irradiance
    parameter integer TEMP_COEFF = 4;      // Temperature coefficient (scaled)
    parameter integer STD_TEMP = 25;       // Standard temperature

    // Internal variables
    wire signed [17:0] irradiance_effect;   // Signed irradiance contribution
    wire signed [17:0] temp_adjust;         // Signed temperature adjustment
    wire signed [17:0] calculated_power;    // Final signed power calculation

    // Cast inputs to signed for arithmetic
    wire signed [9:0] signed_temp = temp;
    wire signed [17:0] signed_irradiance = irradiance;

    // Calculate irradiance contribution
    assign irradiance_effect = (P_PEAK * signed_irradiance) / STD_IRRADIANCE;

    // Calculate temperature adjustment
    assign temp_adjust = (TEMP_COEFF * (signed_temp - STD_TEMP) * P_PEAK) / 1000;

    // Final signed power calculation
    assign calculated_power = irradiance_effect - temp_adjust;

    always @(*) begin
        // Clip power to prevent negative values
        if (calculated_power < 0)
            power = 9'd0;  // Minimum limit
        else if (calculated_power > 511)
            power = 9'd511; // Maximum limit
        else
            power = calculated_power[8:0];  // Assign valid power

        // Calculate efficiency (scaled to percentage)
        if (power > 0)
            efficiency = (power * 100) / P_PEAK;
        else
            efficiency = 7'd0;
    end

endmodule
