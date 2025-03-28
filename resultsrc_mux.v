`include "elements.v"

module resultsrc_mux (
    input [31:0] Alu_Res, Data_Mem, Pc_plus4,
    input [1:0] result_src,
    output [31:0] write_back  
);
wire [31:0] connector;
mux2x1_32bit a1(.a(Alu_Res),.b(Data_Mem),.sel(result_src[1]),.out(connector));
mux2x1_32bit a2(.a(connector),.b(Pc_plus4),.sel(result_src[0]),.out(write_back));


endmodule //resultsrc_mux