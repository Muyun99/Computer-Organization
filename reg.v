module REG(Rs,Rt,Rw,RegWr,clk,busA,busB,busW);
	input [4:0] Rs;
	input [4:0] Rt;
	input [4:0] Rw;
	input [31:0] busW;
	input clk;
	input RegWr;
	output [31:0] busA;
	output [31:0] busB;
	reg [31:0] register [31:0];
	integer i;
	
	initial 
	begin
		for(i = 0;i < 32;i = i + 1)
			register[i] = 32'h00000000;
	end
	
	assign busA = register[Rs];
	assign busB = register[Rt];
	
	always @(posedge clk)
	begin
		if((busW != 0) && (RegWr == 1))
			register[Rw] = busW;
	end
endmodule