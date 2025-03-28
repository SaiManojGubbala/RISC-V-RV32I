`include "elements.v"

module branch (
    input branch_u,Zero_f,Sign_f,is_branch,is_jump,
    input [2:0] funct_3,
    output pc_jump
);
wire [3:0]connector;
mux2x1 a0(.A({Sign_f,branch_u}),.S(funct_3[1]),.Y(connector[0]));
mux2x1 a1(.A({Zero_f,connector[0]}),.S(funct_3[2]),.Y(connector[1]));
xor (connector[2],connector[1],funct_3[0]);
and(connector[3],connector[2],is_branch);
or(pc_jump,connector[3],is_jump);

endmodule //branch