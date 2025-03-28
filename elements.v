//Implementing the logic Block of the circuit

module xor_4 (
    input [3:0] A,B,
    output [3:0] C
);

xor(C[0],A[0],B[0]);
xor(C[1],A[1],B[1]);
xor(C[2],A[2],B[2]);
xor(C[3],A[3],B[3]);

endmodule //4 Bit Xor Block

module xor_16 (
    input [15:0] A,B,
    output [15:0] C    
);

xor_4 h1(.A(A[3:0]),.B(B[3:0]),.C(C[3:0]));
xor_4 h2(.A(A[7:4]),.B(B[7:4]),.C(C[7:4]));
xor_4 h3(.A(A[11:8]),.B(B[11:8]),.C(C[11:8]));
xor_4 h4(.A(A[15:12]),.B(B[15:12]),.C(C[15:12]));

endmodule //16 Bit Xor Block

module and_4 (
    input [3:0] A,B,
    output [3:0] C
);

and(C[0],A[0],B[0]);
and(C[1],A[1],B[1]);
and(C[2],A[2],B[2]);
and(C[3],A[3],B[3]);

endmodule //4 Bit And Block

module and_16 (
    input [15:0] A,B,
    output [15:0] C    
);

and_4 k1(.A(A[3:0]),.B(B[3:0]),.C(C[3:0]));
and_4 k2(.A(A[7:4]),.B(B[7:4]),.C(C[7:4]));
and_4 k3(.A(A[11:8]),.B(B[11:8]),.C(C[11:8]));
and_4 k4(.A(A[15:12]),.B(B[15:12]),.C(C[15:12]));

endmodule //16 Bit And Block

module or_4 (
    input [3:0] A,B,
    output [3:0] C
);

or(C[0],A[0],B[0]);
or(C[1],A[1],B[1]);
or(C[2],A[2],B[2]);
or(C[3],A[3],B[3]);

endmodule //4 Bit or Block

module or_16 (
    input [15:0] A,B,
    output [15:0] C    
);

or_4 l1(.A(A[3:0]),.B(B[3:0]),.C(C[3:0]));
or_4 l2(.A(A[7:4]),.B(B[7:4]),.C(C[7:4]));
or_4 l3(.A(A[11:8]),.B(B[11:8]),.C(C[11:8]));
or_4 l4(.A(A[15:12]),.B(B[15:12]),.C(C[15:12]));

endmodule //16 Bit or Block




module mux2x1 (
    input [1:0] A,
    input S,
    output Y
);
wire[1:0] mux_con;
wire non;

not(non,S);
and(mux_con[0],A[1],non);
and(mux_con[1],A[0],S);
or(Y,mux_con[0],mux_con[1]);

endmodule //2x1 Mux

module mux4x1 (
    input [3:0] A,
    input [1:0]S,
    output Y
);
wire [1:0] mux_con;

mux2x1 m1(.A(A[3:2]),.S(S[0]),.Y(mux_con[1]));
mux2x1 m2(.A(A[1:0]),.S(S[0]),.Y(mux_con[0]));
mux2x1 m3(.A({mux_con}),.S(S[1]),.Y(Y));

endmodule //4x1mux4x1 Mux 

module mux16x1 (
    input [15:0] A,
    input [3:0] S,
    output Y
);
wire [3:0] mux_con;
mux4x1 m4(.A(A[15:12]),.S(S[1:0]),.Y(mux_con[3]));
mux4x1 m5(.A(A[11:8]),.S(S[1:0]),.Y(mux_con[2]));
mux4x1 m6(.A(A[7:4]),.S(S[1:0]),.Y(mux_con[1]));
mux4x1 m7(.A(A[3:0]),.S(S[1:0]),.Y(mux_con[0]));
mux4x1 m8(.A(mux_con),.S(S[3:2]),.Y(Y));

endmodule //16x4 Mux 

module mux32x1 (
    input [31:0] A,
    input [4:0] S,
    output Y
);

