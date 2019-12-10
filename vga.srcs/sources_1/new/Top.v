`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2019 02:57:30 PM
// Design Name: 
// Module Name: Top
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


module Top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
   
  

    // VGA connections
    output reg [2:0] pixelR,
    output reg [2:0] pixelG,
    output reg [2:0] pixelB,
    output hsync_out,
    output vsync_out
    );

wire clk_147;
wire rst = rst_n; // make reset active high
wire inDisplayArea;
wire [9:0] CounterX;
wire [8:0] CounterY;
wire [3:0] selector;

clk_147MHz clk_video(
  .clk_in1(clk),
  .clk_out1(clk_147),
  .reset(rst)
);

hvsync_generator_1680x1050 hvsync(
  .clk(clk_147),
  .vga_h_sync(hsync_out),
  .vga_v_sync(vsync_out),
  .CounterX(CounterX),
  .CounterY(CounterY),
  .inDisplayArea(inDisplayArea)
);





// use this bits from CounterX to divide the
// horizontal screen in strips 64 bytes wide
assign selector = CounterX[9:6];

always @(posedge clk_147)
begin
  if (inDisplayArea) begin
      /*
       * I don't know if there is a smarter way to assign
       * only one color for strip.
       *
       * Maybe using the selector signal as index?
       */
      pixelR[2] <= selector == 4'b0000;
      pixelR[1] <= selector == 4'b0001;
      pixelR[0] <= selector == 4'b0010;
      pixelG[2] <= selector == 4'b0011;
      pixelG[1] <= selector == 4'b0100;
      pixelG[0] <= selector == 4'b0101;
      pixelB[2] <= selector == 4'b0110;
      pixelB[1] <= selector == 4'b0111;
      pixelB[0] <= selector == 4'b1000;
  end
  else begin// if it's not to display, go dark
      pixelR <= 3'b000;
      pixelG <= 3'b000;
      pixelB <= 3'b000;
  end
end

endmodule