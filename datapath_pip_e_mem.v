`include "sequential_elements.v"

module mem_w_dpip(
    input [31:0] alu_result_e, write_data_e, pc_plus4_e,
    input [4:0] rd_e,
    input Clk,
    output [31:0] alu_result_m, write_data_m, pc_plus4_m,
    output [4:0] rd_m
);

register_32bit a1(.D(alu_result_e),.Clk(Clk),.Out(alu_result_m));
register_32bit a2(.D(write_data_e),.Clk(Clk),.Out(write_data_m));
register_32bit a3(.D(pc_plus4_e),.Clk(Clk),.Out(pc_plus4_m));

 D_FF h1(.Q(rd_m[0]), .D(rd_e[0]), .Clk(Clk));
 D_FF h2(.Q(rd_m[1]), .D(rd_e[1]), .Clk(Clk));
 D_FF h3(.Q(rd_m[2]), .D(rd_e[2]), .Clk(Clk));
 D_FF h4(.Q(rd_m[3]), .D(rd_e[3]), .Clk(Clk));



endmodule