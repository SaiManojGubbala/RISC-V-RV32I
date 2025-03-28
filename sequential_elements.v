`include "elements.v"

module D_FF (output Q, input D, input Clk);
    wire n1, n2, n3, n4, n5, n6, n7, n8;
    wire Qbar;  // Internal inverted Q
    
    // Inverted Clock
    wire Clk_bar;
    not (Clk_bar, Clk);

    // First Stage (Master Latch)
    nand (n1, D, Clk_bar);
    nand (n2, ~D, Clk_bar);
    nand (n3, n1, n4);
    nand (n4, n2, n3);

    // Second Stage (Slave Latch)
    nand (n5, n3, Clk);
    nand (n6, n4, Clk);
    nand (n7, n5, Qbar);
    nand (n8, n6, Q);
    
    assign Q = n7;
    assign Qbar = n8;
endmodule  //positive edge triggered d flipflop

module register_32bit(input [31:0] D, input Clk, output [31:0] Out);

D_FF a1(.D(D[0]),.Clk(Clk),.Q(Out[0]));
D_FF a2(.D(D[1]),.Clk(Clk),.Q(Out[1]));
D_FF a3(.D(D[2]),.Clk(Clk),.Q(Out[2]));
D_FF a4(.D(D[3]),.Clk(Clk),.Q(Out[3]));
D_FF a5(.D(D[4]),.Clk(Clk),.Q(Out[4]));
D_FF a6(.D(D[5]),.Clk(Clk),.Q(Out[5]));
D_FF a7(.D(D[6]),.Clk(Clk),.Q(Out[6]));
D_FF a8(.D(D[7]),.Clk(Clk),.Q(Out[7]));

D_FF a9(.D(D[8]),.Clk(Clk),.Q(Out[8]));
D_FF a10(.D(D[9]),.Clk(Clk),.Q(Out[9]));
D_FF a11(.D(D[10]),.Clk(Clk),.Q(Out[10]));
D_FF a12(.D(D[11]),.Clk(Clk),.Q(Out[11]));
D_FF a13(.D(D[12]),.Clk(Clk),.Q(Out[12]));
D_FF a14(.D(D[13]),.Clk(Clk),.Q(Out[13]));
D_FF a15(.D(D[14]),.Clk(Clk),.Q(Out[14]));
D_FF a16(.D(D[15]),.Clk(Clk),.Q(Out[15]));

D_FF a17(.D(D[16]),.Clk(Clk),.Q(Out[16]));
D_FF a18(.D(D[17]),.Clk(Clk),.Q(Out[17]));
D_FF a19(.D(D[18]),.Clk(Clk),.Q(Out[18]));
D_FF a20(.D(D[19]),.Clk(Clk),.Q(Out[19]));
D_FF a21(.D(D[20]),.Clk(Clk),.Q(Out[20]));
D_FF a22(.D(D[21]),.Clk(Clk),.Q(Out[21]));
D_FF a23(.D(D[22]),.Clk(Clk),.Q(Out[22]));
D_FF a24(.D(D[23]),.Clk(Clk),.Q(Out[23]));

D_FF a25(.D(D[24]),.Clk(Clk),.Q(Out[24]));
D_FF a26(.D(D[25]),.Clk(Clk),.Q(Out[25]));
D_FF a27(.D(D[26]),.Clk(Clk),.Q(Out[26]));
D_FF a28(.D(D[27]),.Clk(Clk),.Q(Out[27]));
D_FF a29(.D(D[28]),.Clk(Clk),.Q(Out[28]));
D_FF a30(.D(D[29]),.Clk(Clk),.Q(Out[29]));
D_FF a31(.D(D[30]),.Clk(Clk),.Q(Out[30]));
D_FF a32(.D(D[31]),.Clk(Clk),.Q(Out[31]));

endmodule


module d_flipflop(
    input D, Clk, Clear,
    output Q
);
    wire connector;
    D_FF a0(.Q(Q),.D(connector),.Clk(Clk));
    mux2x1 a1(.A({D,1'b0}),.S(Clear),.Y(connector));


endmodule

module register_32bit_c(input [31:0] D,input Clear, input Clk, output [31:0] Out);

d_flipflop a1(.D(D[0]),.Clk(Clk),.Clear(Clear),.Q(Out[0]));
d_flipflop a2(.D(D[1]),.Clk(Clk),.Clear(Clear),.Q(Out[1]));
d_flipflop a3(.D(D[2]),.Clk(Clk),.Clear(Clear),.Q(Out[2]));
d_flipflop a4(.D(D[3]),.Clk(Clk),.Clear(Clear),.Q(Out[3]));
d_flipflop a5(.D(D[4]),.Clk(Clk),.Clear(Clear),.Q(Out[4]));
d_flipflop a6(.D(D[5]),.Clk(Clk),.Clear(Clear),.Q(Out[5]));
d_flipflop a7(.D(D[6]),.Clk(Clk),.Clear(Clear),.Q(Out[6]));
d_flipflop a8(.D(D[7]),.Clk(Clk),.Clear(Clear),.Q(Out[7]));

d_flipflop a9(.D(D[8]),.Clk(Clk),.Clear(Clear),.Q(Out[8]));
d_flipflop a10(.D(D[9]),.Clk(Clk),.Clear(Clear),.Q(Out[9]));
d_flipflop a11(.D(D[10]),.Clk(Clk),.Clear(Clear),.Q(Out[10]));
d_flipflop a12(.D(D[11]),.Clk(Clk),.Clear(Clear),.Q(Out[11]));
d_flipflop a13(.D(D[12]),.Clk(Clk),.Clear(Clear),.Q(Out[12]));
d_flipflop a14(.D(D[13]),.Clk(Clk),.Clear(Clear),.Q(Out[13]));
d_flipflop a15(.D(D[14]),.Clk(Clk),.Clear(Clear),.Q(Out[14]));
d_flipflop a16(.D(D[15]),.Clk(Clk),.Clear(Clear),.Q(Out[15]));

d_flipflop a17(.D(D[16]),.Clk(Clk),.Clear(Clear),.Q(Out[16]));
d_flipflop a18(.D(D[17]),.Clk(Clk),.Clear(Clear),.Q(Out[17]));
d_flipflop a19(.D(D[18]),.Clk(Clk),.Clear(Clear),.Q(Out[18]));
d_flipflop a20(.D(D[19]),.Clk(Clk),.Clear(Clear),.Q(Out[19]));
d_flipflop a21(.D(D[20]),.Clk(Clk),.Clear(Clear),.Q(Out[20]));
d_flipflop a22(.D(D[21]),.Clk(Clk),.Clear(Clear),.Q(Out[21]));
d_flipflop a23(.D(D[22]),.Clk(Clk),.Clear(Clear),.Q(Out[22]));
d_flipflop a24(.D(D[23]),.Clk(Clk),.Clear(Clear),.Q(Out[23]));

d_flipflop a25(.D(D[24]),.Clk(Clk),.Clear(Clear),.Q(Out[24]));
d_flipflop a26(.D(D[25]),.Clk(Clk),.Clear(Clear),.Q(Out[25]));
d_flipflop a27(.D(D[26]),.Clk(Clk),.Clear(Clear),.Q(Out[26]));
d_flipflop a28(.D(D[27]),.Clk(Clk),.Clear(Clear),.Q(Out[27]));
d_flipflop a29(.D(D[28]),.Clk(Clk),.Clear(Clear),.Q(Out[28]));
d_flipflop a30(.D(D[29]),.Clk(Clk),.Clear(Clear),.Q(Out[29]));
d_flipflop a31(.D(D[30]),.Clk(Clk),.Clear(Clear),.Q(Out[30]));
d_flipflop a32(.D(D[31]),.Clk(Clk),.Clear(Clear),.Q(Out[31]));

endmodule

module d_flipflop_en(
    input D, Clk, Stall,
    output Q
);
    wire connector;
    D_FF a0(.Q(Q),.D(connector),.Clk(Clk));
    mux2x1 a1(.A({D,Q}),.S(Stall),.Y(connector));

endmodule

module register_32bit_en(input [31:0] D,input Stall, input Clk, output [31:0] Out);

d_flipflop_en a1(.D(D[0]),.Clk(Clk),.Stall(Stall),.Q(Out[0]));
d_flipflop_en a2(.D(D[1]),.Clk(Clk),.Stall(Stall),.Q(Out[1]));
d_flipflop_en a3(.D(D[2]),.Clk(Clk),.Stall(Stall),.Q(Out[2]));
d_flipflop_en a4(.D(D[3]),.Clk(Clk),.Stall(Stall),.Q(Out[3]));
d_flipflop_en a5(.D(D[4]),.Clk(Clk),.Stall(Stall),.Q(Out[4]));
d_flipflop_en a6(.D(D[5]),.Clk(Clk),.Stall(Stall),.Q(Out[5]));
d_flipflop_en a7(.D(D[6]),.Clk(Clk),.Stall(Stall),.Q(Out[6]));
d_flipflop_en a8(.D(D[7]),.Clk(Clk),.Stall(Stall),.Q(Out[7]));

d_flipflop_en a9(.D(D[8]),.Clk(Clk),.Stall(Stall),.Q(Out[8]));
d_flipflop_en a10(.D(D[9]),.Clk(Clk),.Stall(Stall),.Q(Out[9]));
d_flipflop_en a11(.D(D[10]),.Clk(Clk),.Stall(Stall),.Q(Out[10]));
d_flipflop_en a12(.D(D[11]),.Clk(Clk),.Stall(Stall),.Q(Out[11]));
d_flipflop_en a13(.D(D[12]),.Clk(Clk),.Stall(Stall),.Q(Out[12]));
d_flipflop_en a14(.D(D[13]),.Clk(Clk),.Stall(Stall),.Q(Out[13]));
d_flipflop_en a15(.D(D[14]),.Clk(Clk),.Stall(Stall),.Q(Out[14]));
d_flipflop_en a16(.D(D[15]),.Clk(Clk),.Stall(Stall),.Q(Out[15]));

d_flipflop_en a17(.D(D[16]),.Clk(Clk),.Stall(Stall),.Q(Out[16]));
d_flipflop_en a18(.D(D[17]),.Clk(Clk),.Stall(Stall),.Q(Out[17]));
d_flipflop_en a19(.D(D[18]),.Clk(Clk),.Stall(Stall),.Q(Out[18]));
d_flipflop_en a20(.D(D[19]),.Clk(Clk),.Stall(Stall),.Q(Out[19]));
d_flipflop_en a21(.D(D[20]),.Clk(Clk),.Stall(Stall),.Q(Out[20]));
d_flipflop_en a22(.D(D[21]),.Clk(Clk),.Stall(Stall),.Q(Out[21]));
d_flipflop_en a23(.D(D[22]),.Clk(Clk),.Stall(Stall),.Q(Out[22]));
d_flipflop_en a24(.D(D[23]),.Clk(Clk),.Stall(Stall),.Q(Out[23]));

d_flipflop_en a25(.D(D[24]),.Clk(Clk),.Stall(Stall),.Q(Out[24]));
d_flipflop_en a26(.D(D[25]),.Clk(Clk),.Stall(Stall),.Q(Out[25]));
d_flipflop_en a27(.D(D[26]),.Clk(Clk),.Stall(Stall),.Q(Out[26]));
d_flipflop_en a28(.D(D[27]),.Clk(Clk),.Stall(Stall),.Q(Out[27]));
d_flipflop_en a29(.D(D[28]),.Clk(Clk),.Stall(Stall),.Q(Out[28]));
d_flipflop_en a30(.D(D[29]),.Clk(Clk),.Stall(Stall),.Q(Out[29]));
d_flipflop_en a31(.D(D[30]),.Clk(Clk),.Stall(Stall),.Q(Out[30]));
d_flipflop_en a32(.D(D[31]),.Clk(Clk),.Stall(Stall),.Q(Out[31]));

endmodule

module d_flipflop_cen(
    input D, Clk, Stall,Clear,
    output Q
);
    wire connector;
    wire connec;
    D_FF a0(.Q(Q),.D(connec),.Clk(Clk));
    mux2x1 a1(.A({D,Q}),.S(Stall),.Y(connector));
    mux2x1 a2(.A({connector,1'b0}),.S(Clear),.Y(connec));

endmodule

module register_32bit_cen(input [31:0] D,input Stall, input Clear, input Clk, output [31:0] Out);

d_flipflop_cen a1(.D(D[0]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[0]));
d_flipflop_cen a2(.D(D[1]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[1]));
d_flipflop_cen a3(.D(D[2]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[2]));
d_flipflop_cen a4(.D(D[3]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[3]));
d_flipflop_cen a5(.D(D[4]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[4]));
d_flipflop_cen a6(.D(D[5]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[5]));
d_flipflop_cen a7(.D(D[6]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[6]));
d_flipflop_cen a8(.D(D[7]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[7]));

d_flipflop_cen a9(.D(D[8]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[8]));
d_flipflop_cen a10(.D(D[9]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[9]));
d_flipflop_cen a11(.D(D[10]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[10]));
d_flipflop_cen a12(.D(D[11]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[11]));
d_flipflop_cen a13(.D(D[12]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[12]));
d_flipflop_cen a14(.D(D[13]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[13]));
d_flipflop_cen a15(.D(D[14]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[14]));
d_flipflop_cen a16(.D(D[15]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[15]));

d_flipflop_cen a17(.D(D[16]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[16]));
d_flipflop_cen a18(.D(D[17]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[17]));
d_flipflop_cen a19(.D(D[18]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[18]));
d_flipflop_cen a20(.D(D[19]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[19]));
d_flipflop_cen a21(.D(D[20]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[20]));
d_flipflop_cen a22(.D(D[21]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[21]));
d_flipflop_cen a23(.D(D[22]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[22]));
d_flipflop_cen a24(.D(D[23]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[23]));

d_flipflop_cen a25(.D(D[24]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[24]));
d_flipflop_cen a26(.D(D[25]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[25]));
d_flipflop_cen a27(.D(D[26]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[26]));
d_flipflop_cen a28(.D(D[27]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[27]));
d_flipflop_cen a29(.D(D[28]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[28]));
d_flipflop_cen a30(.D(D[29]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[29]));
d_flipflop_cen a31(.D(D[30]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[30]));
d_flipflop_cen a32(.D(D[31]),.Clk(Clk),.Clear(Clear),.Stall(Stall),.Q(Out[31]));

endmodule
