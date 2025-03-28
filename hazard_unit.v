`include "sequential_elements.v"

module forward(
   input [4:0] rs_e,rd_m,rd_w,
   input regwrite_m,regwrite_w,
   output [1:0] mux_val
);
// rs_e == rd_m
wire [4:0] connectors0;
xnor(connectors0[0],rs_e[0],rd_m[0]);
xnor(connectors0[1],rs_e[1],rd_m[1]);
xnor(connectors0[2],rs_e[2],rd_m[2]);
xnor(connectors0[3],rs_e[3],rd_m[3]);
wire connectors1;
and(connectors1,connectors0[0],connectors0[1],connectors0[2],connectors0[3]);
//rs_e != 0
wire connectors2;
or(connectors2,rs_e[0],rs_e[1],rs_e[2],rs_e[3]);
// rs_e == rd_w
wire [4:0] connectors3;
xnor(connectors3[0],rs_e[0],rd_w[0]);
xnor(connectors3[1],rs_e[1],rd_w[1]);
xnor(connectors3[2],rs_e[2],rd_w[2]);
xnor(connectors3[3],rs_e[3],rd_w[3]);
wire connectors4;
and(connectors4,connectors3[0],connectors3[1],connectors3[2],connectors3[3]);

wire [1:0] final_mux;
//(Rs_Execute == Rd_Memory)&(RegWrite_M)&(Rs_Execute != 0)
and(final_mux[0],connectors1,connectors2,regwrite_m);
//(Rs_Execute == Rd_Writeback)&(RegWrite_W)&(Rs_Execute != 0)
and(final_mux[1],connectors4,connectors2,regwrite_w);


mux2x1 a1(.A({1'b0,1'b1}),.S(final_mux[0]),.Y(mux_val[1]));
mux2x1 a2(.A({1'b0,1'b1}),.S(final_mux[1]),.Y(mux_val[0]));

endmodule


module hazard_unit(
    input [4:0] rs1_d,rs1_e,rs2_d,rs2_e,
    input [4:0] rd_e,rd_m,rd_w,
    input regwrite_m,regwrite_w,
    input result_src0,pc_jump,
    
    output [1:0] forward_a,forward_b,
    output flush_d,stall_d,stall_f,flush_e 
    );

forward f1(
   .rs_e(rs1_e),.rd_m(rd_m),.rd_w(rd_w),
   .regwrite_m(regwrite_m),.regwrite_w(regwrite_w),
   .mux_val(forward_a)
);

forward f2(
   .rs_e(rs2_e),.rd_m(rd_m),.rd_w(rd_w),
   .regwrite_m(regwrite_m),.regwrite_w(regwrite_w),
   .mux_val(forward_b)
);

//stall =  (Result_Src_0 == 1) & ((Rd_Execute == Rs1_Decode) | (Rd_Execute == Rs2_Decode))
//(Rd_Execute == Rs1_Decode)
wire [3:0] con;
xnor(con[0],rd_e[0],rs1_d[0]);
xnor(con[1],rd_e[1],rs1_d[1]);
xnor(con[2],rd_e[2],rs1_d[2]);
xnor(con[3],rd_e[3],rs1_d[3]);
wire con1;
and(con1,con[0],con[1],con[2],con[3]);
//(Rd_Execute == Rs2_Decode)
wire [3:0] con2;
xnor(con2[0],rd_e[0],rs2_d[0]);
xnor(con2[1],rd_e[1],rs2_d[1]);
xnor(con2[2],rd_e[2],rs2_d[2]);
xnor(con2[3],rd_e[3],rs2_d[3]);
wire con3;
and(con3,con[0],con[1],con[2],con[3]);
//
wire connecy;
wire stall;
or(connecy,con3,con1);
and(stall,connecy,result_src0);

assign stall_d = stall;
assign stall_f = stall;

assign flush_d = pc_jump;
or(flush_e,stall,pc_jump);


endmodule


module hazard_unit_tb;
    reg [4:0] rs1_d, rs1_e, rs2_d, rs2_e;
    reg [4:0] rd_e, rd_m, rd_w;
    reg regwrite_m, regwrite_w;
    reg result_src0, pc_jump;
    wire [1:0] forward_a, forward_b;
    wire flush_d, stall_d, stall_f, flush_e;

    hazard_unit uut (
        .rs1_d(rs1_d), .rs1_e(rs1_e), .rs2_d(rs2_d), .rs2_e(rs2_e),
        .rd_e(rd_e), .rd_m(rd_m), .rd_w(rd_w),
        .regwrite_m(regwrite_m), .regwrite_w(regwrite_w),
        .result_src0(result_src0), .pc_jump(pc_jump),
        .forward_a(forward_a), .forward_b(forward_b),
        .flush_d(flush_d), .stall_d(stall_d), .stall_f(stall_f), .flush_e(flush_e)
    );

    initial begin
        // Initialize inputs
        rs1_d = 5'b00001; rs1_e = 5'b00010;
        rs2_d = 5'b00011; rs2_e = 5'b00100;
        rd_e = 5'b00001; rd_m = 5'b00011; rd_w = 5'b00100;
        regwrite_m = 1; regwrite_w = 1;
        result_src0 = 0; pc_jump = 0;
        
        #10;
        $display("forward_a: %b, forward_b: %b, flush_d: %b, stall_d: %b, stall_f: %b, flush_e: %b", 
                 forward_a, forward_b, flush_d, stall_d, stall_f, flush_e);

        // Simulate a hazard condition
        result_src0 = 1; rd_e = 5'b00001; rs1_d = 5'b00001; rs2_d = 5'b00011;
        #10;
        $display("forward_a: %b, forward_b: %b, flush_d: %b, stall_d: %b, stall_f: %b, flush_e: %b", 
                 forward_a, forward_b, flush_d, stall_d, stall_f, flush_e);

        // Simulate branch taken scenario
        pc_jump = 1;
        #10;
        $display("forward_a: %b, forward_b: %b, flush_d: %b, stall_d: %b, stall_f: %b, flush_e: %b", 
                 forward_a, forward_b, flush_d, stall_d, stall_f, flush_e);

        $stop;
    end
endmodule
