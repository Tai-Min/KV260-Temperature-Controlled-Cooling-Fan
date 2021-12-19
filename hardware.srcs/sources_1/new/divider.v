`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 04:59:17
// Design Name: 
// Module Name: divider
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


module divider(
    input clk_in,
    input rst,
    output reg clk_out
    );
    
    integer counter = 'd0;
    
    always @ (posedge clk_in, negedge rst) begin
        // Reset pulled low so keep initial state.
        if (rst == 'b0) begin
            counter <= 'd0;
            clk_out <= 'b0;
        end
        
        else begin
            counter <= (counter + 'd1) % 'd100000; // 200MHz to 2kHz.
            clk_out <= !counter ? ~clk_out : clk_out;
        end
    end
endmodule
