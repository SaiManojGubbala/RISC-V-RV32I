`include "elements.v"

module load_mux(input [2:0] sel, 
    input [31:0] load_value,
    output [31:0] load);

// 000 - LB
// 001 - LH
// 010 - LW
// 100 - LBU
// 101 - LHU
wire [31:0] connectors [0:3];


mux2x1_32bit k1(.a({{24{load_value[31]}},load_value[7:0]}),.b({{16{load_value[31]}},load_value[15:0]}),.sel(sel[0]),.out(connectors[0]));
mux2x1_32bit k2(.a({24'b0,load_value[7:0]}),.b({16'b0,load_value[15:0]}),.sel(sel[0]),.out(connectors[1]));
mux2x1_32bit k3(.a(connectors[0]),.b(connectors[1]),.sel(sel[2]),.out(connectors[2]));
mux2x1_32bit k4(.a(connectors[2]),.b(load_value),.sel(sel[1]),.out(load));

endmodule