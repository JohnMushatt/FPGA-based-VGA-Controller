`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2019 02:56:10 PM
// Design Name: 
// Module Name: hvsync_generator
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


module hvsync_generator_1680x1050(
    input clk,
    output vga_h_sync,
    output vga_v_sync,
    output reg inDisplayArea,
    output reg [11:0] CounterX,
    output reg [10:0] CounterY
  );
    //Horizontal and Veritcal flags
    reg vga_HS, vga_VS;
    //X position counter
    wire CounterXmaxed = (CounterX == 2256); // 16 + 48 + 96 + 640
    //Y position counter
    wire CounterYmaxed = (CounterY == 1087); // 10 + 2 + 33 + 480
    
    //On each clock update, increase the position of x if not maxed out, else reset to 0
    always @(posedge clk)
    if (CounterXmaxed)
      CounterX <= 0;
    else
      CounterX <= CounterX + 1;
    //On each clock update,update the y position if the current set of x positions has been maxed out
    always @(posedge clk)
    begin
      if (CounterXmaxed)
      begin
        if(CounterYmaxed)
          CounterY <= 0;
        else
          CounterY <= CounterY + 1;
      end
    end
    //See if we are the sync/blanking portion of the screen
    always @(posedge clk)
    begin
      vga_HS <= (CounterX > (1680 + 104) && (CounterX < (1680 + 104 + 184)));   // active for 96 clocks
      vga_VS <= (CounterY > (1050 + 1) && (CounterY < (1050 + 1 + 3)));   // active for 2 clocks
    end
    //See if we are in the active/drawing portion of the screen aka the visible portion of the monitor
    always @(posedge clk)
    begin
        inDisplayArea <= (CounterX < 1680) && (CounterY < 1050);
    end

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
