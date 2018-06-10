module ALU(ALUctr,busA,busB,ALUresult,Zero);
	input [2:0] ALUctr;
	input [31:0] busA;
	input [31:0] busB;
	output reg[31:0]ALUresult;
	output reg Zero;
	
	always @(ALUctr or busA or busB)
	begin
		case(ALUctr)
			3'b000:ALUresult = busA + busB;//add
			3'b001:ALUresult = busA + busB;//addu
			3'b010:ALUresult = busA - busB;//sub
			3'b011:ALUresult = busA - busB;//subu
			3'b100:ALUresult = busA | busB;//ori
			3'b101:;
			3'b110:;
			3'b111:;
		endcase
		if(ALUresult==0) 
			Zero = 1;
		else 
			Zero = 0;
	end
endmodule


