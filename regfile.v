`include "sequential_elements.v"



module RegFile (
    input Clk, Write_Enable,
    input [4:0] rs1, rs2, rd,
    input [31:0] Write_Data,
    output [31:0] Rd1, Rd2
);

wire [31:0] reg_out [0:31];
wire [31:0] reg_in [0:31];

wire [31:0] and_in,mux_in;

decoder5x32 i1 (.sel(rd),.out(and_in));
and(mux_in[0],and_in[0],Write_Enable);
and(mux_in[1],and_in[1],Write_Enable);
and(mux_in[2],and_in[2],Write_Enable);
and(mux_in[3],and_in[3],Write_Enable);
and(mux_in[4],and_in[4],Write_Enable);
and(mux_in[5],and_in[5],Write_Enable);
and(mux_in[6],and_in[6],Write_Enable);
and(mux_in[7],and_in[7],Write_Enable);
and(mux_in[8],and_in[8],Write_Enable);
and(mux_in[9],and_in[9],Write_Enable);

and(mux_in[10],and_in[10],Write_Enable);
and(mux_in[11],and_in[11],Write_Enable);
and(mux_in[12],and_in[12],Write_Enable);
and(mux_in[13],and_in[13],Write_Enable);
and(mux_in[14],and_in[14],Write_Enable);
and(mux_in[15],and_in[15],Write_Enable);
and(mux_in[16],and_in[16],Write_Enable);
and(mux_in[17],and_in[17],Write_Enable);

and(mux_in[20],and_in[20],Write_Enable);
and(mux_in[21],and_in[21],Write_Enable);
and(mux_in[22],and_in[22],Write_Enable);
and(mux_in[23],and_in[23],Write_Enable);
and(mux_in[24],and_in[24],Write_Enable);
and(mux_in[25],and_in[25],Write_Enable);
and(mux_in[26],and_in[26],Write_Enable);
and(mux_in[27],and_in[27],Write_Enable);
and(mux_in[28],and_in[28],Write_Enable);
and(mux_in[29],and_in[29],Write_Enable);

and(mux_in[30],and_in[30],Write_Enable);
and(mux_in[31],and_in[31],Write_Enable);


mux2x1_32bit h1 (.a(reg_out[0]),.b(Write_Data),.sel(mux_in[0]),.out(reg_in[0]));
mux2x1_32bit h2 (.a(reg_out[1]),.b(Write_Data),.sel(mux_in[1]),.out(reg_in[1]));
mux2x1_32bit h3 (.a(reg_out[2]),.b(Write_Data),.sel(mux_in[2]),.out(reg_in[2]));
mux2x1_32bit h4 (.a(reg_out[3]),.b(Write_Data),.sel(mux_in[3]),.out(reg_in[3]));
mux2x1_32bit h5 (.a(reg_out[4]),.b(Write_Data),.sel(mux_in[4]),.out(reg_in[4]));
mux2x1_32bit h6 (.a(reg_out[5]),.b(Write_Data),.sel(mux_in[5]),.out(reg_in[5]));
mux2x1_32bit h7 (.a(reg_out[6]),.b(Write_Data),.sel(mux_in[6]),.out(reg_in[6]));
mux2x1_32bit h8 (.a(reg_out[7]),.b(Write_Data),.sel(mux_in[7]),.out(reg_in[7]));
mux2x1_32bit h9 (.a(reg_out[8]),.b(Write_Data),.sel(mux_in[8]),.out(reg_in[8]));
mux2x1_32bit h10 (.a(reg_out[9]),.b(Write_Data),.sel(mux_in[9]),.out(reg_in[9]));

mux2x1_32bit h11 (.a(reg_out[10]),.b(Write_Data),.sel(mux_in[10]),.out(reg_in[10]));
mux2x1_32bit h12 (.a(reg_out[11]),.b(Write_Data),.sel(mux_in[11]),.out(reg_in[11]));
mux2x1_32bit h13 (.a(reg_out[12]),.b(Write_Data),.sel(mux_in[12]),.out(reg_in[12]));
mux2x1_32bit h14 (.a(reg_out[13]),.b(Write_Data),.sel(mux_in[13]),.out(reg_in[13]));
mux2x1_32bit h15 (.a(reg_out[14]),.b(Write_Data),.sel(mux_in[14]),.out(reg_in[14]));
mux2x1_32bit h16 (.a(reg_out[15]),.b(Write_Data),.sel(mux_in[15]),.out(reg_in[15]));
mux2x1_32bit h17 (.a(reg_out[16]),.b(Write_Data),.sel(mux_in[16]),.out(reg_in[16]));
mux2x1_32bit h18 (.a(reg_out[17]),.b(Write_Data),.sel(mux_in[17]),.out(reg_in[17]));
mux2x1_32bit h19 (.a(reg_out[18]),.b(Write_Data),.sel(mux_in[18]),.out(reg_in[18]));
mux2x1_32bit h20 (.a(reg_out[19]),.b(Write_Data),.sel(mux_in[19]),.out(reg_in[19]));

mux2x1_32bit h21 (.a(reg_out[20]),.b(Write_Data),.sel(mux_in[20]),.out(reg_in[20]));
mux2x1_32bit h22 (.a(reg_out[21]),.b(Write_Data),.sel(mux_in[21]),.out(reg_in[21]));
mux2x1_32bit h23 (.a(reg_out[22]),.b(Write_Data),.sel(mux_in[22]),.out(reg_in[22]));
mux2x1_32bit h24 (.a(reg_out[23]),.b(Write_Data),.sel(mux_in[23]),.out(reg_in[23]));
mux2x1_32bit h25 (.a(reg_out[24]),.b(Write_Data),.sel(mux_in[24]),.out(reg_in[24]));
mux2x1_32bit h26 (.a(reg_out[25]),.b(Write_Data),.sel(mux_in[25]),.out(reg_in[25]));
mux2x1_32bit h27 (.a(reg_out[26]),.b(Write_Data),.sel(mux_in[26]),.out(reg_in[26]));
mux2x1_32bit h28 (.a(reg_out[27]),.b(Write_Data),.sel(mux_in[27]),.out(reg_in[27]));
mux2x1_32bit h29 (.a(reg_out[28]),.b(Write_Data),.sel(mux_in[28]),.out(reg_in[28]));
mux2x1_32bit h30 (.a(reg_out[29]),.b(Write_Data),.sel(mux_in[29]),.out(reg_in[29]));

mux2x1_32bit h31 (.a(reg_out[30]),.b(Write_Data),.sel(mux_in[30]),.out(reg_in[30]));
mux2x1_32bit h32 (.a(reg_out[31]),.b(Write_Data),.sel(mux_in[31]),.out(reg_in[31]));

register_32bit a1(.D(reg_in[0]),.Clk(Clk),.Out(reg_out[0]));
register_32bit a2(.D(reg_in[1]),.Clk(Clk),.Out(reg_out[1]));
register_32bit a3(.D(reg_in[2]),.Clk(Clk),.Out(reg_out[2]));
register_32bit a4(.D(reg_in[3]),.Clk(Clk),.Out(reg_out[3]));
register_32bit a5(.D(reg_in[4]),.Clk(Clk),.Out(reg_out[4]));
register_32bit a6(.D(reg_in[5]),.Clk(Clk),.Out(reg_out[5]));
register_32bit a7(.D(reg_in[6]),.Clk(Clk),.Out(reg_out[6]));
register_32bit a8(.D(reg_in[7]),.Clk(Clk),.Out(reg_out[7]));

register_32bit a9(.D(reg_in[8]),.Clk(Clk),.Out(reg_out[8]));
register_32bit a10(.D(reg_in[9]),.Clk(Clk),.Out(reg_out[9]));
register_32bit a11(.D(reg_in[10]),.Clk(Clk),.Out(reg_out[10]));
register_32bit a12(.D(reg_in[11]),.Clk(Clk),.Out(reg_out[11]));
register_32bit a13(.D(reg_in[12]),.Clk(Clk),.Out(reg_out[12]));
register_32bit a14(.D(reg_in[13]),.Clk(Clk),.Out(reg_out[13]));
register_32bit a15(.D(reg_in[14]),.Clk(Clk),.Out(reg_out[14]));
register_32bit a16(.D(reg_in[15]),.Clk(Clk),.Out(reg_out[15]));

register_32bit a17(.D(reg_in[16]),.Clk(Clk),.Out(reg_out[16]));
register_32bit a18(.D(reg_in[17]),.Clk(Clk),.Out(reg_out[17]));
register_32bit a19(.D(reg_in[18]),.Clk(Clk),.Out(reg_out[18]));
register_32bit a20(.D(reg_in[19]),.Clk(Clk),.Out(reg_out[19]));
register_32bit a21(.D(reg_in[20]),.Clk(Clk),.Out(reg_out[20]));
register_32bit a22(.D(reg_in[21]),.Clk(Clk),.Out(reg_out[21]));
register_32bit a23(.D(reg_in[22]),.Clk(Clk),.Out(reg_out[22]));
register_32bit a24(.D(reg_in[23]),.Clk(Clk),.Out(reg_out[23]));

register_32bit a25(.D(reg_in[24]),.Clk(Clk),.Out(reg_out[24]));
register_32bit a26(.D(reg_in[25]),.Clk(Clk),.Out(reg_out[25]));
register_32bit a27(.D(reg_in[26]),.Clk(Clk),.Out(reg_out[26]));
register_32bit a28(.D(reg_in[27]),.Clk(Clk),.Out(reg_out[27]));
register_32bit a29(.D(reg_in[28]),.Clk(Clk),.Out(reg_out[28]));
register_32bit a30(.D(reg_in[29]),.Clk(Clk),.Out(reg_out[29]));
register_32bit a31(.D(reg_in[30]),.Clk(Clk),.Out(reg_out[30]));
register_32bit a32(.D(reg_in[31]),.Clk(Clk),.Out(reg_out[31]));

mux32x1_32bit b1(.value0(reg_out[0]),.value1(reg_out[1]),.value2(reg_out[2]),.value3(reg_out[3]),.value4(reg_out[4]),.value5(reg_out[5]),.value6(reg_out[6]),.value7(reg_out[7]),
                 .value8(reg_out[8]),.value9(reg_out[9]),.value10(reg_out[10]),.value11(reg_out[11]),.value12(reg_out[12]),.value13(reg_out[13]),.value14(reg_out[14]),.value15(reg_out[15]),
                 .value16(reg_out[16]),.value17(reg_out[17]),.value18(reg_out[18]),.value19(reg_out[19]),.value20(reg_out[20]),.value21(reg_out[21]),.value22(reg_out[22]),.value23(reg_out[23]),
                 .value24(reg_out[24]),.value25(reg_out[25]),.value26(reg_out[26]),.value27(reg_out[27]),.value28(reg_out[28]),.value29(reg_out[29]),.value30(reg_out[30]),.value31(reg_out[31]),
                 .select(rs1),
                 .result(Rd1)
);

mux32x1_32bit b2(.value0(reg_out[0]),.value1(reg_out[1]),.value2(reg_out[2]),.value3(reg_out[3]),.value4(reg_out[4]),.value5(reg_out[5]),.value6(reg_out[6]),.value7(reg_out[7]),
                 .value8(reg_out[8]),.value9(reg_out[9]),.value10(reg_out[10]),.value11(reg_out[11]),.value12(reg_out[12]),.value13(reg_out[13]),.value14(reg_out[14]),.value15(reg_out[15]),
                 .value16(reg_out[16]),.value17(reg_out[17]),.value18(reg_out[18]),.value19(reg_out[19]),.value20(reg_out[20]),.value21(reg_out[21]),.value22(reg_out[22]),.value23(reg_out[23]),
                 .value24(reg_out[24]),.value25(reg_out[25]),.value26(reg_out[26]),.value27(reg_out[27]),.value28(reg_out[28]),.value29(reg_out[29]),.value30(reg_out[30]),.value31(reg_out[31]),
                 .select(rs2),
                 .result(Rd2)
);

endmodule

module RegFile_tb;
    reg Clk, Write_Enable;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] Write_Data;
    wire [31:0] Rd1, Rd2;
    
    RegFile uut (
        .Clk(Clk),
        .Write_Enable(Write_Enable),
        .rs1(rs1), .rs2(rs2), .rd(rd),
        .Write_Data(Write_Data),
        .Rd1(Rd1), .Rd2(Rd2)
    );
    
    always #5 Clk = ~Clk;
    
    initial begin
        Clk = 0; 
        Write_Enable = 0;
        rd = 0; Write_Data = 0;
        rs1 = 0; rs2 = 0;
        
        #10;
        Write_Enable = 1; rd = 5; Write_Data = 32'hA5A5A5A5; #10;
        Write_Enable = 1; rd = 10; Write_Data = 32'h5A5A5A5A; #10;
        Write_Enable = 0; rs1 = 5; rs2 = 10; #10;
        
        $display("Rd1: %h, Rd2: %h", Rd1, Rd2);
        
        Write_Enable = 1; rd = 15; Write_Data = 32'h12345678; #10;
        Write_Enable = 0; rs1 = 15; rs2 = 5; #10;
        
        $display("Rd1: %h, Rd2: %h", Rd1, Rd2);
        
        $stop;
    end
endmodule
