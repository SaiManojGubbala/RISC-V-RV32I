
`timescale 1ns / 1ps

module alu_tb;
    reg [31:0] Op1, Op2;
    reg [3:0] Alu_Control;
    wire [31:0] Result;
    wire Zero_f, Sign_f;

    alu uut (
        .Op1(Op1),
        .Op2(Op2),
        .Alu_Control(Alu_Control),
        .Result(Result),
        .Zero_f(Zero_f),
        .Sign_f(Sign_f)
    );

    initial begin
        $monitor("Time=%0t | Op1=%h | Op2=%h | Alu_Control=%b | Result=%h | Zero=%b | Sign=%b", $time, Op1, Op2, Alu_Control, Result, Zero_f, Sign_f);

        // Test ADD
        Op1 = 10; Op2 = 5; Alu_Control = 4'b0000; #10;
        
        // Test SUB
        Op1 = 15; Op2 = 20; Alu_Control = 4'b0001; #10;
        
        // Test SLL
        Op1 = 3; Op2 = 1; Alu_Control = 4'b0010; #10;
        
        // Test SLT
        Op1 = -5; Op2 = 1; Alu_Control = 4'b0100; #10;
        
        // Test SLTU
        Op1 = 5; Op2 = 10; Alu_Control = 4'b0110; #10;
        
        // Test XOR
        Op1 = 32'hF0F0F0F0; Op2 = 32'h0F0F0F0F; Alu_Control = 4'b1000; #10;
        
        // Test OR
        Op1 = 32'hFF00FF00; Op2 = 32'h00FF00FF; Alu_Control = 4'b1100; #10;
        
        // Test AND
        Op1 = 32'hAAAA5555; Op2 = 32'hFFFF0000; Alu_Control = 4'b1110; #10;
        
        // Test SRL
        Op1 = 32'h80000000; Op2 = 2; Alu_Control = 4'b1010; #10;
        
        // Test SRA (Arithmetic Right Shift)
        Op1 = 32'h80000000; Op2 = 2; Alu_Control = 4'b1011; #10;
        
        $finish;
    end
endmodule