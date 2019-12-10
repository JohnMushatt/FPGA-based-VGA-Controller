`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2019 04:02:25 PM
// Design Name: 
// Module Name: hvsync_generator_1680x1050
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
    reg vga_HS, vga_VS;

    wire CounterXmaxed = (CounterX == 2256); // 16 + 48 + 96 + 640
    wire CounterYmaxed = (CounterY == 1087); // 10 + 2 + 33 + 480

    always @(posedge clk)
    if (CounterXmaxed)
      CounterX <= 0;
    else
      CounterX <= CounterX + 1;

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

    always @(posedge clk)
    begin
      vga_HS <= (CounterX > (1680 + 104) && (CounterX < (1680 + 104 + 184)));   // active for 96 clocks
      vga_VS <= (CounterY > (1050 + 1) && (CounterY < (1050 + 1 + 3)));   // active for 2 clocks
    end

    always @(posedge clk)
    begin
        inDisplayArea <= (CounterX < 1680) && (CounterY < 1050);
    end

    assign vga_h_sync = ~vga_HS;
    assign vga_v_sync = ~vga_VS;

endmodule
