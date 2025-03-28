`include "sequential_elements.v"

module mem_w_dpip(
    input [31:0] alu_result_m, read_data_m, pc_plus4_m,
    input [4:0] rd_m,
    input Clk,
    output [31:0] alu_result_w, read_data_w, pc_plus4_w,
    output [4:0] rd_w
);

register_32bit a1(.D(alu_result_m),.Clk(Clk),.Out(alu_result_w));
register_32bit a2(.D(read_data_m),.Clk(Clk),.Out(read_data_w));
register_32bit a3(.D(pc_plus4_m),.Clk(Clk),.Out(pc_plus4_w));

 D_FF h1(.Q(rd_w[0]), .D(rd_m[0]), .Clk(Clk));
 D_FF h2(.Q(rd_w[1]), .D(rd_m[1]), .Clk(Clk));
 D_FF h3(.Q(rd_w[2]), .D(rd_m[2]), .Clk(Clk));
 D_FF h4(.Q(rd_w[3]), .D(rd_m[3]), .Clk(Clk));



endmodule