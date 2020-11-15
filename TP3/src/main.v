`include "pc.v"
`include "instruction_memory.v"
`include "data_memory.v"
`include "reg_file.v"
`include "alu.v"
`include "alu_control.v"
`include "control.v"
`include "imm_gen.v"
`include "mux.v"
`include "shift_left.v"

module datapath (clock, Reset, Prx_PC, ALUResult, Instruction);
  input wire clock, Reset;
  output wire [31:0]Prx_PC, Instruction, ALUResult;
  wire [31:0]ResultPC, Soma;
  wire [31:0]ValSignExtend, Data1, Data2, DataAux, WriteData, ShiftValue, ReadData, PC;
  wire [4:0]WriteReg;
  wire [3:0]ALUCtrl;
  wire Cout, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, ANDBranch;
  wire [1:0]ALUOp;

  program_counter CatchPC (
    .pc(PC), 
    .reset(Reset), 
    .pc_next(Prx_PC)
  );


  Sum4 PC4 (
    .pc(Prx_PC), 
    .sum(PC)
  );
  
  InstructionMemory CatchIns (
    .ReadAddress(Prx_PC), 
    .Instruction(Instruction)
  );

  control CatchVal (
    .opcode(Instruction[31:26]), 
    .RegDst(RegDst), 
    .Branch(Branch), 
    .MemRead(MemRead), 
    .MemtoReg(MemtoReg), 
    .MemWrite(MemWrite), 
    .alusrc(ALUSrc), 
    .regwrite(RegWrite), 
    .aluop(ALUOp)
  );

  extensao_sinal CatchImdEnd (
    .in(Instruction[15:0]), 
    .extensor(ValSignExtend)
  );

  alu_control CatchOp (
    .alu_operation(ALUOp), 
    .funct7(Instruction[9:3]), 
    .funct3(Instruction[2:0]), 
    .alu_ctr(ALUCtrl)
  );

  mux1 u1 (
    .data0(Instruction[20:16]), 
    .data1(Instruction[15:11]), 
    .select(RegDst), 
    .out(WriteReg)
  );

  reg_file Reg (
    .Read1(Instruction[25:21]),  
    .Read2(Instruction[20:16]),  
    .WriteReg(WriteReg),   
    .WriteData(WriteData),  
    .RegWrite(RegWrite),   
    .Data1(Data1),  
    .Data2(Data2),   
    .clock(clock),  
    .Reset(Reset)
  );

  mux2 u2 (
    .data0(Data2), 
    .data1(ValSignExtend), 
    .select(ALUSrc), 
    .out(DataAux)
    );

  alu CatchResult ( 
    .alu_control(ALUCtrl),  
    .a(Data1),   
    .b(DataAux),  
    .alu_out(ALUResult), 
    .zero(Zero));

  ShiftLeft2 CatchBranch (
    .ValSignExtend(ValSignExtend), 
    .Result(ShiftValue));

  AND CatchBranch1 (
    .A(Branch), 
    .B(Zero), 
    .Exit(ANDBranch));

  result_pc CatchPC2 (
    .A(PC), 
    .B(ShiftValue), 
    .Sum(Soma), 
    .ANDBranch(ANDBranch), 
    .clock(clock));

  data_memory CatchDat (
    .mem_write(MemWrite), 
    .mem_read(MemRead), 
    .address(ALUResult), 
    .write_data(Data2), 
    .result(ReadData), 
    .reset(Reset), 
    .clock(clock));

  mux2 u4 (
    .data0(ALUResult), 
    .data1(ReadData), 
    .select(MemtoReg), 
    .out(WriteData));

endmodule