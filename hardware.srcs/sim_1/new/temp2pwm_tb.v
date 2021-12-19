`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 15:45:46
// Design Name: 
// Module Name: temp2pwm_tb
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


module temp2pwm_tb;
    // In.
    reg rdy;
    reg [9:0] temp;
    
    // Out.
    wire [7:0] pwm;
    
    temp2pwm uut(
        .rdy(rdy),
        .temp(temp),
        .pwm(pwm)
    );
    
    integer signed temp_deg = -15;
    
    initial begin
        #5 rdy = 'b0;
        
        while (temp_deg < 80) begin
            #10 temp = (temp_deg + 280.23087870) * 1024 / 509.3140064;
            #1 rdy = 'b1;
            #1 rdy = 'b0;
            temp_deg = temp_deg + 5;
        end
    
        #5 $finish;
    end
endmodule
