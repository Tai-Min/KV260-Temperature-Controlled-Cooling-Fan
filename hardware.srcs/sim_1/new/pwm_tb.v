`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 16:25:47
// Design Name: PWM testbench
// Module Name: pwm_tb
// Project Name: PWM testbench
// Target Devices: KV260
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


module pwm_tb;
    // In.
    reg clk;
    reg [7:0] fill;
    reg rst;
    
    // Out.
    wire state;
    
    pwm uut (
        .clk(clk),
        .fill(fill),
        .rst(rst),
        .state(state)
    );
    
    integer k = 'd0;
    
    initial begin
        clk = 'b0;
        
        #10 rst = 'b0;
        #10 rst = 'b1;
        
        #10 fill = 'd0;
        for(k=0;k<1000;k=k+1) begin
            #10 clk = ~clk;
        end
        
        #10 fill = 'd64;
        for(k=0;k<1000;k=k+1) begin
            #10 clk = ~clk;
        end
        
        #10 fill = 'd128;
        for(k=0;k<1000;k=k+1) begin
            #10 clk = ~clk;
        end
        
        #10 rst = 'b0;
        #10 fill = 'd128;
        for(k=0;k<1000;k=k+1) begin
            #10 clk = ~clk;
        end
        
        #10 rst = 'b1;
        #10 fill = 'd255;
        for(k=0;k<1000;k=k+1) begin
            #10 clk = ~clk;
        end
        
        #10 $finish;
    end
endmodule
