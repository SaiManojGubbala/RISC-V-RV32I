`include "sequential_elements.v"

module d_e_cpip(
    input Clear,
    input regwrite_d,Clk,memwrite_d,
    input is_jump_d,is_branch_d,is_jalr_d,
    input [1:0] result_src_d,
    input [1:0] load_sel_d,
    input [2:0] store_sel_d,
    input [3:0] alu_control_d,
    input  alu_srca_d,
    input [1:0] alu_srcb_d,
    output regwrite_e,memwrite_e,
    output is_jump_e,is_branch_e,is_jalr_e,
    output [1:0] result_src_e,
    output [1:0] load_sel_e,
    output [2:0] store_sel_e,
    output [3:0] alu_control_e,
    output alu_srca_e,
    output [1:0] alu_srcb_e
);

d_flipflop a1(.D(regwrite_d), .Clk(Clk), .Clear(Clear), .Q(regwrite_e));
d_flipflop a2(.D(memwrite_d), .Clk(Clk), .Clear(Clear), .Q(memwrite_e));
d_flipflop a3(.D(is_branch_d), .Clk(Clk), .Clear(Clear), .Q(is_branch_e));
d_flipflop a4(.D(is_jump_d), .Clk(Clk), .Clear(Clear), .Q(is_jump_e));
d_flipflop a5(.D(is_jalr_d), .Clk(Clk), .Clear(Clear), .Q(is_jalr_e));
d_flipflop a6(.D(alu_srca_d), .Clk(Clk), .Clear(Clear), .Q(alu_srca_e));

d_flipflop a7(.D(alu_srcb_d[0]), .Clk(Clk), .Clear(Clear), .Q(alu_srcb_e[0]));
d_flipflop a8(.D(alu_srcb_d[1]), .Clk(Clk), .Clear(Clear), .Q(alu_srcb_e[1]));

d_flipflop a9(.D(result_src_d[0]), .Clk(Clk), .Clear(Clear), .Q(result_src_e[0]));
d_flipflop a10(.D(result_src_d[1]), .Clk(Clk), .Clear(Clear), .Q(result_src_e[1]));

d_flipflop a11(.D(load_sel_d[0]), .Clk(Clk), .Clear(Clear), .Q(load_sel_e[0]));
d_flipflop a12(.D(load_sel_d[1]), .Clk(Clk), .Clear(Clear), .Q(load_sel_e[1]));

d_flipflop a13(.D(store_sel_d[0]), .Clk(Clk), .Clear(Clear), .Q(store_sel_e[0]));
d_flipflop a14(.D(store_sel_d[1]), .Clk(Clk), .Clear(Clear), .Q(store_sel_e[1]));
d_flipflop a15(.D(store_sel_d[2]), .Clk(Clk), .Clear(Clear), .Q(store_sel_e[2]));

d_flipflop a16(.D(alu_control_d[0]), .Clk(Clk), .Clear(Clear), .Q(alu_control_e[0]));
d_flipflop a17(.D(alu_control_d[1]), .Clk(Clk), .Clear(Clear), .Q(alu_control_e[1]));
d_flipflop a18(.D(alu_control_d[2]), .Clk(Clk), .Clear(Clear), .Q(alu_control_e[2]));
d_flipflop a19(.D(alu_control_d[3]), .Clk(Clk), .Clear(Clear), .Q(alu_control_e[3]));

endmodule