wire [1:0] mux_con;
mux16x1 m9(.A(A[31:16]),.S(S[3:0]),.Y(mux_con[1]));
mux16x1 m10(.A(A[15:0]),.S(S[3:0]),.Y(mux_con[0]));
mux2x1 m11(.A(mux_con),.S(S[4]),.Y(Y));

endmodule // 32x5 Mux

// Now using the 32x5 mux we need to implement the shift logic but firstly create that logic

module shift_logic (
    input [31:0] A,B,
    input S,
    input [4:0] Control,
    output Y
);

wire [31:0] mux_connectors;
mux2x1 a1(.A({A[31],B[31]}),.S(S),.Y(mux_connectors[31]));
mux2x1 a2(.A({A[30],B[30]}),.S(S),.Y(mux_connectors[30]));
mux2x1 a3(.A({A[29],B[29]}),.S(S),.Y(mux_connectors[29]));
mux2x1 a4(.A({A[28],B[28]}),.S(S),.Y(mux_connectors[28]));
mux2x1 a5(.A({A[27],B[27]}),.S(S),.Y(mux_connectors[27]));
mux2x1 a6(.A({A[26],B[26]}),.S(S),.Y(mux_connectors[26]));
mux2x1 a7(.A({A[25],B[25]}),.S(S),.Y(mux_connectors[25]));
mux2x1 a8(.A({A[24],B[24]}),.S(S),.Y(mux_connectors[24]));
mux2x1 a9(.A({A[23],B[23]}),.S(S),.Y(mux_connectors[23]));
mux2x1 a10(.A({A[22],B[22]}),.S(S),.Y(mux_connectors[22]));
mux2x1 a11(.A({A[21],B[21]}),.S(S),.Y(mux_connectors[21]));
mux2x1 a12(.A({A[20],B[20]}),.S(S),.Y(mux_connectors[20]));
mux2x1 a13(.A({A[19],B[19]}),.S(S),.Y(mux_connectors[19]));
mux2x1 a14(.A({A[18],B[18]}),.S(S),.Y(mux_connectors[18]));
mux2x1 a15(.A({A[17],B[17]}),.S(S),.Y(mux_connectors[17]));
mux2x1 a16(.A({A[16],B[16]}),.S(S),.Y(mux_connectors[16]));
mux2x1 a17(.A({A[15],B[15]}),.S(S),.Y(mux_connectors[15]));
mux2x1 a18(.A({A[14],B[14]}),.S(S),.Y(mux_connectors[14]));
mux2x1 a19(.A({A[13],B[13]}),.S(S),.Y(mux_connectors[13]));
mux2x1 a20(.A({A[12],B[12]}),.S(S),.Y(mux_connectors[12]));
mux2x1 a21(.A({A[11],B[11]}),.S(S),.Y(mux_connectors[11]));
mux2x1 a22(.A({A[10],B[10]}),.S(S),.Y(mux_connectors[10]));
mux2x1 a23(.A({A[9],B[9]}),.S(S),.Y(mux_connectors[9]));
mux2x1 a24(.A({A[8],B[8]}),.S(S),.Y(mux_connectors[8]));
mux2x1 a25(.A({A[7],B[7]}),.S(S),.Y(mux_connectors[7]));
mux2x1 a26(.A({A[6],B[6]}),.S(S),.Y(mux_connectors[6]));
mux2x1 a27(.A({A[5],B[5]}),.S(S),.Y(mux_connectors[5]));
mux2x1 a28(.A({A[4],B[4]}),.S(S),.Y(mux_connectors[4]));
mux2x1 a29(.A({A[3],B[3]}),.S(S),.Y(mux_connectors[3]));
mux2x1 a30(.A({A[2],B[2]}),.S(S),.Y(mux_connectors[2]));
mux2x1 a31(.A({A[1],B[1]}),.S(S),.Y(mux_connectors[1]));
mux2x1 a32(.A({A[0],B[0]}),.S(S),.Y(mux_connectors[0]));
mux32x1 a33(.A(mux_connectors),.S(Control),.Y(Y));

endmodule

module ha(input a,b,
output c,s);

xor(s,a,b);
and(c,a,b);

endmodule // half adder

module fa(input a,b,c,
output sum,carry);

