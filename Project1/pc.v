module pc(NPC,PC,rst,clk);
	input     [31:0] NPC;
	input            clk;
	input            rst;
	output reg[31:0] PC;
	initial 
	begin
		PC <= 32'h00003000;
	end
	
	always @(posedge clk)
		if(rst == 1)
			PC <= 32'h00003000;
		else
			PC <= NPC;
endmodule
	