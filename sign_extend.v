`include "elements.v"

// INS [4:0] => I U S B J Type respectively from 4->0

module sign_extend_bit(input [4:0] ins,input [3:0] select,output extend);

wire [4:0] connectors;

mux2x1 a1(.A({ins[4],ins[3]}),.S(select[3]),.Y(connectors[0]));
mux2x1 a2(.A({ins[2],ins[1]}),.S(select[2]),.Y(connectors[1]));
mux2x1 a3(.A({connectors[0],connectors[1]}),.S(select[1]),.Y(connectors[2]));
mux2x1 a4(.A({connectors[2],ins[0]}),.S(select[0]),.Y(extend));

endmodule

module sign_extend(input [31:0] instruction, output [31:0] extension);

//Opcode[6:0] = instruction[6:0]
wire [3:0] connectors;
not (connectors[0],instruction[2]);
and (connectors[1],instruction[4],instruction[2]);
and (connectors[2],instruction[5],connectors[0]);

sign_extend_bit a31(.ins({instruction[31],instruction[31],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[31]));
sign_extend_bit a30(.ins({instruction[31],instruction[30],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[30]));
sign_extend_bit a29(.ins({instruction[31],instruction[29],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[29]));
sign_extend_bit a28(.ins({instruction[31],instruction[28],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[28]));
sign_extend_bit a27(.ins({instruction[31],instruction[27],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[27]));
sign_extend_bit a26(.ins({instruction[31],instruction[26],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[26]));
sign_extend_bit a25(.ins({instruction[31],instruction[25],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[25]));
sign_extend_bit a24(.ins({instruction[31],instruction[24],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[24]));
sign_extend_bit a23(.ins({instruction[31],instruction[23],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[23]));
sign_extend_bit a22(.ins({instruction[31],instruction[22],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[22]));
sign_extend_bit a21(.ins({instruction[31],instruction[21],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[21]));
sign_extend_bit a20(.ins({instruction[31],instruction[20],instruction[31],instruction[31],instruction[31]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[20]));
sign_extend_bit a19(.ins({instruction[31],instruction[19],instruction[31],instruction[31],instruction[19]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[19]));
sign_extend_bit a18(.ins({instruction[31],instruction[18],instruction[31],instruction[31],instruction[18]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[18]));
sign_extend_bit a17(.ins({instruction[31],instruction[17],instruction[31],instruction[31],instruction[17]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[17]));
sign_extend_bit a16(.ins({instruction[31],instruction[16],instruction[31],instruction[31],instruction[16]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[16]));
sign_extend_bit a15(.ins({instruction[31],instruction[15],instruction[31],instruction[31],instruction[15]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[15]));
sign_extend_bit a14(.ins({instruction[31],instruction[14],instruction[31],instruction[31],instruction[14]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[14]));
sign_extend_bit a13(.ins({instruction[31],instruction[13],instruction[31],instruction[31],instruction[13]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[13]));
sign_extend_bit a12(.ins({instruction[31],instruction[12],instruction[31],instruction[31],instruction[12]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[12]));
sign_extend_bit a11(.ins({instruction[31],1'b0,instruction[31],instruction[7],instruction[20]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[11]));
sign_extend_bit a10(.ins({instruction[30],1'b0,instruction[30],instruction[30],instruction[30]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[10]));
sign_extend_bit a9(.ins({instruction[29],1'b0,instruction[29],instruction[29],instruction[29]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[9]));
sign_extend_bit a8(.ins({instruction[28],1'b0,instruction[28],instruction[28],instruction[28]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[8]));
sign_extend_bit a7(.ins({instruction[27],1'b0,instruction[27],instruction[27],instruction[27]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[7]));
sign_extend_bit a6(.ins({instruction[26],1'b0,instruction[26],instruction[26],instruction[26]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[6]));
sign_extend_bit a5(.ins({instruction[25],1'b0,instruction[25],instruction[25],instruction[25]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[5]));
sign_extend_bit a4(.ins({instruction[24],1'b0,instruction[11],instruction[11],instruction[24]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[4]));
sign_extend_bit a3(.ins({instruction[23],1'b0,instruction[10],instruction[10],instruction[23]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[3]));
sign_extend_bit a2(.ins({instruction[22],1'b0,instruction[9],instruction[9],instruction[22]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[2]));
sign_extend_bit a1(.ins({instruction[21],1'b0,instruction[8],instruction[8],instruction[21]}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[1]));
sign_extend_bit a0(.ins({instruction[20],1'b0,instruction[7],1'b0,1'b0}),.select({connectors[1],instruction[6],connectors[2],instruction[3]}),.extend(extension[0]));

endmodule