wire [2:0] conn;

ha q1(.a(a),.b(b),.s(conn[0]),.c(conn[1]));
ha q2(.a(conn[0]),.b(c),.s(sum),.c(conn[2]));
or (carry,conn[1],conn[2]);

endmodule

module ad4(input [3:0]a,b,
input c,
output [3:0] sum,
output carry);

wire [2:0] connectors;

fa q3(.a(a[0]),.b(b[0]),.c(c),.sum(sum[0]),.carry(connectors[0]));
fa q4(.a(a[1]),.b(b[1]),.c(connectors[0]),.sum(sum[1]),.carry(connectors[1]));
fa q5(.a(a[2]),.b(b[2]),.c(connectors[1]),.sum(sum[2]),.carry(connectors[2]));
fa q6(.a(a[3]),.b(b[3]),.c(connectors[2]),.sum(sum[3]),.carry(carry));

endmodule

module ad16(input [15:0]a,b,
input c,
output [15:0] sum,
output carry);

wire [2:0] connectors;

ad4 q7(.a(a[3:0]),.b(b[3:0]),.c(c),.sum(sum[3:0]),.carry(connectors[0]));
ad4 q8(.a(a[7:4]),.b(b[7:4]),.c(connectors[0]),.sum(sum[7:4]),.carry(connectors[1]));
ad4 q9(.a(a[11:8]),.b(b[11:8]),.c(connectors[1]),.sum(sum[11:8]),.carry(connectors[2]));
ad4 q10(.a(a[15:12]),.b(b[15:12]),.c(connectors[2]),.sum(sum[15:12]),.carry(carry));

endmodule

module ad32(input [31:0]a,b,
input c,
output [31:0] sum,
output carry);

wire connectors;

ad16 q11(.a(a[15:0]),.b(b[15:0]),.c(c),.sum(sum[15:0]),.carry(connectors));
ad16 q12(.a(a[31:16]),.b(b[31:16]),.c(connectors),.sum(sum[31:16]),.carry(carry));

endmodule

module mux2x1_32bit (
    input [31:0] a, b,
    input sel,
    output [31:0] out
);
  mux2x1 d1(.A({a[0],b[0]}),.S(sel),.Y(out[0]));
  mux2x1 d2(.A({a[1],b[1]}),.S(sel),.Y(out[1]));
  mux2x1 d3(.A({a[2],b[2]}),.S(sel),.Y(out[2]));
  mux2x1 d4(.A({a[3],b[3]}),.S(sel),.Y(out[3]));
  mux2x1 d5(.A({a[4],b[4]}),.S(sel),.Y(out[4]));
  mux2x1 d6(.A({a[5],b[5]}),.S(sel),.Y(out[5]));
  mux2x1 d7(.A({a[6],b[6]}),.S(sel),.Y(out[6]));
  mux2x1 d8(.A({a[7],b[7]}),.S(sel),.Y(out[7]));

  mux2x1 d9(.A({a[8],b[8]}),.S(sel),.Y(out[8]));
  mux2x1 d10(.A({a[9],b[9]}),.S(sel),.Y(out[9]));
  mux2x1 d11(.A({a[10],b[10]}),.S(sel),.Y(out[10]));
  mux2x1 d12(.A({a[11],b[11]}),.S(sel),.Y(out[11]));
  mux2x1 d13(.A({a[12],b[12]}),.S(sel),.Y(out[12]));
  mux2x1 d14(.A({a[13],b[13]}),.S(sel),.Y(out[13]));
  mux2x1 d15(.A({a[14],b[14]}),.S(sel),.Y(out[14]));
  mux2x1 d16(.A({a[15],b[15]}),.S(sel),.Y(out[15]));

  mux2x1 d17(.A({a[16],b[16]}),.S(sel),.Y(out[16]));
  mux2x1 d18(.A({a[17],b[17]}),.S(sel),.Y(out[17]));
  mux2x1 d19(.A({a[18],b[18]}),.S(sel),.Y(out[18]));
  mux2x1 d20(.A({a[19],b[19]}),.S(sel),.Y(out[19]));
  mux2x1 d21(.A({a[20],b[20]}),.S(sel),.Y(out[20]));
  mux2x1 d22(.A({a[21],b[21]}),.S(sel),.Y(out[21]));
  mux2x1 d23(.A({a[22],b[22]}),.S(sel),.Y(out[22]));
  mux2x1 d24(.A({a[23],b[23]}),.S(sel),.Y(out[23]));

  mux2x1 d25(.A({a[24],b[24]}),.S(sel),.Y(out[24]));
  mux2x1 d26(.A({a[25],b[25]}),.S(sel),.Y(out[25]));
  mux2x1 d27(.A({a[26],b[26]}),.S(sel),.Y(out[26]));
  mux2x1 d28(.A({a[27],b[27]}),.S(sel),.Y(out[27]));
  mux2x1 d29(.A({a[28],b[28]}),.S(sel),.Y(out[28]));
  mux2x1 d30(.A({a[29],b[29]}),.S(sel),.Y(out[29]));
  mux2x1 d31(.A({a[30],b[30]}),.S(sel),.Y(out[30]));
  mux2x1 d32(.A({a[31],b[31]}),.S(sel),.Y(out[31]));


