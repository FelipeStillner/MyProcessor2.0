t = processor0

compile:
	@mkdir -p waves

	ghdl -a -fsynopsys --std=08 *.vhd
	ghdl -a -fsynopsys --std=08 ula/*.vhd 
	ghdl -a -fsynopsys --std=08 regbank/*.vhd
	ghdl -a -fsynopsys --std=08 uc/*.vhd

	ghdl -a -fsynopsys --std=08 test/$(t)_tb.vhd 
	ghdl -e -fsynopsys --std=08 $(t)_tb
	ghdl -r -fsynopsys --std=08 $(t)_tb --wave=waves/$(t)_tb.ghw --stop-time=1ms

	rm *.cf
	
	gtkwave waves/$(t)_tb.ghw
