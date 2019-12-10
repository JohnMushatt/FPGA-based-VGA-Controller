# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports {rst_n}]
    set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
    
##VGA Connector
set_property PACKAGE_PIN G19 [get_ports {pixelR[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelR[0]}]
set_property PACKAGE_PIN H19 [get_ports {pixelR[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelR[1]}]
set_property PACKAGE_PIN J19 [get_ports {pixelR[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelR[2]}]
#set_property PACKAGE_PIN N19 [get_ports {pixelR[3]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {pixelR[3]}]
set_property PACKAGE_PIN N18 [get_ports {pixelB[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelB[0]}]
set_property PACKAGE_PIN L18 [get_ports {pixelB[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelB[1]}]
set_property PACKAGE_PIN K18 [get_ports {pixelB[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelB[2]}]
#set_property PACKAGE_PIN J18 [get_ports {VGA_B[3]}]
#    set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[3]}]
set_property PACKAGE_PIN J17 [get_ports {pixelG[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelG[0]}]
set_property PACKAGE_PIN H17 [get_ports {pixelG[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelG[1]}]
set_property PACKAGE_PIN G17 [get_ports {pixelG[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pixelG[2]}]
#set_property PACKAGE_PIN D17 [get_ports {VGA_G[3]}]
#   set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[3]}]
set_property PACKAGE_PIN P19 [get_ports {hsync_out}]
    set_property IOSTANDARD LVCMOS33 [get_ports {hsync_out}]
set_property PACKAGE_PIN R19 [get_ports {vsync_out}]
    set_property IOSTANDARD LVCMOS33 [get_ports {vsync_out}]