endmodule

module mux4x1_32bit (
    input [31:0] a, b, c, d,
    input [1:0] sel,
    output [31:0] out
);

  wire not_sel0, not_sel1;
  wire [31:0] and_a, and_b, and_c, and_d;

  not (not_sel0, sel[0]);
  not (not_sel1, sel[1]);

  and (and_a[0], a[0], not_sel1, not_sel0);
  and (and_b[0], b[0], not_sel1, sel[0]);
  and (and_c[0], c[0], sel[1], not_sel0);
  and (and_d[0], d[0], sel[1], sel[0]);
  or  (out[0], and_a[0], and_b[0], and_c[0], and_d[0]);

  and (and_a[1], a[1], not_sel1, not_sel0);
  and (and_b[1], b[1], not_sel1, sel[0]);
  and (and_c[1], c[1], sel[1], not_sel0);
  and (and_d[1], d[1], sel[1], sel[0]);
  or  (out[1], and_a[1], and_b[1], and_c[1], and_d[1]);

  and (and_a[2], a[2], not_sel1, not_sel0);
  and (and_b[2], b[2], not_sel1, sel[0]);
  and (and_c[2], c[2], sel[1], not_sel0);
  and (and_d[2], d[2], sel[1], sel[0]);
  or  (out[2], and_a[2], and_b[2], and_c[2], and_d[2]);

  and (and_a[3], a[3], not_sel1, not_sel0);
  and (and_b[3], b[3], not_sel1, sel[0]);
  and (and_c[3], c[3], sel[1], not_sel0);
  and (and_d[3], d[3], sel[1], sel[0]);
  or  (out[3], and_a[3], and_b[3], and_c[3], and_d[3]);

  and (and_a[4], a[4], not_sel1, not_sel0);
  and (and_b[4], b[4], not_sel1, sel[0]);
  and (and_c[4], c[4], sel[1], not_sel0);
  and (and_d[4], d[4], sel[1], sel[0]);
  or  (out[4], and_a[4], and_b[4], and_c[4], and_d[4]);

  and (and_a[5], a[5], not_sel1, not_sel0);
  and (and_b[5], b[5], not_sel1, sel[0]);
  and (and_c[5], c[5], sel[1], not_sel0);
  and (and_d[5], d[5], sel[1], sel[0]);
  or  (out[5], and_a[5], and_b[5], and_c[5], and_d[5]);

  and (and_a[6], a[6], not_sel1, not_sel0);
  and (and_b[6], b[6], not_sel1, sel[0]);
  and (and_c[6], c[6], sel[1], not_sel0);
  and (and_d[6], d[6], sel[1], sel[0]);
  or  (out[6], and_a[6], and_b[6], and_c[6], and_d[6]);

  and (and_a[7], a[7], not_sel1, not_sel0);
  and (and_b[7], b[7], not_sel1, sel[0]);
  and (and_c[7], c[7], sel[1], not_sel0);
  and (and_d[7], d[7], sel[1], sel[0]);
  or  (out[7], and_a[7], and_b[7], and_c[7], and_d[7]);

  and (and_a[8], a[8], not_sel1, not_sel0);
  and (and_b[8], b[8], not_sel1, sel[0]);
  and (and_c[8], c[8], sel[1], not_sel0);
  and (and_d[8], d[8], sel[1], sel[0]);
  or  (out[8], and_a[8], and_b[8], and_c[8], and_d[8]);

  and (and_a[9], a[9], not_sel1, not_sel0);
  and (and_b[9], b[9], not_sel1, sel[0]);
  and (and_c[9], c[9], sel[1], not_sel0);
  and (and_d[9], d[9], sel[1], sel[0]);
  or  (out[9], and_a[9], and_b[9], and_c[9], and_d[9]);

  and (and_a[10], a[10], not_sel1, not_sel0);
  and (and_b[10], b[10], not_sel1, sel[0]);
  and (and_c[10], c[10], sel[1], not_sel0);
  and (and_d[10], d[10], sel[1], sel[0]);
  or  (out[10], and_a[10], and_b[10], and_c[10], and_d[10]);

  and (and_a[11], a[11], not_sel1, not_sel0);
  and (and_b[11], b[11], not_sel1, sel[0]);
  and (and_c[11], c[11], sel[1], not_sel0);
  and (and_d[11], d[11], sel[1], sel[0]);
  or  (out[11], and_a[11], and_b[11], and_c[11], and_d[11]);

  and (and_a[12], a[12], not_sel1, not_sel0);
  and (and_b[12], b[12], not_sel1, sel[0]);
  and (and_c[12], c[12], sel[1], not_sel0);
  and (and_d[12], d[12], sel[1], sel[0]);
  or  (out[12], and_a[12], and_b[12], and_c[12], and_d[12]);

  and (and_a[13], a[13], not_sel1, not_sel0);
  and (and_b[13], b[13], not_sel1, sel[0]);
  and (and_c[13], c[13], sel[1], not_sel0);
  and (and_d[13], d[13], sel[1], sel[0]);
  or  (out[13], and_a[13], and_b[13], and_c[13], and_d[13]);

  and (and_a[14], a[14], not_sel1, not_sel0);
  and (and_b[14], b[14], not_sel1, sel[0]);
  and (and_c[14], c[14], sel[1], not_sel0);
  and (and_d[14], d[14], sel[1], sel[0]);
  or  (out[14], and_a[14], and_b[14], and_c[14], and_d[14]);

  and (and_a[15], a[15], not_sel1, not_sel0);
  and (and_b[15], b[15], not_sel1, sel[0]);
  and (and_c[15], c[15], sel[1], not_sel0);
  and (and_d[15], d[15], sel[1], sel[0]);
  or  (out[15], and_a[15], and_b[15], and_c[15], and_d[15]);

  and (and_a[16], a[16], not_sel1, not_sel0);
  and (and_b[16], b[16], not_sel1, sel[0]);
  and (and_c[16], c[16], sel[1], not_sel0);
  and (and_d[16], d[16], sel[1], sel[0]);
  or  (out[16], and_a[16], and_b[16], and_c[16], and_d[16]);

  and (and_a[17], a[17], not_sel1, not_sel0);
  and (and_b[17], b[17], not_sel1, sel[0]);
  and (and_c[17], c[17], sel[1], not_sel0);
  and (and_d[17], d[17], sel[1], sel[0]);
  or  (out[17], and_a[17], and_b[17], and_c[17], and_d[17]);

  and (and_a[18], a[18], not_sel1, not_sel0);
  and (and_b[18], b[18], not_sel1, sel[0]);
  and (and_c[18], c[18], sel[1], not_sel0);
  and (and_d[18], d[18], sel[1], sel[0]);
  or  (out[18], and_a[18], and_b[18], and_c[18], and_d[18]);

  and (and_a[19], a[19], not_sel1, not_sel0);
  and (and_b[19], b[19], not_sel1, sel[0]);
  and (and_c[19], c[19], sel[1], not_sel0);
  and (and_d[19], d[19], sel[1], sel[0]);
  or  (out[19], and_a[19], and_b[19], and_c[19], and_d[19]);

  and (and_a[20], a[20], not_sel1, not_sel0);
  and (and_b[20], b[20], not_sel1, sel[0]);
  and (and_c[20], c[20], sel[1], not_sel0);
  and (and_d[20], d[20], sel[1], sel[0]);
  or  (out[20], and_a[20], and_b[20], and_c[20], and_d[20]);

  and (and_a[21], a[21], not_sel1, not_sel0);
  and (and_b[21], b[21], not_sel1, sel[0]);
  and (and_c[21], c[21], sel[1], not_sel0);
  and (and_d[21], d[21], sel[1], sel[0]);
  or  (out[21], and_a[21], and_b[21], and_c[21], and_d[21]);

  and (and_a[22], a[22], not_sel1, not_sel0);
  and (and_b[22], b[22], not_sel1, sel[0]);
  and (and_c[22], c[22], sel[1], not_sel0);
  and (and_d[22], d[22], sel[1], sel[0]);
  or  (out[22], and_a[22], and_b[22], and_c[22], and_d[22]);

  and (and_a[23], a[23], not_sel1, not_sel0);
  and (and_b[23], b[23], not_sel1, sel[0]);
  and (and_c[23], c[23], sel[1], not_sel0);
  and (and_d[23], d[23], sel[1], sel[0]);
  or  (out[23], and_a[23], and_b[23], and_c[23], and_d[23]);

  and (and_a[24], a[24], not_sel1, not_sel0);
  and (and_b[24], b[24], not_sel1, sel[0]);
  and (and_c[24], c[24], sel[1], not_sel0);
  and (and_d[24], d[24], sel[1], sel[0]);
  or  (out[24], and_a[24], and_b[24], and_c[24], and_d[24]);

  and (and_a[25], a[25], not_sel1, not_sel0);
  and (and_b[25], b[25], not_sel1, sel[0]);
  and (and_c[25], c[25], sel[1], not_sel0);
  and (and_d[25], d[25], sel[1], sel[0]);
  or  (out[25], and_a[25], and_b[25], and_c[25], and_d[25]);

  and (and_a[26], a[26], not_sel1, not_sel0);
  and (and_b[26], b[26], not_sel1, sel[0]);
  and (and_c[26], c[26], sel[1], not_sel0);
  and (and_d[26], d[26], sel[1], sel[0]);
  or  (out[26], and_a[26], and_b[26], and_c[26], and_d[26]);

  and (and_a[27], a[27], not_sel1, not_sel0);
  and (and_b[27], b[27], not_sel1, sel[0]);
  and (and_c[27], c[27], sel[1], not_sel0);
  and (and_d[27], d[27], sel[1], sel[0]);
  or  (out[27], and_a[27], and_b[27], and_c[27], and_d[27]);

  and (and_a[28], a[28], not_sel1, not_sel0);
  and (and_b[28], b[28], not_sel1, sel[0]);
  and (and_c[28], c[28], sel[1], not_sel0);
  and (and_d[28], d[28], sel[1], sel[0]);
  or  (out[28], and_a[28], and_b[28], and_c[28], and_d[28]);

  and (and_a[29], a[29], not_sel1, not_sel0);
  and (and_b[29], b[29], not_sel1, sel[0]);
  and (and_c[29], c[29], sel[1], not_sel0);
  and (and_d[29], d[29], sel[1], sel[0]);
  or  (out[29], and_a[29], and_b[29], and_c[29], and_d[29]);

  and (and_a[30], a[30], not_sel1, not_sel0);
  and (and_b[30], b[30], not_sel1, sel[0]);
  and (and_c[30], c[30], sel[1], not_sel0);
  and (and_d[30], d[30], sel[1], sel[0]);
  or  (out[30], and_a[30], and_b[30], and_c[30], and_d[30]);

  and (and_a[31], a[31], not_sel1, not_sel0);
  and (and_b[31], b[31], not_sel1, sel[0]);
  and (and_c[31], c[31], sel[1], not_sel0);
  and (and_d[31], d[31], sel[1], sel[0]);
  or  (out[31], and_a[31], and_b[31], and_c[31], and_d[31]);

