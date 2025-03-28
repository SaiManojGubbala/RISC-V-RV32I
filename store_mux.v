`include "elements.v"

module store_mux (
    input [1:0] sel, 
    input [31:0] store_value,
    output [31:0] store
);
// 00 - SB
// 01 - SH
// 10 - SW currently making it 1x - SW
wire [31:0] connect;
mux2x1_32bit a1(.a({24'b0,store_value[7:0]}),.b({16'b0,store_value[15:0]}),.sel(sel[0]),.out(connect));
mux2x1_32bit a2(.a(connect),.b(store_value),.sel(sel[1]),.out(connect));

endmodule //store_mux