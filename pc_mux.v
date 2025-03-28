`include "elements.v"

module pc_mux (input [31:0] add_extend, add_reg,pc_plus4,input is_jalr,pc_jump,output [31:0] next_pc);

wire [31:0] connectors;
mux2x1_32bit a1(.a(add_extend),.b(add_reg),.sel(is_jalr),.out(connectors));
mux2x1_32bit a2(.a(pc_plus4),.b(connectors),.sel(pc_jump),.out(next_pc));


endmodule