endmodule

module mux32x1_32bit(
    input [31:0] value0,value1,value2,value3,value4,value5,value6,value7,
                 value8,value9,value10,value11,value12,value13,value14,value15,
                 value16,value17,value18,value19,value20,value21,value22,value23,
                 value24,value25,value26,value27,value28,value29,value30,value31,

    input [4:0] select,
    output [31:0] result

);

wire [31:0] connectors [9:0];

mux4x1_32bit a1(.a(value0),.b(value1),.c(value2),.d(value3),.sel(select[1:0]),.out(connectors[0]));
mux4x1_32bit a2(.a(value4),.b(value5),.c(value6),.d(value7),.sel(select[1:0]),.out(connectors[1]));
mux4x1_32bit a3(.a(value8),.b(value9),.c(value10),.d(value11),.sel(select[1:0]),.out(connectors[2]));
mux4x1_32bit a4(.a(value12),.b(value13),.c(value14),.d(value15),.sel(select[1:0]),.out(connectors[3]));
mux4x1_32bit a5(.a(value16),.b(value17),.c(value18),.d(value19),.sel(select[1:0]),.out(connectors[4]));
mux4x1_32bit a6(.a(value20),.b(value21),.c(value22),.d(value23),.sel(select[1:0]),.out(connectors[5]));
mux4x1_32bit a7(.a(value24),.b(value25),.c(value26),.d(value27),.sel(select[1:0]),.out(connectors[6]));
mux4x1_32bit a8(.a(value28),.b(value29),.c(value30),.d(value31),.sel(select[1:0]),.out(connectors[7]));

