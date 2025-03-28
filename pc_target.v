`include "elements.v"
// pc_plus4 add_extend

module pc_add4 (
    input [31:0] pc,
    output [31:0] pc_plus4
);
wire unused;
ad32 a1(.a(pc),.b(32'h00000004),.c(1'b0),.sum(pc_plus4),.carry(unused));

endmodule //pc_target

module pc_addimm (
    input [31:0] pc, imm_value,
    output [31:0] add_extend
);

wire unused;
ad32 a2(.a(pc),.b(imm_value),.c(1'b0),.sum(add_extend),.carry(unused));

endmodule //pc_target