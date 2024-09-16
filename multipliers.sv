//`include "D:/BKU/CTMT/2011919_Pipelined_Processor/ALU.sv"  

module multipliers (
  input  logic [31:0] operand_a, operand_b,
  output logic [63:0] P
  );
  
  logic [31:0][31:0] sum_io;
  logic [31:0] carry_io;

  logic [31:0][31:0] ab_iA;
  logic [31:0][31:0] iB;
  
  always_comb begin
      integer i;
      for (i = 0; i < 32; i = i + 1) begin
          ab_iA[i] = operand_a & {32{operand_b[i]}}; // a[m] * b[n] = ab[n][m]
      end
      for (i = 1; i < 33; i = i + 1) begin
          iB[i-1] = {{carry_io[i-1]}, {sum_io[i-1][31:1]}};
      end
  end
  assign carry_io[0] = 1'b0;
  assign   sum_io[0] = ab_iA[0];
  
  addsub_32b  b1  (.A( ab_iA[ 1] ), .B(  iB[ 0] ), .add_sub( 1'b0 ), .S( sum_io[ 1] ), .carry_o( carry_io[ 1] ) );
  addsub_32b  b2  (.A( ab_iA[ 2] ), .B(  iB[ 1] ), .add_sub( 1'b0 ), .S( sum_io[ 2] ), .carry_o( carry_io[ 2] ) );
  addsub_32b  b3  (.A( ab_iA[ 3] ), .B(  iB[ 2] ), .add_sub( 1'b0 ), .S( sum_io[ 3] ), .carry_o( carry_io[ 3] ) );
  addsub_32b  b4  (.A( ab_iA[ 4] ), .B(  iB[ 3] ), .add_sub( 1'b0 ), .S( sum_io[ 4] ), .carry_o( carry_io[ 4] ) );
  addsub_32b  b5  (.A( ab_iA[ 5] ), .B(  iB[ 4] ), .add_sub( 1'b0 ), .S( sum_io[ 5] ), .carry_o( carry_io[ 5] ) );
  addsub_32b  b6  (.A( ab_iA[ 6] ), .B(  iB[ 5] ), .add_sub( 1'b0 ), .S( sum_io[ 6] ), .carry_o( carry_io[ 6] ) );
  addsub_32b  b7  (.A( ab_iA[ 7] ), .B(  iB[ 6] ), .add_sub( 1'b0 ), .S( sum_io[ 7] ), .carry_o( carry_io[ 7] ) );
  addsub_32b  b8  (.A( ab_iA[ 8] ), .B(  iB[ 7] ), .add_sub( 1'b0 ), .S( sum_io[ 8] ), .carry_o( carry_io[ 8] ) );
  addsub_32b  b9  (.A( ab_iA[ 9] ), .B(  iB[ 8] ), .add_sub( 1'b0 ), .S( sum_io[ 9] ), .carry_o( carry_io[ 9] ) );
  addsub_32b  b10 (.A( ab_iA[10] ), .B(  iB[ 9] ), .add_sub( 1'b0 ), .S( sum_io[10] ), .carry_o( carry_io[10] ) );
  addsub_32b  b11 (.A( ab_iA[11] ), .B(  iB[10] ), .add_sub( 1'b0 ), .S( sum_io[11] ), .carry_o( carry_io[11] ) );
  addsub_32b  b12 (.A( ab_iA[12] ), .B(  iB[11] ), .add_sub( 1'b0 ), .S( sum_io[12] ), .carry_o( carry_io[12] ) );
  addsub_32b  b13 (.A( ab_iA[13] ), .B(  iB[12] ), .add_sub( 1'b0 ), .S( sum_io[13] ), .carry_o( carry_io[13] ) );
  addsub_32b  b14 (.A( ab_iA[14] ), .B(  iB[13] ), .add_sub( 1'b0 ), .S( sum_io[14] ), .carry_o( carry_io[14] ) );
  addsub_32b  b15 (.A( ab_iA[15] ), .B(  iB[14] ), .add_sub( 1'b0 ), .S( sum_io[15] ), .carry_o( carry_io[15] ) );
  addsub_32b  b16 (.A( ab_iA[16] ), .B(  iB[15] ), .add_sub( 1'b0 ), .S( sum_io[16] ), .carry_o( carry_io[16] ) );
  addsub_32b  b17 (.A( ab_iA[17] ), .B(  iB[16] ), .add_sub( 1'b0 ), .S( sum_io[17] ), .carry_o( carry_io[17] ) );
  addsub_32b  b18 (.A( ab_iA[18] ), .B(  iB[17] ), .add_sub( 1'b0 ), .S( sum_io[18] ), .carry_o( carry_io[18] ) );
  addsub_32b  b19 (.A( ab_iA[19] ), .B(  iB[18] ), .add_sub( 1'b0 ), .S( sum_io[19] ), .carry_o( carry_io[19] ) );
  addsub_32b  b20 (.A( ab_iA[20] ), .B(  iB[19] ), .add_sub( 1'b0 ), .S( sum_io[20] ), .carry_o( carry_io[20] ) );
  addsub_32b  b21 (.A( ab_iA[21] ), .B(  iB[20] ), .add_sub( 1'b0 ), .S( sum_io[21] ), .carry_o( carry_io[21] ) );
  addsub_32b  b22 (.A( ab_iA[22] ), .B(  iB[21] ), .add_sub( 1'b0 ), .S( sum_io[22] ), .carry_o( carry_io[22] ) );
  addsub_32b  b23 (.A( ab_iA[23] ), .B(  iB[22] ), .add_sub( 1'b0 ), .S( sum_io[23] ), .carry_o( carry_io[23] ) );
  addsub_32b  b24 (.A( ab_iA[24] ), .B(  iB[23] ), .add_sub( 1'b0 ), .S( sum_io[24] ), .carry_o( carry_io[24] ) );
  addsub_32b  b25 (.A( ab_iA[25] ), .B(  iB[24] ), .add_sub( 1'b0 ), .S( sum_io[25] ), .carry_o( carry_io[25] ) );
  addsub_32b  b26 (.A( ab_iA[26] ), .B(  iB[25] ), .add_sub( 1'b0 ), .S( sum_io[26] ), .carry_o( carry_io[26] ) );
  addsub_32b  b27 (.A( ab_iA[27] ), .B(  iB[26] ), .add_sub( 1'b0 ), .S( sum_io[27] ), .carry_o( carry_io[27] ) );
  addsub_32b  b28 (.A( ab_iA[28] ), .B(  iB[27] ), .add_sub( 1'b0 ), .S( sum_io[28] ), .carry_o( carry_io[28] ) );
  addsub_32b  b29 (.A( ab_iA[29] ), .B(  iB[28] ), .add_sub( 1'b0 ), .S( sum_io[29] ), .carry_o( carry_io[29] ) );
  addsub_32b  b30 (.A( ab_iA[30] ), .B(  iB[29] ), .add_sub( 1'b0 ), .S( sum_io[30] ), .carry_o( carry_io[30] ) );
  addsub_32b  b31 (.A( ab_iA[31] ), .B(  iB[30] ), .add_sub( 1'b0 ), .S( sum_io[31] ), .carry_o( carry_io[31] ) );
  
  always_comb begin
      integer i;
      for (i =  0; i < 31; i = i + 1) begin
           P[i] = sum_io[i][0];
      end
      for (i = 31; i < 63; i = i + 1) begin
           P[i] = sum_io[31][i-31];
      end
      P[63] = carry_io[31];
  end
  
endmodule: multipliers