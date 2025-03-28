`include "elements.v"

module forwardinng_mux1(
    input [31:0] Operand1,Result_W,Mem_Addr,
    input [1:0] Select,
    output [31:0] forward_a
);
wire [31:0] connector;
mux2x1_32bit a1(.a(Operand1),.b(Result_W),.sel(Select[0]),.out(connector));
mux2x1_32bit a2(.a(connector),.b(Mem_Addr),.sel(Select[1]),.out(forward_a));

endmodule

module forwarding_mux2(
    input [31:0] Operand2,Result_W,Mem_Addr,
    input [1:0] Select,
    output [31:0] forward_b
);
wire [31:0] connector;
mux2x1_32bit b1(.a(Operand2),.b(),.sel(Select[0]),.out(connector));
mux2x1_32bit b2(.a(connector),.b(Mem_Addr),.sel(Select[1]),.out(forward_b));

endmodule