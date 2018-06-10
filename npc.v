module npc(NPC,PC,immi16,target,Branch,Jump,Zero);
	input [31:0] PC;
	input [15:0] immi16;
	input [25:0] target;
	input Branch;
	input Jump;
	input Zero;
	output reg[31:0]NPC;
	
	wire [31:0] PC_plus_4;
	wire [31:0] PC_branch;
	wire [31:0] PC_jump;
	

	assign PC_plus_4 = PC + 4;
	assign PC_branch = PC + 4 + {{14{immi16[15]}}, immi16[15:0],2'b00};
	assign PC_jump = {PC[31:28],target[25:0],2'b00};
	
	always @(PC or immi16 or Branch or Jump or Zero)
	begin
		if(Jump == 1)
			NPC <= PC_jump;
		else if(Branch == 1 && Zero == 1)
			NPC <= PC_branch;
		else 
			NPC <= PC_plus_4;
	end
	
endmodule