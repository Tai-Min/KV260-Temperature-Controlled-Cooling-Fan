`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 04:29:24
// Design Name: 
// Module Name: temp2pwm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module temp2pwm(
    input rdy,
    input [9:0] temp,
    output reg [7:0] pwm
    );
    
    // C deg * 100.
    parameter FAN_0_TEMP = 0000;
    parameter FAN_100_TEMP = 6500;
    
    // Linear eq params.
    parameter a = 255.0 / ((FAN_100_TEMP - FAN_0_TEMP) / 100);
    parameter b = -a * FAN_0_TEMP / 100;
    
    integer temp_deg = 'd0;
    integer desired_pwm = 0;
    
    always @ (posedge rdy) begin
        // Convert into C degrees * 100 using values from SYSMON4 
        // transfer function with use of internal reference.
        temp_deg = ((temp * 50931 / 1024) - 28023);
        
        desired_pwm = a * (temp_deg / 100) + b; // Compute desired PWM.
        desired_pwm = desired_pwm > 255 ? 255 : desired_pwm; // Upper saturation of desired PWM to 255.
        
        pwm = temp_deg <= FAN_0_TEMP ? 'd0 : desired_pwm; // Lower saturation of desired PWM to 0.
    end
endmodule
