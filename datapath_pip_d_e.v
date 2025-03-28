`include "sequential_elements.v"

module d_e_dpip(
    input Clk,Clear,
    input [31:0] Op1_d, Op2_d, Pc_d,Imm_d,pc_plus4_d,
    input [4:0] Rs1_d,Rs2_d,Rd_d,
    output [31:0] Op1_e, Op2_e, Pc_e,Imm_e,pc_plus4_e,
    output [4:0] Rs1_e,Rs2_e,Rd_e
);

register_32bit_c a1(.D(Op1_d),.Clear(Clear),.Clk(Clk),.Out(Op2_d));
register_32bit_c a2(.D(Op2_d),.Clear(Clear),.Clk(Clk),.Out(Op2_e));
register_32bit_c a3(.D(Pc_d),.Clear(Clear),.Clk(Clk),.Out(Pc_e));
register_32bit_c a4(.D(Imm_d),.Clear(Clear),.Clk(Clk),.Out(Imm_e));
register_32bit_c a5(.D(pc_plus4_d),.Clear(Clear),.Clk(Clk),.Out(pc_plus4_e));

d_flipflop a6(.D(Rs1_d[0]), .Clk(Clk), .Clear(Clear), .Q(Rs1_e[0]));
d_flipflop a7(.D(Rs1_d[1]), .Clk(Clk), .Clear(Clear), .Q(Rs1_e[1]));
d_flipflop a8(.D(Rs1_d[2]), .Clk(Clk), .Clear(Clear), .Q(Rs1_e[2]));
d_flipflop a9(.D(Rs1_d[3]), .Clk(Clk), .Clear(Clear), .Q(Rs1_e[3]));
d_flipflop a10(.D(Rs1_d[4]), .Clk(Clk), .Clear(Clear), .Q(Rs1_e[4]));

d_flipflop a11(.D(Rs2_d[0]), .Clk(Clk), .Clear(Clear), .Q(Rs2_e[0]));
d_flipflop a12(.D(Rs2_d[1]), .Clk(Clk), .Clear(Clear), .Q(Rs2_e[1]));
d_flipflop a13(.D(Rs2_d[2]), .Clk(Clk), .Clear(Clear), .Q(Rs2_e[2]));
d_flipflop a14(.D(Rs2_d[3]), .Clk(Clk), .Clear(Clear), .Q(Rs2_e[3]));
d_flipflop a15(.D(Rs2_d[4]), .Clk(Clk), .Clear(Clear), .Q(Rs2_e[4]));

d_flipflop a16(.D(Rd_d[0]), .Clk(Clk), .Clear(Clear), .Q(Rd_e[0]));
d_flipflop a17(.D(Rd_d[1]), .Clk(Clk), .Clear(Clear), .Q(Rd_e[1]));
d_flipflop a18(.D(Rd_d[2]), .Clk(Clk), .Clear(Clear), .Q(Rd_e[2]));
d_flipflop a19(.D(Rd_d[3]), .Clk(Clk), .Clear(Clear), .Q(Rd_e[3]));
d_flipflop a20(.D(Rd_d[4]), .Clk(Clk), .Clear(Clear), .Q(Rd_e[4]));

endmodule