`include "sequential_elements.v"

module Program_Counter(
    input Clk, Stall,
    input [31:0] Pc,
    output [31:0] Next_Pc
);

register_32bit_en a1(.D(Pc),.Clk(Clk),.Stall(Stall),.Q(Next_Pc));

endmodule