mux4x1_32bit a9(.a(connectors[0]),.b(connectors[1]),.c(connectors[2]),.d(connectors[3]),.sel(select[3:2]),.out(connectors[8]));
mux4x1_32bit a10(.a(connectors[4]),.b(connectors[5]),.c(connectors[6]),.d(connectors[7]),.sel(select[3:2]),.out(connectors[9]));

mux2x1_32bit a11(.a(connectors[8]),.b(connectors[9]),.sel(select[4]),.out(result));

endmodule

module not32bit (
    input [31:0] in,
    output [31:0] out
);

  not (out[0], in[0]);
  not (out[1], in[1]);
  not (out[2], in[2]);
  not (out[3], in[3]);
  not (out[4], in[4]);
  not (out[5], in[5]);
  not (out[6], in[6]);
  not (out[7], in[7]);
  not (out[8], in[8]);
  not (out[9], in[9]);
  not (out[10], in[10]);
  not (out[11], in[11]);
  not (out[12], in[12]);
  not (out[13], in[13]);
  not (out[14], in[14]);
  not (out[15], in[15]);
  not (out[16], in[16]);
  not (out[17], in[17]);
  not (out[18], in[18]);
  not (out[19], in[19]);
  not (out[20], in[20]);
  not (out[21], in[21]);
  not (out[22], in[22]);
  not (out[23], in[23]);
  not (out[24], in[24]);
  not (out[25], in[25]);
  not (out[26], in[26]);
  not (out[27], in[27]);
  not (out[28], in[28]);
  not (out[29], in[29]);
  not (out[30], in[30]);
  not (out[31], in[31]);

