`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 14:41:48
// Design Name: 
// Module Name: divider_tb
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


module divider_tb;
    // In.
    reg clk_in;
    reg rst;
    
    // Out.
    wire clk_out;
    
    divider uut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );
    
    integer k;
    initial begin
        clk_in = 'b0;
        
        // Reset signal.
        #10 rst = 'b1;
        #10 rst = 'b0;
        #10 rst = 'b1;
        
        // Signals without forced reset.
        for (k=0; k < 60000; k=k+1) begin
            #10 clk_in = ~clk_in;
        end
        
        // Signals with forced reset.
        clk_in = 'b0;
        rst = 'b0;
        for (k=0; k < 60000; k=k+1) begin
            #10 clk_in = ~clk_in;
        end
        
        #5 $finish;
    end
endmodule
