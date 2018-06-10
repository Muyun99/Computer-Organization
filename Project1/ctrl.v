module ctrl(Ins,Branch,Jump,RegDst,ALUSrc,ALUctr,MemtoReg,RegWr,MemWr,ExtOp);
	input [31:0] Ins;
	output reg Branch,Jump,RegDst,ALUSrc,MemtoReg,RegWr,MemWr,ExtOp;
	output reg [2:0]ALUctr;
	wire [5:0] Op,func;
	assign Op = Ins[31:26];
	assign func = Ins[5:0];
	
	always @(Ins or Op or func)
	begin
		if(Op == 6'b000000)
		begin
			Branch = 0;
			Jump = 0;
			RegDst = 1;
			ALUSrc = 0;
			MemtoReg = 0;
			RegWr = 1;
			MemWr = 0;
			ExtOp = 0;
			if(func == 6'b100000)	ALUctr = 3'b001;//add
			if(func == 6'b100010)	ALUctr = 3'b010;//sub
			if(func == 6'b100011)	ALUctr = 3'b011;//subu
		end
		if(Op == 6'b001101)//ori
		begin
			Branch = 0;
			Jump = 0;
			RegDst = 0;
			ALUSrc = 1;
			ALUctr = 3'b100; // or
			MemtoReg = 0;
			RegWr = 1;
			MemWr = 0;
			ExtOp = 0;
		end
		if(Op == 6'b100011)//lw
		begin
			Branch = 0;
			Jump = 0;
			RegDst = 0;
			ALUSrc = 1;
			ALUctr = 3'b001; // addu
			MemtoReg = 1;
			RegWr = 1;
			MemWr = 0;
			ExtOp = 1;
		end
		if(Op == 6'b101011)//sw
		begin
			Branch = 0;
			Jump = 0;
			RegDst = 0;
			ALUSrc = 1;
			ALUctr = 3'b001; // addu
			MemtoReg = 0;
			RegWr = 0;
			MemWr = 1;
			ExtOp = 1;
		end
		if(Op == 6'b000100)//beq
		begin
			Branch = 1;
			Jump = 0;
			RegDst = 0;
			ALUSrc = 0;
			ALUctr = 3'b011; // subu
			MemtoReg = 0;
			RegWr = 0;
			MemWr = 0;
			ExtOp = 0;
		end
		if(Op == 6'b000010)//jump
		begin
			Branch = 0;
			Jump = 1;
			RegWr = 0;
			MemWr = 0;
		end
		
	end
endmodule
