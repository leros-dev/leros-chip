module AluAccu(
  input         clock,
  input         reset,
  input  [2:0]  io_op,
  input  [31:0] io_din,
  input  [3:0]  io_enaMask,
  input         io_enaByte,
  input  [1:0]  io_off,
  output [31:0] io_accu
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] a; // @[AluAccu.scala 27:24]
  wire [31:0] _res_T_1 = a + io_din; // @[AluAccu.scala 39:16]
  wire [31:0] _res_T_3 = a - io_din; // @[AluAccu.scala 42:16]
  wire [31:0] _res_T_4 = a & io_din; // @[AluAccu.scala 45:16]
  wire [31:0] _res_T_5 = a | io_din; // @[AluAccu.scala 48:16]
  wire [31:0] _res_T_6 = a ^ io_din; // @[AluAccu.scala 51:16]
  wire [31:0] _GEN_0 = 3'h6 == io_op ? io_din : a; // @[AluAccu.scala 34:14 57:11]
  wire [31:0] _GEN_1 = 3'h7 == io_op ? {{1'd0}, a[31:1]} : _GEN_0; // @[AluAccu.scala 34:14 54:11]
  wire [31:0] _GEN_2 = 3'h5 == io_op ? _res_T_6 : _GEN_1; // @[AluAccu.scala 34:14 51:11]
  wire [31:0] _GEN_3 = 3'h4 == io_op ? _res_T_5 : _GEN_2; // @[AluAccu.scala 34:14 48:11]
  wire [31:0] _GEN_4 = 3'h3 == io_op ? _res_T_4 : _GEN_3; // @[AluAccu.scala 34:14 45:11]
  wire [31:0] _GEN_5 = 3'h2 == io_op ? _res_T_3 : _GEN_4; // @[AluAccu.scala 34:14 42:11]
  wire [31:0] _GEN_6 = 3'h1 == io_op ? _res_T_1 : _GEN_5; // @[AluAccu.scala 34:14 39:11]
  wire [31:0] res = 3'h0 == io_op ? a : _GEN_6; // @[AluAccu.scala 34:14 36:11]
  wire [7:0] _GEN_8 = io_off == 2'h3 ? res[31:24] : res[7:0]; // @[AluAccu.scala 66:30 67:10]
  wire [7:0] _GEN_9 = io_off == 2'h2 ? res[23:16] : _GEN_8; // @[AluAccu.scala 64:30 65:10]
  wire [7:0] byte_ = io_off == 2'h1 ? res[15:8] : _GEN_9; // @[AluAccu.scala 62:24 63:10]
  wire  mask_0 = io_enaMask[0]; // @[AluAccu.scala 72:45]
  wire  mask_1 = io_enaMask[1]; // @[AluAccu.scala 72:45]
  wire  mask_2 = io_enaMask[2]; // @[AluAccu.scala 72:45]
  wire  mask_3 = io_enaMask[3]; // @[AluAccu.scala 72:45]
  wire [7:0] split_bytes_0 = mask_0 ? res[7:0] : a[7:0]; // @[AluAccu.scala 81:26]
  wire [7:0] split_bytes_1 = mask_1 ? res[15:8] : a[15:8]; // @[AluAccu.scala 81:26]
  wire [7:0] split_bytes_2 = mask_2 ? res[23:16] : a[23:16]; // @[AluAccu.scala 81:26]
  wire [7:0] split_bytes_3 = mask_3 ? res[31:24] : a[31:24]; // @[AluAccu.scala 81:26]
  wire [8:0] _accuReg_T = {1'h0,byte_}; // @[AluAccu.scala 86:20]
  wire [31:0] _accuReg_T_1 = {split_bytes_3,split_bytes_2,split_bytes_1,split_bytes_0}; // @[AluAccu.scala 88:22]
  assign io_accu = a; // @[AluAccu.scala 91:11]
  always @(posedge clock) begin
    if (reset) begin // @[AluAccu.scala 27:24]
      a <= 32'h0; // @[AluAccu.scala 27:24]
    end else if (io_enaByte & &io_enaMask) begin // @[AluAccu.scala 84:38]
      a <= {{23'd0}, _accuReg_T}; // @[AluAccu.scala 86:13]
    end else begin
      a <= _accuReg_T_1; // @[AluAccu.scala 88:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  a = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstrMem(
  input         clock,
  input         reset,
  input  [9:0]  io_addr,
  output [15:0] io_instr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] memReg; // @[InstrMem.scala 22:23]
  wire [15:0] _GEN_1 = 4'h1 == memReg[3:0] ? 16'h3900 : 16'h2101; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_2 = 4'h2 == memReg[3:0] ? 16'h2102 : _GEN_1; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_3 = 4'h3 == memReg[3:0] ? 16'h3900 : _GEN_2; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_4 = 4'h4 == memReg[3:0] ? 16'h2103 : _GEN_3; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_5 = 4'h5 == memReg[3:0] ? 16'h3900 : _GEN_4; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_6 = 4'h6 == memReg[3:0] ? 16'h2100 : _GEN_5; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_7 = 4'h7 == memReg[3:0] ? 16'h3900 : _GEN_6; // @[InstrMem.scala 24:{12,12}]
  wire [15:0] _GEN_8 = 4'h8 == memReg[3:0] ? 16'h2100 : _GEN_7; // @[InstrMem.scala 24:{12,12}]
  assign io_instr = 4'h9 == memReg[3:0] ? 16'hff00 : _GEN_8; // @[InstrMem.scala 24:{12,12}]
  always @(posedge clock) begin
    if (reset) begin // @[InstrMem.scala 22:23]
      memReg <= 10'h0; // @[InstrMem.scala 22:23]
    end else begin
      memReg <= io_addr; // @[InstrMem.scala 23:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  memReg = _RAND_0[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DecodeFsmd(
  input  [15:0] io_din,
  output [2:0]  io_dout_next,
  output [31:0] io_dout_operand,
  output [3:0]  io_dout_enaMask,
  output [2:0]  io_dout_op,
  output        io_dout_isStore,
  output        io_dout_isStoreInd,
  output        io_dout_isLoadInd,
  output        io_dout_isLoadIndB,
  output        io_dout_isLoadAddr,
  output        io_dout_exit
);
  wire [3:0] field = io_din[15:12]; // @[DecodeFsmd.scala 76:21]
  wire  _T = field == 4'h8; // @[DecodeFsmd.scala 77:15]
  wire  _GEN_1 = field == 4'h9 | _T; // @[DecodeFsmd.scala 78:{30,41}]
  wire  _GEN_2 = field == 4'ha | _GEN_1; // @[DecodeFsmd.scala 79:{31,42}]
  wire  _GEN_3 = field == 4'hb | _GEN_2; // @[DecodeFsmd.scala 80:{30,41}]
  wire  isBranch = field == 4'hc | _GEN_3; // @[DecodeFsmd.scala 81:{30,41}]
  wire [15:0] _instr_T_1 = io_din & 16'hf000; // @[DecodeFsmd.scala 83:36]
  wire [15:0] instr = isBranch ? _instr_T_1 : io_din; // @[DecodeFsmd.scala 83:18]
  wire [7:0] _sigExt_T_1 = instr[7:0]; // @[DecodeFsmd.scala 87:25]
  wire [31:0] sigExt = {{24{_sigExt_T_1[7]}},_sigExt_T_1}; // @[DecodeFsmd.scala 86:20 87:10]
  wire [31:0] _d_operand_T = {{24{_sigExt_T_1[7]}},_sigExt_T_1}; // @[DecodeFsmd.scala 88:23]
  wire  _GEN_90 = 8'h26 == instr[15:8] ? 1'h0 : 8'h27 == instr[15:8]; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_100 = 8'h25 == instr[15:8] | _GEN_90; // @[DecodeFsmd.scala 146:14 92:24]
  wire  _GEN_112 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_100; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_122 = 8'h23 == instr[15:8] | _GEN_112; // @[DecodeFsmd.scala 135:14 92:24]
  wire  _GEN_134 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_122; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_145 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_134; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_156 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_145; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_167 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_156; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_178 = 8'hd == instr[15:8] ? 1'h0 : _GEN_167; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_189 = 8'hc == instr[15:8] ? 1'h0 : _GEN_178; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_200 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_189; // @[DecodeFsmd.scala 92:24]
  wire  noSext = 8'h8 == instr[15:8] ? 1'h0 : _GEN_200; // @[DecodeFsmd.scala 92:24]
  wire [31:0] _GEN_5 = noSext ? {{24'd0}, instr[7:0]} : _d_operand_T; // @[DecodeFsmd.scala 88:13 89:{17,29}]
  wire [31:0] _d_operand_T_3 = {sigExt[23:0],8'h0}; // @[DecodeFsmd.scala 164:41]
  wire [31:0] _d_operand_T_5 = {sigExt[15:0],16'h0}; // @[DecodeFsmd.scala 171:41]
  wire [31:0] _d_operand_T_7 = {instr[7:0],24'h0}; // @[DecodeFsmd.scala 177:32]
  wire  _GEN_8 = 8'h71 == instr[15:8] ? 1'h0 : 8'hff == instr[15:8]; // @[DecodeFsmd.scala 48:12 92:24]
  wire  _GEN_9 = 8'h70 == instr[15:8] | 8'h71 == instr[15:8]; // @[DecodeFsmd.scala 202:20 92:24]
  wire  _GEN_10 = 8'h70 == instr[15:8] ? 1'h0 : _GEN_8; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_12 = 8'h61 == instr[15:8] ? 3'h6 : 3'h0; // @[DecodeFsmd.scala 197:12 40:10 92:24]
  wire [3:0] _GEN_13 = 8'h61 == instr[15:8] ? 4'hf : 4'h0; // @[DecodeFsmd.scala 198:17 39:15 92:24]
  wire  _GEN_14 = 8'h61 == instr[15:8] ? 1'h0 : _GEN_9; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_15 = 8'h61 == instr[15:8] ? 1'h0 : _GEN_10; // @[DecodeFsmd.scala 48:12 92:24]
  wire  _GEN_16 = 8'h60 == instr[15:8] | 8'h61 == instr[15:8]; // @[DecodeFsmd.scala 190:19 92:24]
  wire [2:0] _GEN_17 = 8'h60 == instr[15:8] ? 3'h6 : _GEN_12; // @[DecodeFsmd.scala 191:12 92:24]
  wire [3:0] _GEN_18 = 8'h60 == instr[15:8] ? 4'hf : _GEN_13; // @[DecodeFsmd.scala 192:17 92:24]
  wire  _GEN_19 = 8'h60 == instr[15:8] ? 1'h0 : 8'h61 == instr[15:8]; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_20 = 8'h60 == instr[15:8] ? 1'h0 : _GEN_14; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_21 = 8'h60 == instr[15:8] ? 1'h0 : _GEN_15; // @[DecodeFsmd.scala 48:12 92:24]
  wire  _GEN_23 = 8'h50 == instr[15:8] ? 1'h0 : _GEN_16; // @[DecodeFsmd.scala 44:17 92:24]
  wire [2:0] _GEN_24 = 8'h50 == instr[15:8] ? 3'h0 : _GEN_17; // @[DecodeFsmd.scala 40:10 92:24]
  wire [3:0] _GEN_25 = 8'h50 == instr[15:8] ? 4'h0 : _GEN_18; // @[DecodeFsmd.scala 39:15 92:24]
  wire  _GEN_26 = 8'h50 == instr[15:8] ? 1'h0 : _GEN_19; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_27 = 8'h50 == instr[15:8] ? 1'h0 : _GEN_20; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_28 = 8'h50 == instr[15:8] ? 1'h0 : _GEN_21; // @[DecodeFsmd.scala 48:12 92:24]
  wire  _GEN_30 = 8'h30 == instr[15:8] ? 1'h0 : 8'h50 == instr[15:8]; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_31 = 8'h30 == instr[15:8] ? 1'h0 : _GEN_23; // @[DecodeFsmd.scala 44:17 92:24]
  wire [2:0] _GEN_32 = 8'h30 == instr[15:8] ? 3'h0 : _GEN_24; // @[DecodeFsmd.scala 40:10 92:24]
  wire [3:0] _GEN_33 = 8'h30 == instr[15:8] ? 4'h0 : _GEN_25; // @[DecodeFsmd.scala 39:15 92:24]
  wire  _GEN_34 = 8'h30 == instr[15:8] ? 1'h0 : _GEN_26; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_35 = 8'h30 == instr[15:8] ? 1'h0 : _GEN_27; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_36 = 8'h30 == instr[15:8] ? 1'h0 : _GEN_28; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_37 = 8'h39 == instr[15:8] ? 3'h4 : 3'h1; // @[DecodeFsmd.scala 181:14 37:12 92:24]
  wire  _GEN_38 = 8'h39 == instr[15:8] ? 1'h0 : 8'h30 == instr[15:8]; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_39 = 8'h39 == instr[15:8] ? 1'h0 : _GEN_30; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_40 = 8'h39 == instr[15:8] ? 1'h0 : _GEN_31; // @[DecodeFsmd.scala 44:17 92:24]
  wire [2:0] _GEN_41 = 8'h39 == instr[15:8] ? 3'h0 : _GEN_32; // @[DecodeFsmd.scala 40:10 92:24]
  wire [3:0] _GEN_42 = 8'h39 == instr[15:8] ? 4'h0 : _GEN_33; // @[DecodeFsmd.scala 39:15 92:24]
  wire  _GEN_43 = 8'h39 == instr[15:8] ? 1'h0 : _GEN_34; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_44 = 8'h39 == instr[15:8] ? 1'h0 : _GEN_35; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_45 = 8'h39 == instr[15:8] ? 1'h0 : _GEN_36; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_46 = 8'h2b == instr[15:8] ? 3'h6 : _GEN_41; // @[DecodeFsmd.scala 174:12 92:24]
  wire [2:0] _GEN_47 = 8'h2b == instr[15:8] ? 3'h3 : _GEN_37; // @[DecodeFsmd.scala 175:14 92:24]
  wire [3:0] _GEN_48 = 8'h2b == instr[15:8] ? 4'h8 : _GEN_42; // @[DecodeFsmd.scala 176:17 92:24]
  wire [31:0] _GEN_49 = 8'h2b == instr[15:8] ? _d_operand_T_7 : _GEN_5; // @[DecodeFsmd.scala 177:17 92:24]
  wire  _GEN_50 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_38; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_51 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_39; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_52 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_40; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_53 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_43; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_54 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_44; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_55 = 8'h2b == instr[15:8] ? 1'h0 : _GEN_45; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_56 = 8'h2a == instr[15:8] ? 3'h6 : _GEN_46; // @[DecodeFsmd.scala 168:12 92:24]
  wire [2:0] _GEN_57 = 8'h2a == instr[15:8] ? 3'h3 : _GEN_47; // @[DecodeFsmd.scala 169:14 92:24]
  wire [3:0] _GEN_58 = 8'h2a == instr[15:8] ? 4'hc : _GEN_48; // @[DecodeFsmd.scala 170:17 92:24]
  wire [31:0] _GEN_59 = 8'h2a == instr[15:8] ? _d_operand_T_5 : _GEN_49; // @[DecodeFsmd.scala 171:17 92:24]
  wire  _GEN_60 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_50; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_61 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_51; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_62 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_52; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_63 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_53; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_64 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_54; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_65 = 8'h2a == instr[15:8] ? 1'h0 : _GEN_55; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_66 = 8'h29 == instr[15:8] ? 3'h6 : _GEN_56; // @[DecodeFsmd.scala 161:12 92:24]
  wire [2:0] _GEN_67 = 8'h29 == instr[15:8] ? 3'h3 : _GEN_57; // @[DecodeFsmd.scala 162:14 92:24]
  wire [3:0] _GEN_68 = 8'h29 == instr[15:8] ? 4'he : _GEN_58; // @[DecodeFsmd.scala 163:17 92:24]
  wire [31:0] _GEN_69 = 8'h29 == instr[15:8] ? _d_operand_T_3 : _GEN_59; // @[DecodeFsmd.scala 164:17 92:24]
  wire  _GEN_70 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_60; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_71 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_61; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_72 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_62; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_73 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_63; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_74 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_64; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_75 = 8'h29 == instr[15:8] ? 1'h0 : _GEN_65; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_76 = 8'h27 == instr[15:8] ? 3'h5 : _GEN_66; // @[DecodeFsmd.scala 155:12 92:24]
  wire [2:0] _GEN_77 = 8'h27 == instr[15:8] ? 3'h3 : _GEN_67; // @[DecodeFsmd.scala 156:14 92:24]
  wire [3:0] _GEN_79 = 8'h27 == instr[15:8] ? 4'hf : _GEN_68; // @[DecodeFsmd.scala 158:17 92:24]
  wire [31:0] _GEN_80 = 8'h27 == instr[15:8] ? _GEN_5 : _GEN_69; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_81 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_70; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_82 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_71; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_83 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_72; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_84 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_73; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_85 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_74; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_86 = 8'h27 == instr[15:8] ? 1'h0 : _GEN_75; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_87 = 8'h26 == instr[15:8] ? 3'h2 : _GEN_77; // @[DecodeFsmd.scala 150:14 92:24]
  wire [2:0] _GEN_88 = 8'h26 == instr[15:8] ? 3'h5 : _GEN_76; // @[DecodeFsmd.scala 151:12 92:24]
  wire [3:0] _GEN_89 = 8'h26 == instr[15:8] ? 4'hf : _GEN_79; // @[DecodeFsmd.scala 152:17 92:24]
  wire [31:0] _GEN_91 = 8'h26 == instr[15:8] ? _GEN_5 : _GEN_80; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_92 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_81; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_93 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_82; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_94 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_83; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_95 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_84; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_96 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_85; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_97 = 8'h26 == instr[15:8] ? 1'h0 : _GEN_86; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_98 = 8'h25 == instr[15:8] ? 3'h4 : _GEN_88; // @[DecodeFsmd.scala 144:12 92:24]
  wire [2:0] _GEN_99 = 8'h25 == instr[15:8] ? 3'h3 : _GEN_87; // @[DecodeFsmd.scala 145:14 92:24]
  wire [3:0] _GEN_101 = 8'h25 == instr[15:8] ? 4'hf : _GEN_89; // @[DecodeFsmd.scala 147:17 92:24]
  wire [31:0] _GEN_102 = 8'h25 == instr[15:8] ? _GEN_5 : _GEN_91; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_103 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_92; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_104 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_93; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_105 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_94; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_106 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_95; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_107 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_96; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_108 = 8'h25 == instr[15:8] ? 1'h0 : _GEN_97; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_109 = 8'h24 == instr[15:8] ? 3'h2 : _GEN_99; // @[DecodeFsmd.scala 139:14 92:24]
  wire [2:0] _GEN_110 = 8'h24 == instr[15:8] ? 3'h4 : _GEN_98; // @[DecodeFsmd.scala 140:12 92:24]
  wire [3:0] _GEN_111 = 8'h24 == instr[15:8] ? 4'hf : _GEN_101; // @[DecodeFsmd.scala 141:17 92:24]
  wire [31:0] _GEN_113 = 8'h24 == instr[15:8] ? _GEN_5 : _GEN_102; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_114 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_103; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_115 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_104; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_116 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_105; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_117 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_106; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_118 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_107; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_119 = 8'h24 == instr[15:8] ? 1'h0 : _GEN_108; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_120 = 8'h23 == instr[15:8] ? 3'h3 : _GEN_109; // @[DecodeFsmd.scala 133:14 92:24]
  wire [2:0] _GEN_121 = 8'h23 == instr[15:8] ? 3'h3 : _GEN_110; // @[DecodeFsmd.scala 134:12 92:24]
  wire [3:0] _GEN_123 = 8'h23 == instr[15:8] ? 4'hf : _GEN_111; // @[DecodeFsmd.scala 136:17 92:24]
  wire [31:0] _GEN_124 = 8'h23 == instr[15:8] ? _GEN_5 : _GEN_113; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_125 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_114; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_126 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_115; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_127 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_116; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_128 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_117; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_129 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_118; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_130 = 8'h23 == instr[15:8] ? 1'h0 : _GEN_119; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_131 = 8'h22 == instr[15:8] ? 3'h2 : _GEN_120; // @[DecodeFsmd.scala 128:14 92:24]
  wire [2:0] _GEN_132 = 8'h22 == instr[15:8] ? 3'h3 : _GEN_121; // @[DecodeFsmd.scala 129:12 92:24]
  wire [3:0] _GEN_133 = 8'h22 == instr[15:8] ? 4'hf : _GEN_123; // @[DecodeFsmd.scala 130:17 92:24]
  wire [31:0] _GEN_135 = 8'h22 == instr[15:8] ? _GEN_5 : _GEN_124; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_136 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_125; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_137 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_126; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_138 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_127; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_139 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_128; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_140 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_129; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_141 = 8'h22 == instr[15:8] ? 1'h0 : _GEN_130; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_142 = 8'h21 == instr[15:8] ? 3'h3 : _GEN_131; // @[DecodeFsmd.scala 123:14 92:24]
  wire [2:0] _GEN_143 = 8'h21 == instr[15:8] ? 3'h6 : _GEN_132; // @[DecodeFsmd.scala 124:12 92:24]
  wire [3:0] _GEN_144 = 8'h21 == instr[15:8] ? 4'hf : _GEN_133; // @[DecodeFsmd.scala 125:17 92:24]
  wire [31:0] _GEN_146 = 8'h21 == instr[15:8] ? _GEN_5 : _GEN_135; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_147 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_136; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_148 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_137; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_149 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_138; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_150 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_139; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_151 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_140; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_152 = 8'h21 == instr[15:8] ? 1'h0 : _GEN_141; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_153 = 8'h20 == instr[15:8] ? 3'h2 : _GEN_142; // @[DecodeFsmd.scala 118:14 92:24]
  wire [2:0] _GEN_154 = 8'h20 == instr[15:8] ? 3'h6 : _GEN_143; // @[DecodeFsmd.scala 119:12 92:24]
  wire [3:0] _GEN_155 = 8'h20 == instr[15:8] ? 4'hf : _GEN_144; // @[DecodeFsmd.scala 120:17 92:24]
  wire [31:0] _GEN_157 = 8'h20 == instr[15:8] ? _GEN_5 : _GEN_146; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_158 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_147; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_159 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_148; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_160 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_149; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_161 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_150; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_162 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_151; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_163 = 8'h20 == instr[15:8] ? 1'h0 : _GEN_152; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_164 = 8'h10 == instr[15:8] ? 3'h7 : _GEN_154; // @[DecodeFsmd.scala 114:12 92:24]
  wire [3:0] _GEN_165 = 8'h10 == instr[15:8] ? 4'hf : _GEN_155; // @[DecodeFsmd.scala 115:17 92:24]
  wire [2:0] _GEN_166 = 8'h10 == instr[15:8] ? 3'h1 : _GEN_153; // @[DecodeFsmd.scala 37:12 92:24]
  wire [31:0] _GEN_168 = 8'h10 == instr[15:8] ? _GEN_5 : _GEN_157; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_169 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_158; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_170 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_159; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_171 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_160; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_172 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_161; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_173 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_162; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_174 = 8'h10 == instr[15:8] ? 1'h0 : _GEN_163; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_175 = 8'hd == instr[15:8] ? 3'h3 : _GEN_166; // @[DecodeFsmd.scala 109:14 92:24]
  wire [2:0] _GEN_176 = 8'hd == instr[15:8] ? 3'h2 : _GEN_164; // @[DecodeFsmd.scala 110:12 92:24]
  wire [3:0] _GEN_177 = 8'hd == instr[15:8] ? 4'hf : _GEN_165; // @[DecodeFsmd.scala 111:17 92:24]
  wire [31:0] _GEN_179 = 8'hd == instr[15:8] ? _GEN_5 : _GEN_168; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_180 = 8'hd == instr[15:8] ? 1'h0 : _GEN_169; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_181 = 8'hd == instr[15:8] ? 1'h0 : _GEN_170; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_182 = 8'hd == instr[15:8] ? 1'h0 : _GEN_171; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_183 = 8'hd == instr[15:8] ? 1'h0 : _GEN_172; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_184 = 8'hd == instr[15:8] ? 1'h0 : _GEN_173; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_185 = 8'hd == instr[15:8] ? 1'h0 : _GEN_174; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_186 = 8'hc == instr[15:8] ? 3'h2 : _GEN_175; // @[DecodeFsmd.scala 104:14 92:24]
  wire [2:0] _GEN_187 = 8'hc == instr[15:8] ? 3'h2 : _GEN_176; // @[DecodeFsmd.scala 105:12 92:24]
  wire [3:0] _GEN_188 = 8'hc == instr[15:8] ? 4'hf : _GEN_177; // @[DecodeFsmd.scala 106:17 92:24]
  wire [31:0] _GEN_190 = 8'hc == instr[15:8] ? _GEN_5 : _GEN_179; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_191 = 8'hc == instr[15:8] ? 1'h0 : _GEN_180; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_192 = 8'hc == instr[15:8] ? 1'h0 : _GEN_181; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_193 = 8'hc == instr[15:8] ? 1'h0 : _GEN_182; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_194 = 8'hc == instr[15:8] ? 1'h0 : _GEN_183; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_195 = 8'hc == instr[15:8] ? 1'h0 : _GEN_184; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_196 = 8'hc == instr[15:8] ? 1'h0 : _GEN_185; // @[DecodeFsmd.scala 48:12 92:24]
  wire [2:0] _GEN_197 = 8'h9 == instr[15:8] ? 3'h3 : _GEN_186; // @[DecodeFsmd.scala 92:24 99:14]
  wire [2:0] _GEN_198 = 8'h9 == instr[15:8] ? 3'h1 : _GEN_187; // @[DecodeFsmd.scala 100:12 92:24]
  wire [3:0] _GEN_199 = 8'h9 == instr[15:8] ? 4'hf : _GEN_188; // @[DecodeFsmd.scala 101:17 92:24]
  wire [31:0] _GEN_201 = 8'h9 == instr[15:8] ? _GEN_5 : _GEN_190; // @[DecodeFsmd.scala 92:24]
  wire  _GEN_202 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_191; // @[DecodeFsmd.scala 42:15 92:24]
  wire  _GEN_203 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_192; // @[DecodeFsmd.scala 47:18 92:24]
  wire  _GEN_204 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_193; // @[DecodeFsmd.scala 44:17 92:24]
  wire  _GEN_205 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_194; // @[DecodeFsmd.scala 45:18 92:24]
  wire  _GEN_206 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_195; // @[DecodeFsmd.scala 43:18 92:24]
  wire  _GEN_207 = 8'h9 == instr[15:8] ? 1'h0 : _GEN_196; // @[DecodeFsmd.scala 48:12 92:24]
  assign io_dout_next = 8'h8 == instr[15:8] ? 3'h2 : _GEN_197; // @[DecodeFsmd.scala 92:24 94:14]
  assign io_dout_operand = 8'h8 == instr[15:8] ? _GEN_5 : _GEN_201; // @[DecodeFsmd.scala 92:24]
  assign io_dout_enaMask = 8'h8 == instr[15:8] ? 4'hf : _GEN_199; // @[DecodeFsmd.scala 92:24 96:17]
  assign io_dout_op = 8'h8 == instr[15:8] ? 3'h1 : _GEN_198; // @[DecodeFsmd.scala 92:24 95:12]
  assign io_dout_isStore = 8'h8 == instr[15:8] ? 1'h0 : _GEN_202; // @[DecodeFsmd.scala 42:15 92:24]
  assign io_dout_isStoreInd = 8'h8 == instr[15:8] ? 1'h0 : _GEN_206; // @[DecodeFsmd.scala 43:18 92:24]
  assign io_dout_isLoadInd = 8'h8 == instr[15:8] ? 1'h0 : _GEN_204; // @[DecodeFsmd.scala 44:17 92:24]
  assign io_dout_isLoadIndB = 8'h8 == instr[15:8] ? 1'h0 : _GEN_205; // @[DecodeFsmd.scala 45:18 92:24]
  assign io_dout_isLoadAddr = 8'h8 == instr[15:8] ? 1'h0 : _GEN_203; // @[DecodeFsmd.scala 47:18 92:24]
  assign io_dout_exit = 8'h8 == instr[15:8] ? 1'h0 : _GEN_207; // @[DecodeFsmd.scala 48:12 92:24]
endmodule
module LerosFsmd(
  input         clock,
  input         reset,
  output [31:0] io_dout,
  output [31:0] io_dbg_acc,
  output [9:0]  io_dbg_pc,
  output [15:0] io_dbg_instr,
  output        io_dbg_exit
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_REG_INIT
  wire  alu_clock; // @[Leros.scala 30:19]
  wire  alu_reset; // @[Leros.scala 30:19]
  wire [2:0] alu_io_op; // @[Leros.scala 30:19]
  wire [31:0] alu_io_din; // @[Leros.scala 30:19]
  wire [3:0] alu_io_enaMask; // @[Leros.scala 30:19]
  wire  alu_io_enaByte; // @[Leros.scala 30:19]
  wire [1:0] alu_io_off; // @[Leros.scala 30:19]
  wire [31:0] alu_io_accu; // @[Leros.scala 30:19]
  wire  mem_clock; // @[Leros.scala 41:19]
  wire  mem_reset; // @[Leros.scala 41:19]
  wire [9:0] mem_io_addr; // @[Leros.scala 41:19]
  wire [15:0] mem_io_instr; // @[Leros.scala 41:19]
  reg [31:0] dataMem [0:1023]; // @[Leros.scala 53:28]
  wire  dataMem_dataRead_en; // @[Leros.scala 53:28]
  wire [9:0] dataMem_dataRead_addr; // @[Leros.scala 53:28]
  wire [31:0] dataMem_dataRead_data; // @[Leros.scala 53:28]
  wire [31:0] dataMem_MPORT_data; // @[Leros.scala 53:28]
  wire [9:0] dataMem_MPORT_addr; // @[Leros.scala 53:28]
  wire  dataMem_MPORT_mask; // @[Leros.scala 53:28]
  wire  dataMem_MPORT_en; // @[Leros.scala 53:28]
  reg  dataMem_dataRead_en_pipe_0;
  reg [9:0] dataMem_dataRead_addr_pipe_0;
  wire [15:0] dec_io_din; // @[LerosFsmd.scala 20:19]
  wire [2:0] dec_io_dout_next; // @[LerosFsmd.scala 20:19]
  wire [31:0] dec_io_dout_operand; // @[LerosFsmd.scala 20:19]
  wire [3:0] dec_io_dout_enaMask; // @[LerosFsmd.scala 20:19]
  wire [2:0] dec_io_dout_op; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_isStore; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_isStoreInd; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_isLoadInd; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_isLoadIndB; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_isLoadAddr; // @[LerosFsmd.scala 20:19]
  wire  dec_io_dout_exit; // @[LerosFsmd.scala 20:19]
  reg [9:0] pcReg; // @[Leros.scala 35:22]
  reg [9:0] addrReg; // @[Leros.scala 36:24]
  wire [9:0] pcNext = pcReg + 10'h1; // @[Leros.scala 38:34]
  reg [7:0] instrLowReg; // @[Leros.scala 49:28]
  reg  exit; // @[Leros.scala 57:21]
  reg [31:0] outReg; // @[Leros.scala 59:23]
  reg [31:0] io_dbg_acc_REG; // @[Leros.scala 63:34]
  reg [31:0] io_dbg_acc_REG_1; // @[Leros.scala 63:26]
  reg [9:0] io_dbg_pc_REG; // @[Leros.scala 64:33]
  reg [9:0] io_dbg_pc_REG_1; // @[Leros.scala 64:25]
  reg [15:0] io_dbg_instr_REG; // @[Leros.scala 65:36]
  reg [15:0] io_dbg_instr_REG_1; // @[Leros.scala 65:28]
  reg  io_dbg_exit_REG; // @[Leros.scala 66:35]
  reg  io_dbg_exit_REG_1; // @[Leros.scala 66:27]
  reg [2:0] stateReg; // @[LerosFsmd.scala 15:25]
  reg [31:0] decReg_operand; // @[LerosFsmd.scala 17:23]
  reg [3:0] decReg_enaMask; // @[LerosFsmd.scala 17:23]
  reg [2:0] decReg_op; // @[LerosFsmd.scala 17:23]
  reg  decReg_isStore; // @[LerosFsmd.scala 17:23]
  reg  decReg_isStoreInd; // @[LerosFsmd.scala 17:23]
  reg  decReg_isLoadIndB; // @[LerosFsmd.scala 17:23]
  reg  decReg_isLoadAddr; // @[LerosFsmd.scala 17:23]
  reg  decReg_exit; // @[LerosFsmd.scala 17:23]
  wire [9:0] _effAddr_T = addrReg; // @[LerosFsmd.scala 24:26]
  wire [31:0] _GEN_75 = {{22{_effAddr_T[9]}},_effAddr_T}; // @[LerosFsmd.scala 24:33]
  wire [31:0] effAddr = $signed(_GEN_75) + $signed(dec_io_dout_operand); // @[LerosFsmd.scala 24:58]
  wire [29:0] effAddrWord = effAddr[31:2]; // @[LerosFsmd.scala 25:30]
  wire [29:0] address = dec_io_dout_isLoadInd ? effAddrWord : {{22'd0}, mem_io_instr[7:0]}; // @[LerosFsmd.scala 27:20]
  reg [1:0] alu_io_off_REG; // @[LerosFsmd.scala 36:24]
  wire  _T_2 = 3'h0 == stateReg; // @[LerosFsmd.scala 40:20]
  wire  _GEN_45 = 3'h2 == stateReg ? 1'h0 : 3'h3 == stateReg; // @[LerosFsmd.scala 40:20]
  wire  useDecOpd = 3'h0 == stateReg ? 1'h0 : _GEN_45; // @[LerosFsmd.scala 40:20]
  wire [31:0] _GEN_4 = decReg_isLoadAddr ? alu_io_accu : {{22'd0}, addrReg}; // @[LerosFsmd.scala 68:32 69:17 Leros.scala 36:24]
  wire [3:0] _GEN_5 = decReg_isLoadAddr ? 4'h0 : decReg_enaMask; // @[LerosFsmd.scala 67:22 68:32 70:24]
  wire  _T_15 = decReg_isStore | decReg_isStoreInd; // @[LerosFsmd.scala 75:28]
  wire [29:0] writeAddress = decReg_isStoreInd ? effAddrWord : {{22'd0}, instrLowReg}; // @[LerosFsmd.scala 76:31]
  wire [3:0] _GEN_11 = decReg_isStore | decReg_isStoreInd ? 4'h0 : _GEN_5; // @[LerosFsmd.scala 75:50 78:24]
  wire [9:0] _GEN_12 = 3'h1 == stateReg ? pcNext : pcReg; // @[LerosFsmd.scala 40:20 66:13 Leros.scala 35:22]
  wire [3:0] _GEN_13 = 3'h1 == stateReg ? _GEN_11 : 4'h0; // @[LerosFsmd.scala 31:18 40:20]
  wire [31:0] _GEN_14 = 3'h1 == stateReg ? _GEN_4 : {{22'd0}, addrReg}; // @[LerosFsmd.scala 40:20 Leros.scala 36:24]
  wire [2:0] _GEN_20 = 3'h1 == stateReg ? 3'h0 : stateReg; // @[LerosFsmd.scala 40:20 80:16 15:25]
  wire [9:0] _GEN_21 = 3'h4 == stateReg ? pcNext : _GEN_12; // @[LerosFsmd.scala 40:20 60:13]
  wire [31:0] _GEN_22 = 3'h4 == stateReg ? alu_io_accu : outReg; // @[LerosFsmd.scala 40:20 61:14 Leros.scala 59:23]
  wire [2:0] _GEN_23 = 3'h4 == stateReg ? 3'h0 : _GEN_20; // @[LerosFsmd.scala 40:20 62:16]
  wire [3:0] _GEN_24 = 3'h4 == stateReg ? 4'h0 : _GEN_13; // @[LerosFsmd.scala 31:18 40:20]
  wire [31:0] _GEN_25 = 3'h4 == stateReg ? {{22'd0}, addrReg} : _GEN_14; // @[LerosFsmd.scala 40:20 Leros.scala 36:24]
  wire  _GEN_28 = 3'h4 == stateReg ? 1'h0 : 3'h1 == stateReg & _T_15; // @[LerosFsmd.scala 40:20 Leros.scala 53:28]
  wire [3:0] _GEN_32 = 3'h3 == stateReg ? decReg_enaMask : _GEN_24; // @[LerosFsmd.scala 40:20 54:22]
  wire [31:0] _GEN_36 = 3'h3 == stateReg ? {{22'd0}, addrReg} : _GEN_25; // @[LerosFsmd.scala 40:20 Leros.scala 36:24]
  wire  _GEN_39 = 3'h3 == stateReg ? 1'h0 : _GEN_28; // @[LerosFsmd.scala 40:20 Leros.scala 53:28]
  wire [3:0] _GEN_43 = 3'h2 == stateReg ? decReg_enaMask : _GEN_32; // @[LerosFsmd.scala 40:20 48:22]
  wire [31:0] _GEN_47 = 3'h2 == stateReg ? {{22'd0}, addrReg} : _GEN_36; // @[LerosFsmd.scala 40:20 Leros.scala 36:24]
  wire  _GEN_50 = 3'h2 == stateReg ? 1'h0 : _GEN_39; // @[LerosFsmd.scala 40:20 Leros.scala 53:28]
  wire [31:0] _GEN_69 = 3'h0 == stateReg ? {{22'd0}, addrReg} : _GEN_47; // @[LerosFsmd.scala 40:20 Leros.scala 36:24]
  reg  exit_REG; // @[LerosFsmd.scala 85:18]
  wire [31:0] _GEN_76 = reset ? 32'h0 : _GEN_69; // @[Leros.scala 36:{24,24}]
  AluAccu alu ( // @[Leros.scala 30:19]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_op(alu_io_op),
    .io_din(alu_io_din),
    .io_enaMask(alu_io_enaMask),
    .io_enaByte(alu_io_enaByte),
    .io_off(alu_io_off),
    .io_accu(alu_io_accu)
  );
  InstrMem mem ( // @[Leros.scala 41:19]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_addr(mem_io_addr),
    .io_instr(mem_io_instr)
  );
  DecodeFsmd dec ( // @[LerosFsmd.scala 20:19]
    .io_din(dec_io_din),
    .io_dout_next(dec_io_dout_next),
    .io_dout_operand(dec_io_dout_operand),
    .io_dout_enaMask(dec_io_dout_enaMask),
    .io_dout_op(dec_io_dout_op),
    .io_dout_isStore(dec_io_dout_isStore),
    .io_dout_isStoreInd(dec_io_dout_isStoreInd),
    .io_dout_isLoadInd(dec_io_dout_isLoadInd),
    .io_dout_isLoadIndB(dec_io_dout_isLoadIndB),
    .io_dout_isLoadAddr(dec_io_dout_isLoadAddr),
    .io_dout_exit(dec_io_dout_exit)
  );
  assign dataMem_dataRead_en = dataMem_dataRead_en_pipe_0;
  assign dataMem_dataRead_addr = dataMem_dataRead_addr_pipe_0;
  assign dataMem_dataRead_data = dataMem[dataMem_dataRead_addr]; // @[Leros.scala 53:28]
  assign dataMem_MPORT_data = alu_io_accu;
  assign dataMem_MPORT_addr = writeAddress[9:0];
  assign dataMem_MPORT_mask = 1'h1;
  assign dataMem_MPORT_en = _T_2 ? 1'h0 : _GEN_50;
  assign io_dout = outReg; // @[Leros.scala 60:11]
  assign io_dbg_acc = io_dbg_acc_REG_1; // @[Leros.scala 63:16]
  assign io_dbg_pc = io_dbg_pc_REG_1; // @[Leros.scala 64:15]
  assign io_dbg_instr = io_dbg_instr_REG_1; // @[Leros.scala 65:18]
  assign io_dbg_exit = io_dbg_exit_REG_1; // @[Leros.scala 66:17]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_op = decReg_op; // @[LerosFsmd.scala 34:13]
  assign alu_io_din = useDecOpd ? decReg_operand : dataMem_dataRead_data; // @[LerosFsmd.scala 38:20]
  assign alu_io_enaMask = 3'h0 == stateReg ? 4'h0 : _GEN_43; // @[LerosFsmd.scala 31:18 40:20]
  assign alu_io_enaByte = decReg_isLoadIndB; // @[LerosFsmd.scala 35:18]
  assign alu_io_off = alu_io_off_REG; // @[LerosFsmd.scala 36:14]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_addr = pcReg + 10'h1; // @[Leros.scala 38:34]
  assign dec_io_din = mem_io_instr; // @[LerosFsmd.scala 21:14]
  always @(posedge clock) begin
    if (dataMem_MPORT_en & dataMem_MPORT_mask) begin
      dataMem[dataMem_MPORT_addr] <= dataMem_MPORT_data; // @[Leros.scala 53:28]
    end
    dataMem_dataRead_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dataMem_dataRead_addr_pipe_0 <= address[9:0];
    end
    if (reset) begin // @[Leros.scala 35:22]
      pcReg <= 10'h0; // @[Leros.scala 35:22]
    end else if (!(3'h0 == stateReg)) begin // @[LerosFsmd.scala 40:20]
      if (3'h2 == stateReg) begin // @[LerosFsmd.scala 40:20]
        pcReg <= pcNext; // @[LerosFsmd.scala 47:13]
      end else if (3'h3 == stateReg) begin // @[LerosFsmd.scala 40:20]
        pcReg <= pcNext; // @[LerosFsmd.scala 53:13]
      end else begin
        pcReg <= _GEN_21;
      end
    end
    addrReg <= _GEN_76[9:0]; // @[Leros.scala 36:{24,24}]
    instrLowReg <= mem_io_instr[7:0]; // @[Leros.scala 49:34]
    if (reset) begin // @[Leros.scala 57:21]
      exit <= 1'h0; // @[Leros.scala 57:21]
    end else begin
      exit <= exit_REG; // @[LerosFsmd.scala 85:8]
    end
    if (reset) begin // @[Leros.scala 59:23]
      outReg <= 32'h0; // @[Leros.scala 59:23]
    end else if (!(3'h0 == stateReg)) begin // @[LerosFsmd.scala 40:20]
      if (!(3'h2 == stateReg)) begin // @[LerosFsmd.scala 40:20]
        if (!(3'h3 == stateReg)) begin // @[LerosFsmd.scala 40:20]
          outReg <= _GEN_22;
        end
      end
    end
    io_dbg_acc_REG <= alu_io_accu; // @[Leros.scala 63:34]
    io_dbg_acc_REG_1 <= io_dbg_acc_REG; // @[Leros.scala 63:26]
    io_dbg_pc_REG <= pcReg; // @[Leros.scala 64:33]
    io_dbg_pc_REG_1 <= io_dbg_pc_REG; // @[Leros.scala 64:25]
    io_dbg_instr_REG <= mem_io_instr; // @[Leros.scala 65:36]
    io_dbg_instr_REG_1 <= io_dbg_instr_REG; // @[Leros.scala 65:28]
    io_dbg_exit_REG <= exit; // @[Leros.scala 66:35]
    io_dbg_exit_REG_1 <= io_dbg_exit_REG; // @[Leros.scala 66:27]
    if (reset) begin // @[LerosFsmd.scala 15:25]
      stateReg <= 3'h0; // @[LerosFsmd.scala 15:25]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      stateReg <= dec_io_dout_next; // @[LerosFsmd.scala 43:16]
    end else if (3'h2 == stateReg) begin // @[LerosFsmd.scala 40:20]
      stateReg <= 3'h0; // @[LerosFsmd.scala 49:16]
    end else if (3'h3 == stateReg) begin // @[LerosFsmd.scala 40:20]
      stateReg <= 3'h0; // @[LerosFsmd.scala 56:16]
    end else begin
      stateReg <= _GEN_23;
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_operand <= 32'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_operand <= dec_io_dout_operand; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_enaMask <= 4'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_enaMask <= dec_io_dout_enaMask; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_op <= 3'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_op <= dec_io_dout_op; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_isStore <= 1'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_isStore <= dec_io_dout_isStore; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_isStoreInd <= 1'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_isStoreInd <= dec_io_dout_isStoreInd; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_isLoadIndB <= 1'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_isLoadIndB <= dec_io_dout_isLoadIndB; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_isLoadAddr <= 1'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_isLoadAddr <= dec_io_dout_isLoadAddr; // @[LerosFsmd.scala 42:14]
    end
    if (reset) begin // @[LerosFsmd.scala 17:23]
      decReg_exit <= 1'h0; // @[LerosFsmd.scala 17:23]
    end else if (3'h0 == stateReg) begin // @[LerosFsmd.scala 40:20]
      decReg_exit <= dec_io_dout_exit; // @[LerosFsmd.scala 42:14]
    end
    alu_io_off_REG <= effAddr[1:0]; // @[LerosFsmd.scala 36:32]
    exit_REG <= decReg_exit; // @[LerosFsmd.scala 85:18]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    dataMem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dataMem_dataRead_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  dataMem_dataRead_addr_pipe_0 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  pcReg = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  addrReg = _RAND_4[9:0];
  _RAND_5 = {1{`RANDOM}};
  instrLowReg = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  exit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  outReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  io_dbg_acc_REG = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  io_dbg_acc_REG_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  io_dbg_pc_REG = _RAND_10[9:0];
  _RAND_11 = {1{`RANDOM}};
  io_dbg_pc_REG_1 = _RAND_11[9:0];
  _RAND_12 = {1{`RANDOM}};
  io_dbg_instr_REG = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  io_dbg_instr_REG_1 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  io_dbg_exit_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_dbg_exit_REG_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stateReg = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  decReg_operand = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  decReg_enaMask = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  decReg_op = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  decReg_isStore = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  decReg_isStoreInd = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  decReg_isLoadIndB = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  decReg_isLoadAddr = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  decReg_exit = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  alu_io_off_REG = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  exit_REG = _RAND_26[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
