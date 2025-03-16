`include "circuits.v"

module or_32 (
    input [31:0] A,B,
    output [31:0] C
);

or_16 l5(.A(A[15:0]),.B(B[15:0]),.C(C[15:0]));
or_16 l6(.A(A[31:16]),.B(B[31:16]),.C(C[31:16]));

endmodule //32 Bit or Block 

module and_32 (
    input [31:0] A,B,
    output [31:0] C
);

and_16 k5(.A(A[15:0]),.B(B[15:0]),.C(C[15:0]));
and_16 k6(.A(A[31:16]),.B(B[31:16]),.C(C[31:16]));

endmodule //32 Bit And Block 

module xor_32 (
    input [31:0] A,B,
    output [31:0] C
);

xor_16 h5(.A(A[15:0]),.B(B[15:0]),.C(C[15:0]));
xor_16 h6(.A(A[31:16]),.B(B[31:16]),.C(C[31:16]));

endmodule //32 Bit Xor Block 

module shifter(
    input [31:0] Op1,
    input S,
    input funct7_5,
    input [4:0] Shift,
    output [31:0] Result
);
wire out;
wire out1;
wire first;
mux32x1 a34(.A(Op1[31:0]),.S(Shift),.Y(out));
and (out1,Op1[31],funct7_5);
mux2x1 a66(.A({out,out1}),.S(S),.Y(Result[31]));

shift_logic a35(.A({Op1[30:0],1'b0}),.B({Op1[30],Op1[31],{30{out1}}}),.Control(Shift),.S(S),.Y(Result[30]));
shift_logic a36(.A({Op1[29:0],2'b0}),.B({Op1[29],Op1[30],Op1[31],{29{out1}}}),.Control(Shift),.S(S),.Y(Result[29]));
shift_logic a37(.A({Op1[28:0],3'b0}),.B({Op1[28],Op1[29],Op1[30],Op1[31],{28{out1}}}),.Control(Shift),.S(S),.Y(Result[28]));
shift_logic a38(.A({Op1[27:0],4'b0}),.B({Op1[27],Op1[28],Op1[29],Op1[30],Op1[31],{27{out1}}}),.Control(Shift),.S(S),.Y(Result[27]));
shift_logic a39(.A({Op1[26:0],5'b0}),.B({Op1[26], Op1[27], 
 Op1[28], Op1[29], Op1[30],Op1[31],{26{out1}}}),.Control(Shift),.S(S),.Y(Result[26]));
shift_logic a40(.A({Op1[25:0],6'b0}),.B({Op1[25],Op1[26],Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {25{out1}}}),.Control(Shift),.S(S),.Y(Result[25]));
shift_logic a41(.A({Op1[24:0],7'b0}),.B({Op1[24], Op1[25],Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {24{out1}}}),.Control(Shift),.S(S),.Y(Result[24]));
shift_logic a42(.A({Op1[23:0],8'b0}),.B({Op1[23],Op1[24],Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{23{out1}}}),.Control(Shift),.S(S),.Y(Result[23]));
shift_logic a43(.A({Op1[22:0],9'b0}),.B({Op1[22],Op1[23],Op1[24],Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{22{out1}}}),.Control(Shift),.S(S),.Y(Result[22]));
shift_logic a44(.A({Op1[21:0],10'b0}),.B({Op1[21], Op1[22],Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{21{out1}}}),.Control(Shift),.S(S),.Y(Result[21]));
shift_logic a45(.A({Op1[20:0],11'b0}),.B({Op1[20], Op1[21],
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{20{out1}}}),.Control(Shift),.S(S),.Y(Result[20]));
shift_logic a46(.A({Op1[19:0],12'b0}),.B({Op1[19],Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{19{out1}}}),.Control(Shift),.S(S),.Y(Result[19]));
shift_logic a47(.A({Op1[18:0],13'b0}),.B({Op1[18],Op1[19],Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{18{out1}}}),.Control(Shift),.S(S),.Y(Result[18]));
shift_logic a48(.A({Op1[17:0],14'b0}),.B({Op1[17],Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{17{out1}}}),.Control(Shift),.S(S),.Y(Result[17]));
shift_logic a49(.A({Op1[16:0],15'b0}),.B({Op1[16],Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {16{out1}}}),.Control(Shift),.S(S),.Y(Result[16]));
shift_logic a50(.A({Op1[15:0],16'b0}),.B({Op1[15],Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {15{out1}}}),.Control(Shift),.S(S),.Y(Result[15]));
shift_logic a51(.A({Op1[14:0],17'b0}),.B({Op1[14],Op1[15],Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{14{out1}}}),.Control(Shift),.S(S),.Y(Result[14]));
shift_logic a52(.A({Op1[13:0],18'b0}),.B({Op1[13],Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {13{out1}}}),.Control(Shift),.S(S),.Y(Result[13]));
shift_logic a53(.A({Op1[12:0],19'b0}),.B({Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{12{out1}}}),.Control(Shift),.S(S),.Y(Result[12]));
shift_logic a54(.A({Op1[11:0],20'b0}),.B({Op1[11],Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{11{out1}}}),.Control(Shift),.S(S),.Y(Result[11]));
shift_logic a55(.A({Op1[10:0],21'b0}),.B({Op1[10],Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{10{out1}}}),.Control(Shift),.S(S),.Y(Result[10]));
shift_logic a56(.A({Op1[9:0],22'b0}),.B({Op1[9],Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{9{out1}}}),.Control(Shift),.S(S),.Y(Result[9]));
shift_logic a57(.A({Op1[8:0],23'b0}),.B({Op1[8],Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{8{out1}}}),.Control(Shift),.S(S),.Y(Result[8]));
shift_logic a58(.A({Op1[7:0],24'b0}),.B({Op1[7],Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{7{out1}}}),.Control(Shift),.S(S),.Y(Result[7]));
shift_logic a59(.A({Op1[6:0],25'b0}),.B({Op1[6],Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{6{out1}}}),.Control(Shift),.S(S),.Y(Result[6]));
shift_logic a60(.A({Op1[5:0],26'b0}),.B({Op1[5],Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {5{out1}}}),.Control(Shift),.S(S),.Y(Result[5]));
shift_logic a61(.A({Op1[4:0],27'b0}),.B({Op1[4],Op1[5], Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31], {4{out1}}}),.Control(Shift),.S(S),.Y(Result[4]));
shift_logic a62(.A({Op1[3:0],28'b0}),.B({Op1[3],Op1[4], Op1[5], Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{3{out1}}}),.Control(Shift),.S(S),.Y(Result[3]));
shift_logic a63(.A({Op1[2:0],29'b0}),.B({Op1[2],Op1[3], Op1[4], Op1[5], Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{2{out1}}}),.Control(Shift),.S(S),.Y(Result[2]));
shift_logic a64(.A({Op1[1:0],30'b0}),.B({Op1[1],Op1[2], Op1[3], Op1[4], Op1[5], Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31],{1{out1}}}),.Control(Shift),.S(S),.Y(Result[1]));
shift_logic a65(.A({Op1[0],31'b0}),.B({Op1[0],Op1[1], Op1[2], Op1[3], Op1[4], Op1[5], Op1[6], Op1[7], 
 Op1[8], Op1[9], Op1[10], Op1[11], Op1[12], Op1[13], Op1[14], 
 Op1[15], Op1[16], Op1[17], Op1[18], Op1[19], Op1[20], Op1[21], 
 Op1[22], Op1[23], Op1[24], Op1[25], Op1[26], Op1[27], Op1[28], 
 Op1[29], Op1[30],Op1[31]}),.Control(Shift),.S(S),.Y(Result[0]));

endmodule

module ad32(input [31:0]a,b,
input c,
output [31:0] sum,
output carry);

wire connectors;

ad16 q11(.a(a[15:0]),.b(b[15:0]),.c(c),.sum(sum[15:0]),.carry(connectors));
ad16 q12(.a(a[31:16]),.b(b[31:16]),.c(connectors),.sum(sum[31:16]),.carry(carry));

endmodule


module arithemetic(input [31:0] A,B,
input funct7_5,
input [2:0] funct_3,
output [31:0] Result);

wire [31:0] connectors;
wire [31:0] sum;
wire nsum;
wire final ;
wire overflow;
or(final,funct7_5,funct_3[1]);
xor_32 z1(.A(B[31:0]),.B({32{final}}),.C(connectors));
ad32  z2(.a(A),.b(connectors),.c(final),.sum(sum),.carry(overflow));

not (nsum,sum[31]);
wire [31:0] slt = {31'b0,sum[31]};
wire pr;
mux4x1 z3(.A({sum[31],1'b1,1'b0,nsum}),.S({A[31],B[31]}),.Y(pr));
wire [31:0] sltu = {31'b0,pr};

wire [31:0] co;
mux2x1_32bit z5(.a(slt), .b(sltu), .sel(funct_3[0]), .out(co));
mux2x1_32bit z6(.a(sum), .b(co), .sel(funct_3[1]), .out(Result));
endmodule

module logic_block(input [31:0] A,B,
input [1:0] funct3,
output [31:0] Result);

wire [31:0] connectors_0,connectors_1,connectors_2,connectors_3;
xor_32 g1(.A(A),.B(B),.C(connectors_0));
or_32 g2(.A(A),.B(B),.C(connectors_1));
and_32 g3(.A(A),.B(B),.C(connectors_2));

mux2x1_32bit g4(.a(connectors_1),.b(connectors_2),.sel(funct3[0]),.out(connectors_3));
mux2x1_32bit g5(.a(connectors_0),.b(connectors_3),.sel(funct3[1]),.out(Result));

endmodule

module alu ( Op1,Op2,Alu_Control,Result,Zero_f,Sign_f );
input [31:0] Op1, Op2;
input [3:0] Alu_Control;//Alu_Control[0] = funct7_5
output [31:0] Result;
output Zero_f, Sign_f;

// control signals for resultant mux .....
wire [3:0] connectors ;
wire [3:0] connector ;
wire n_0,n_1,n_2;
not(n_0,Alu_Control[1]);
not(n_1,Alu_Control[2]);
not(n_2,Alu_Control[3]);

wire [31:0] Arith , Log , shift,co;

and(connectors[0],n_2,n_1,n_0);
and(connectors[1],n_2,Alu_Control[2],n_0);
and(connectors[2],n_2,Alu_Control[2],Alu_Control[1]);
or(connectors[3],connectors[0],connectors[1],connectors[2]);

and(connector[0],Alu_Control[3],n_1,n_0);
and(connector[1],Alu_Control[3],Alu_Control[2],n_0);
and(connector[2],Alu_Control[3],Alu_Control[2],Alu_Control[1]);
or(connector[3],connector[0],connector[1],connector[2]);

logic_block v1(.A(Op1),.B(Op2),.funct3(Alu_Control[2:1]), .Result(Log));
shifter v2(.Op1(Op1),.S(Alu_Control[3]),.funct7_5(Alu_Control[0]),.Shift(Op2[4:0]),.Result(shift));
arithemetic v3(.A(Op1),.B(Op2),.funct7_5(Alu_Control[0]),.funct_3(Alu_Control[3:1]),.Result(Arith));

mux2x1_32bit g6(.a(shift),.b(Log),.sel(connector[3]),.out(co));
mux2x1_32bit g7(.a(co),.b(Arith),.sel(connectors[3]),.out(Result));

 wire [31:0] core;
not32bit g8(.in(Result),.out(core));
and32bit g9(.in(core),.out(Zero_f));
assign Sign_f = Result[31];

endmodule


