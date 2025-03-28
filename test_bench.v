
module sign_extend_tb;
    reg [31:0] instruction;  // Input instruction
    wire [31:0] extension;   // Output extended immediate

    // Instantiate the sign_extend module
    sign_extend uut (
        .instruction(instruction),
        .extension(extension)
    );

    // Test procedure
    initial begin
        $display("Testing RISC-V Sign Extension");
        //LUI
        instruction = 32'b1111111_00000_11111_000_00000_0110111; #10;
        $display("LUI  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //AUIPC
        instruction = 32'b0000000_11111_00000_111_00000_0010111; #10;
        $display("AUIPC | Instr: %b | Sign-Ext: %b", instruction, extension);
        //JAL
        instruction = 32'b0101010_01010_01010_101_01010_1101111; #10;
        $display("JAL  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //JALR
        instruction = 32'b1000000_11111_11111_000_00000_1100111; #10;
        $display("JALR  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //B-Type
        instruction = 32'b1111111_00000_11111_111_11111_1100011; #10;
        $display("B-Type  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //L-Type 
        instruction = 32'b0110011_00110_01100_110_01100_0000011; #10;
        $display("L-Type  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //S-Type
        instruction = 32'b0000000_11111_11111_000_11111_0100011; #10;
        $display("S-Type  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //I-Type
        instruction = 32'b0110011_00110_01100_110_01100_0000011; #10;
        $display("I-Type  | Instr: %b | Sign-Ext: %b", instruction, extension);
        //R-Type
        instruction = 32'b0110011_00110_01100_110_01100_0000011; #10;
        $display("R-Type  | Instr: %b | Sign-Ext: %b", instruction, extension);

        $finish;
    end
endmodule

`timescale 1ns / 1ps

module instruction_decoder_tb;
    // Inputs
    reg [2:0] funct3;
    reg funct7_5;
    reg [6:0] opcode;
    
    // Outputs
    wire is_jump, is_jalr, is_branch, memwrite, regwrite, alu_srca;
    wire [3:0] alu_control;
    wire [1:0] alu_srcb, result_src;
    
    // Instantiate the instruction decoder
    instruction_decoder uut (
        .funct3(funct3),
        .funct7_5(funct7_5),
        .opcode(opcode),
        .is_jump(is_jump),
        .is_jalr(is_jalr),
        .is_branch(is_branch),
        .memwrite(memwrite),
        .regwrite(regwrite),
        .alu_srca(alu_srca),
        .alu_control(alu_control),
        .alu_srcb(alu_srcb),
        .result_src(result_src)
    );
    
    // Test procedure
    initial begin
        $monitor("Opcode=%b, Funct3=%b, Funct7_5=%b | is_jump=%b, is_jalr=%b, is_branch=%b, memwrite=%b, regwrite=%b, alu_srca=%b, alu_control=%b, alu_srcb=%b, result_src=%b", 
                 opcode, funct3, funct7_5, is_jump, is_jalr, is_branch, memwrite, regwrite, alu_srca, alu_control, alu_srcb, result_src);
        
        // Example test cases:
        // R-type instruction: ADD (opcode=0110011, funct3=000, funct7_5=0)
        opcode = 7'b0110011; funct3 = 3'b000; funct7_5 = 1'b0; #10;
        
        // R-type instruction: SUB (opcode=0110011, funct3=000, funct7_5=1)
        opcode = 7'b0110011; funct3 = 3'b000; funct7_5 = 1'b1; #10;
        
        // I-type instruction: ADDI (opcode=0010011, funct3=000)
        opcode = 7'b0010011; funct3 = 3'b000; funct7_5 = 1'b0; #10;
        
        // Load instruction: LW (opcode=0000011, funct3=010)
        opcode = 7'b0000011; funct3 = 3'b010; funct7_5 = 1'b0; #10;
        
        // Store instruction: SW (opcode=0100011, funct3=010)
        opcode = 7'b0100011; funct3 = 3'b010; funct7_5 = 1'b0; #10;
        
        // Branch instruction: BEQ (opcode=1100011, funct3=000)
        opcode = 7'b1100011; funct3 = 3'b000; funct7_5 = 1'b0; #10;
        
        // Jump instruction: JAL (opcode=1101111)
        opcode = 7'b1101111; funct3 = 3'b000; funct7_5 = 1'b0; #10;
        
        // Jump register: JALR (opcode=1100111, funct3=000)
        opcode = 7'b1100111; funct3 = 3'b000; funct7_5 = 1'b0; #10;
        
        // End simulation
        $stop;
    end
endmodule



module tb;
    reg D, Clk;
    wire Q;

    // Instantiate D Flip-Flop
    D_FF uut (.Q(Q), .D(D), .Clk(Clk));

    // Clock Generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    // Test Cases
    initial begin
        D = 0; #10;
        D = 1; #10;
        D = 0; #7;
        D = 1; #3;
        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        $finish;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time: %0t | D: %b | Clk: %b | Q: %b", $time, D, Clk, Q);
    end
endmodule

module mux32x1_32bit_tb;
    reg [31:0] value0, value1, value2, value3, value4, value5, value6, value7,
               value8, value9, value10, value11, value12, value13, value14, value15,
               value16, value17, value18, value19, value20, value21, value22, value23,
               value24, value25, value26, value27, value28, value29, value30, value31;
    reg [4:0] select;
    wire [31:0] result;

    // Instantiate the 32x1 multiplexer
    mux32x1_32bit uut (
        .value0(value0), .value1(value1), .value2(value2), .value3(value3),
        .value4(value4), .value5(value5), .value6(value6), .value7(value7),
        .value8(value8), .value9(value9), .value10(value10), .value11(value11),
        .value12(value12), .value13(value13), .value14(value14), .value15(value15),
        .value16(value16), .value17(value17), .value18(value18), .value19(value19),
        .value20(value20), .value21(value21), .value22(value22), .value23(value23),
        .value24(value24), .value25(value25), .value26(value26), .value27(value27),
        .value28(value28), .value29(value29), .value30(value30), .value31(value31),
        .select(select),
        .result(result)
    );

    // Test procedure
    initial begin
        $display("Testing 32x1 Multiplexer");

        // Assign unique test values
        value0  = 32'h00000000;  value1  = 32'h11111111;
        value2  = 32'h22222222;  value3  = 32'h33333333;
        value4  = 32'h44444444;  value5  = 32'h55555555;
        value6  = 32'h66666666;  value7  = 32'h77777777;
        value8  = 32'h88888888;  value9  = 32'h99999999;
        value10 = 32'hAAAAAAAA;  value11 = 32'hBBBBBBBB;
        value12 = 32'hCCCCCCCC;  value13 = 32'hDDDDDDDD;
        value14 = 32'hEEEEEEEE;  value15 = 32'hFFFFFFFF;
        value16 = 32'h12345678;  value17 = 32'h87654321;
        value18 = 32'hDEADBEEF;  value19 = 32'hFEEDC0DE;
        value20 = 32'hCAFEBABE;  value21 = 32'h0BADF00D;
        value22 = 32'hABCDEF12;  value23 = 32'h1234ABCD;
        value24 = 32'h13579BDF;  value25 = 32'h2468ACE0;
        value26 = 32'hFACEB00C;  value27 = 32'h00C0FFEE;
        value28 = 32'h0F0F0F0F;  value29 = 32'hF0F0F0F0;
        value30 = 32'hBAADF00D;  value31 = 32'hDEADC0DE;

        // Test different select values
        select = 5'b00000; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b00001; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b00010; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b00100; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b01000; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b10000; #10; $display("Select: %d | Output: %h", select, result);
        select = 5'b11111; #10; $display("Select: %d | Output: %h", select, result);

        $finish;
    end
endmodule

module d_flipflop_tb;
    reg D, Clk, Clear;
    wire Q;

    // Instantiate the D Flip-Flop module
    d_flipflop uut (
        .D(D), .Clk(Clk), .Clear(Clear), .Q(Q)
    );

    // Generate Clock Signal
    always #5 Clk = ~Clk;  // Toggle clock every 5 time units

    initial begin
        // Initialize inputs
        Clk = 0; D = 0; Clear = 0;

        // Apply test cases
        #10 D = 1; Clear = 0;  // Set D=1
        #10 D = 1;              // Set D=0
        #10 Clear = 1;          // Clear flip-flop (Q should be 0)
        #10 Clear = 0; D = 1;   // Release Clear, set D=1
        #10 D = 0;
        #10 D = 1;
        #20;
        
        $stop;
    end

    initial begin
        $monitor("Time=%0t | D=%b | Clk=%b | Clear=%b | Q=%b", $time, D, Clk, Clear, Q);
    end
endmodule
