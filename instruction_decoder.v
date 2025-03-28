`include "elements.v"

module instruction_decoder (

    input [2:0] funct3,
    input funct7_5,
    input [6:0] opcode,

    output is_jump, is_jalr, is_branch, memwrite, regwrite, alu_srca,
    output [3:0] alu_control,
    output [1:0] alu_srcb,result_src,load_sel,
    output [2:0] store_sel

);

wire [12:0] connectors;
//is_jump
and(connectors[0],opcode[5],opcode[6]);
and(is_jump,connectors[0],opcode[2]);
//is_branch
not(connectors[1],opcode[2]);
and(is_branch,connectors[0],connectors[1]);
//is_jalr
not(connectors[2],opcode[3]);
and(connectors[3],connectors[2],opcode[2]);
and(is_jalr,connectors[3],connectors[0]);
//MemWrite
not(connectors[4],opcode[4]);
not(connectors[5],opcode[6]);
and(connectors[6],connectors[4],connectors[5]);
and(memwrite,connectors[6],opcode[5]);
//alu_control
wire [2:0] alu_con;
and(alu_con[0],opcode[4],connectors[5]);
mux2x1 a1(.A({1'b0,funct3[2]}),.S(alu_con[0]),.Y(alu_control[3]));
mux2x1 a2(.A({1'b0,funct3[1]}),.S(alu_con[0]),.Y(alu_control[2]));
mux2x1 a3(.A({1'b0,funct3[0]}),.S(alu_con[0]),.Y(alu_control[1]));
mux2x1 a4(.A({2'b01}),.S(opcode[6]),.Y(alu_con[1]));
and(alu_con[2],funct7_5,opcode[5]);
mux2x1 a5(.A({alu_con[1],alu_con[2]}),.S(alu_con[0]),.Y(alu_control[0]));
//Result_Src
assign result_src[0] = connectors[0];
or(connectors[7],opcode[5],opcode[4]);
not(result_src[1],connectors[7]);
//RegWrite 
not(connectors[8],opcode[5]);
or(connectors[9],opcode[2],opcode[4]);
or(connectors[10],opcode[3],connectors[9]);
or(regwrite,connectors[10],connectors[8]);
//Alu Src A
and(alu_srca,opcode[2],opcode[4]);
//Alu Src B
and(connectors[11],opcode[5],opcode[4]);
not(connectors[12],connectors[11]);
and(alu_srcb[1],connectors[12],connectors[5]);
assign alu_srcb[0] = opcode[2];

assign load_sel = funct3[1:0];
assign store_sel = funct3[2:0];

endmodule //instruction_decoder

