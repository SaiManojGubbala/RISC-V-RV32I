`include "sequential_elements.v"

module f_d_dpip(
    input Clk,Stall,Clear,
    input [31:0] Ins_f,Pc_f,Pc_plus_f,
    output [31:0] Ins_d,Pc_d,Pc_plus_d
);

register_32bit_cen a1(.D(Ins_f), .Clear(Clear), .Stall(Stall), .Clk(Clk), .Out(Ins_d));
register_32bit_cen a2(.D(Pc_f), .Clear(Clear), .Stall(Stall), .Clk(Clk), .Out(Pc_d));
register_32bit_cen a3(.D(Pc_plus_f), .Clear(Clear), .Stall(Stall), .Clk(Clk), .Out(Pc_plus_d));


endmodule