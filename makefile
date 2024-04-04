t = ula

compile:
	@mkdir -p waves

	ghdl -a -fsynopsys --std=08 mux.vhd
	ghdl -a -fsynopsys --std=08 mux4.vhd 
	ghdl -a -fsynopsys --std=08 mux16.vhd 
	ghdl -a -fsynopsys --std=08 gtru.vhd 
	ghdl -a -fsynopsys --std=08 gtru16.vhd 
	ghdl -a -fsynopsys --std=08 gtr16.vhd 
	ghdl -a -fsynopsys --std=08 or16.vhd
	ghdl -a -fsynopsys --std=08 and16.vhd
	ghdl -a -fsynopsys --std=08 sum.vhd
	ghdl -a -fsynopsys --std=08 sum16.vhd 
	ghdl -a -fsynopsys --std=08 ula.vhd 
	ghdl -a -fsynopsys --std=08 xor16.vhd 
	ghdl -a -fsynopsys --std=08 eq16.vhd 
	ghdl -a -fsynopsys --std=08 sub16.vhd 

	ghdl -a -fsynopsys --std=08 test/$(t)_tb.vhd 
	ghdl -e -fsynopsys --std=08 $(t)_tb
	ghdl -r -fsynopsys --std=08 $(t)_tb --wave=waves/$(t)_tb.ghw --stop-time=1ms

	rm *.cf
	
	gtkwave waves/$(t)_tb.ghw
