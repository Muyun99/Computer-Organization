module Ext(imm16,ExtOp,Ext_immi16);
	input     [15:0] imm16;
	input            ExtOp;
	output reg[31:0] Ext_immi16;
	
	always @(imm16 or ExtOp)
	begin
		if(ExtOp == 1)				
			Ext_immi16 <= {{16{imm16[15]}},imm16[15:0]};//SignExt
		else						
			Ext_immi16 <= {{16'b0},imm16[15:0]};		 //ZeroExt
	end
endmodule
	
