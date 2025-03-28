`include "sequential_elements.v"

module mem_wb_cpip(
    input regwrite_m,Clk,
    input [1:0] result_src_m,
    output regwrite_w,
    output [1:0] result_src_w
);

D_FF a1(.Q(regwrite_w), .D(regwrite_m), .Clk(Clk));
D_FF a2(.Q(result_src_w[0]), .D(result_src_m[0]), .Clk(Clk));
D_FF a3(.Q(result_src_w[1]), .D(result_src_m[1]), .Clk(Clk));

endmodule