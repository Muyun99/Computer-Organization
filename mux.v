module mux_ALU(busB,Ext_immi16,ALUSrc,DataIn);
	input  [31:0] busB;
	input  [31:0] Ext_immi16;
	input         ALUSrc;
	output reg [31:0]  DataIn;
	always@(busB or Ext_immi16 or ALUSrc)
	begin
		assign DataIn = (ALUSrc == 0)? busB : Ext_immi16;
	end
endmodule

module mux_Reg(Rd,Rt,RegDst,Rw);
	input  [4:0] Rd;
	input  [4:0] Rt;
	input 		 RegDst;
	output reg [4:0] Rw;
	always@(Rd or Rt or RegDst)
	begin
		assign Rw = (RegDst == 0)? Rt : Rd;
	end
endmodule

module mux_im(ALUresult,DataOut,MemtoReg,busW);
	input  [31:0] ALUresult;
	input  [31:0] DataOut;
	input         MemtoReg;
	output reg [31:0] busW;
	always@(ALUresult or MemtoReg or DataOut)
	begin
		assign busW = (MemtoReg == 0)? ALUresult : DataOut;
	end
endmodule


