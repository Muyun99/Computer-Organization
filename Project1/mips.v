`include"datapath.v"
module mips();
	reg clk,rst;
	initial
	begin
		clk = 1;
		rst = 1;
		#20 rst = 0;
	end
	
	always
	begin
		#10 clk = ~clk;
	end
	
	datapath datapath(.clk(clk),.rst(rst));
endmodule