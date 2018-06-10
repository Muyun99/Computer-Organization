module dm_4G(Addr,DataIn,MemWr,clk,DataOut);
	input  [31:0] Addr ; 	// address bus
	input  [31:0] DataIn ; 	// 32-bit input data
	input 		  MemWr ; 	 	// memory write enable
	input 		  clk ; 	// clock
	output [31:0] DataOut ; 	// 32-bit memory output
	reg    [31:0] dm[1073741823:0];
	
	
	integer i;
	initial
	begin
    for(i = 0 ; i < 1024 ; i = i + 1)
		dm[i] = 32'h00000000;
	end
	
	assign DataOut = dm[Addr[11:2]];//read
	
	always @(posedge clk)
	begin
		if(MemWr == 1)
			dm[Addr] <= DataIn;//write
	end
	
endmodule