endmodule


module and32bit (
    input [31:0] in,
    output out
);

  wire and_result1, and_result2, and_result3, and_result4;

  and (and_result1, in[0], in[1], in[2], in[3]);
  and (and_result2, in[4], in[5], in[6], in[7]);
  and (and_result3, in[8], in[9], in[10], in[11]);
  and (and_result4, in[12], in[13], in[14], in[15]);

  wire and_result5, and_result6, and_result7, and_result8;

  and (and_result5, in[16], in[17], in[18], in[19]);
  and (and_result6, in[20], in[21], in[22], in[23]);
  and (and_result7, in[24], in[25], in[26], in[27]);
  and (and_result8, in[28], in[29], in[30], in[31]);

  wire final_and_result;

  and (final_and_result, and_result1, and_result2, and_result3, and_result4);
  and (out, final_and_result, and_result5, and_result6, and_result7, and_result8);

endmodule

module decoder5x32(
    input [4:0] sel,
    output [31:0] out
);
    wire [4:0] neg_sel;

    not(neg_sel[0], sel[0]);
    not(neg_sel[1], sel[1]);
    not(neg_sel[2], sel[2]);
    not(neg_sel[3], sel[3]);
    not(neg_sel[4], sel[4]);

    and(out[0],  neg_sel[4], neg_sel[3], neg_sel[2], neg_sel[1], neg_sel[0]);
    and(out[1],  neg_sel[4], neg_sel[3], neg_sel[2], neg_sel[1], sel[0]);
    and(out[2],  neg_sel[4], neg_sel[3], neg_sel[2], sel[1],  neg_sel[0]);
    and(out[3],  neg_sel[4], neg_sel[3], neg_sel[2], sel[1],  sel[0]);
    and(out[4],  neg_sel[4], neg_sel[3], sel[2],  neg_sel[1], neg_sel[0]);
    and(out[5],  neg_sel[4], neg_sel[3], sel[2],  neg_sel[1], sel[0]);
    and(out[6],  neg_sel[4], neg_sel[3], sel[2],  sel[1],  neg_sel[0]);
    and(out[7],  neg_sel[4], neg_sel[3], sel[2],  sel[1],  sel[0]);
    and(out[8],  neg_sel[4], sel[3],  neg_sel[2], neg_sel[1], neg_sel[0]);
    and(out[9],  neg_sel[4], sel[3],  neg_sel[2], neg_sel[1], sel[0]);
    and(out[10], neg_sel[4], sel[3],  neg_sel[2], sel[1],  neg_sel[0]);
    and(out[11], neg_sel[4], sel[3],  neg_sel[2], sel[1],  sel[0]);
    and(out[12], neg_sel[4], sel[3],  sel[2],  neg_sel[1], neg_sel[0]);
    and(out[13], neg_sel[4], sel[3],  sel[2],  neg_sel[1], sel[0]);
    and(out[14], neg_sel[4], sel[3],  sel[2],  sel[1],  neg_sel[0]);
    and(out[15], neg_sel[4], sel[3],  sel[2],  sel[1],  sel[0]);
    and(out[16], sel[4],  neg_sel[3], neg_sel[2], neg_sel[1], neg_sel[0]);
    and(out[17], sel[4],  neg_sel[3], neg_sel[2], neg_sel[1], sel[0]);
    and(out[18], sel[4],  neg_sel[3], neg_sel[2], sel[1],  neg_sel[0]);
    and(out[19], sel[4],  neg_sel[3], neg_sel[2], sel[1],  sel[0]);
    and(out[20], sel[4],  neg_sel[3], sel[2],  neg_sel[1], neg_sel[0]);
    and(out[21], sel[4],  neg_sel[3], sel[2],  neg_sel[1], sel[0]);
    and(out[22], sel[4],  neg_sel[3], sel[2],  sel[1],  neg_sel[0]);
    and(out[23], sel[4],  neg_sel[3], sel[2],  sel[1],  sel[0]);
    and(out[24], sel[4],  sel[3],  neg_sel[2], neg_sel[1], neg_sel[0]);
    and(out[25], sel[4],  sel[3],  neg_sel[2], neg_sel[1], sel[0]);
    and(out[26], sel[4],  sel[3],  neg_sel[2], sel[1],  neg_sel[0]);
    and(out[27], sel[4],  sel[3],  neg_sel[2], sel[1],  sel[0]);
    and(out[28], sel[4],  sel[3],  sel[2],  neg_sel[1], neg_sel[0]);
    and(out[29], sel[4],  sel[3],  sel[2],  neg_sel[1], sel[0]);
    and(out[30], sel[4],  sel[3],  sel[2],  sel[1],  neg_sel[0]);
    and(out[31], sel[4],  sel[3],  sel[2],  sel[1],  sel[0]);

endmodule


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////