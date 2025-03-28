`include "sequential_elements.v"

module ex_mem_cpip(
    input regwrite_e,Clk,memwrite_e,
    input [1:0] result_src_e,
    input [1:0] load_sel_e,
    input [2:0] store_sel_e,
    output regwrite_m,memwrite_m,
    output [1:0] result_src_m,
    output [1:0] load_sel_m,
    output [2:0] store_sel_m
);

D_FF a1(.Q(regwrite_w), .D(regwrite_m), .Clk(Clk));
D_FF a2(.Q(result_src_m[0]), .D(result_src_e[0]), .Clk(Clk));
D_FF a3(.Q(result_src_m[1]), .D(result_src_e[1]), .Clk(Clk));
D_FF a4(.Q(memwrite_m), .D(memwrite_e), .Clk(Clk));
D_FF a5(.Q(memwrite_m), .D(memwrite_e), .Clk(Clk));

D_FF a6(.Q(load_sel_m[0]), .D(load_sel_e[0]), .Clk(Clk));
D_FF a7(.Q(load_sel_m[1]), .D(load_sel_e[1]), .Clk(Clk));
D_FF a8(.Q(store_sel_m[0]), .D(store_sel_e[0]), .Clk(Clk));
D_FF a9(.Q(store_sel_m[1]), .D(store_sel_e[1]), .Clk(Clk));
D_FF a10(.Q(store_sel_m[2]), .D(store_sel_e[2]), .Clk(Clk));



endmodule