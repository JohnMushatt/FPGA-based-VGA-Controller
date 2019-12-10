onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clk_147MHz -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clk_147MHz xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clk_147MHz.udo}

run -all

endsim

quit -force
