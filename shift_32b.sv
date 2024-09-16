module shift_right_arith_32b
(
  input  logic [31:0] in,
  input  logic [ 4:0] shamt,
  output logic [31:0] out
);
  
  logic [31:0][31:0] mux_i;

  always_comb begin
      integer i;
      for (i =  0; i < 32; i = i + 1) begin
           mux_i[i] = in >>> (i);    // using ">>>" in "for" for wiring mux_i
      end
  end
  
  mux32to1_1b b31 (.D( mux_i[31] ), .sel( shamt ), .Y( out[31] ));
  mux32to1_1b b30 (.D( mux_i[30] ), .sel( shamt ), .Y( out[30] ));
  mux32to1_1b b29 (.D( mux_i[29] ), .sel( shamt ), .Y( out[29] ));
  mux32to1_1b b28 (.D( mux_i[28] ), .sel( shamt ), .Y( out[28] ));
  mux32to1_1b b27 (.D( mux_i[27] ), .sel( shamt ), .Y( out[27] ));
  mux32to1_1b b26 (.D( mux_i[26] ), .sel( shamt ), .Y( out[26] ));
  mux32to1_1b b25 (.D( mux_i[25] ), .sel( shamt ), .Y( out[25] ));
  mux32to1_1b b24 (.D( mux_i[24] ), .sel( shamt ), .Y( out[24] ));
  mux32to1_1b b23 (.D( mux_i[23] ), .sel( shamt ), .Y( out[23] ));
  mux32to1_1b b22 (.D( mux_i[22] ), .sel( shamt ), .Y( out[22] ));
  mux32to1_1b b21 (.D( mux_i[21] ), .sel( shamt ), .Y( out[21] ));
  mux32to1_1b b20 (.D( mux_i[20] ), .sel( shamt ), .Y( out[20] ));
  mux32to1_1b b19 (.D( mux_i[19] ), .sel( shamt ), .Y( out[19] ));
  mux32to1_1b b18 (.D( mux_i[18] ), .sel( shamt ), .Y( out[18] ));
  mux32to1_1b b17 (.D( mux_i[17] ), .sel( shamt ), .Y( out[17] ));
  mux32to1_1b b16 (.D( mux_i[16] ), .sel( shamt ), .Y( out[16] ));
  mux32to1_1b b15 (.D( mux_i[15] ), .sel( shamt ), .Y( out[15] ));
  mux32to1_1b b14 (.D( mux_i[14] ), .sel( shamt ), .Y( out[14] ));
  mux32to1_1b b13 (.D( mux_i[13] ), .sel( shamt ), .Y( out[13] ));
  mux32to1_1b b12 (.D( mux_i[12] ), .sel( shamt ), .Y( out[12] ));
  mux32to1_1b b11 (.D( mux_i[11] ), .sel( shamt ), .Y( out[11] ));
  mux32to1_1b b10 (.D( mux_i[10] ), .sel( shamt ), .Y( out[10] ));
  mux32to1_1b  b9 (.D( mux_i[ 9] ), .sel( shamt ), .Y( out[ 9] ));
  mux32to1_1b  b8 (.D( mux_i[ 8] ), .sel( shamt ), .Y( out[ 8] ));
  mux32to1_1b  b7 (.D( mux_i[ 7] ), .sel( shamt ), .Y( out[ 7] ));
  mux32to1_1b  b6 (.D( mux_i[ 6] ), .sel( shamt ), .Y( out[ 6] ));
  mux32to1_1b  b5 (.D( mux_i[ 5] ), .sel( shamt ), .Y( out[ 5] ));
  mux32to1_1b  b4 (.D( mux_i[ 4] ), .sel( shamt ), .Y( out[ 4] ));
  mux32to1_1b  b3 (.D( mux_i[ 3] ), .sel( shamt ), .Y( out[ 3] ));
  mux32to1_1b  b2 (.D( mux_i[ 2] ), .sel( shamt ), .Y( out[ 2] ));
  mux32to1_1b  b1 (.D( mux_i[ 1] ), .sel( shamt ), .Y( out[ 1] ));
  mux32to1_1b  b0 (.D( mux_i[ 0] ), .sel( shamt ), .Y( out[ 0] ));
  
endmodule: shift_right_arith_32b

//////////////////////////////////////////////////////////////////////////////////

module shift_right_32b
(
  input  logic [31:0] in,
  input  logic [ 4:0] shamt,
  output logic [31:0] out
);
  
  logic [31:0][31:0] mux_i;

  always_comb begin
      integer i;
      for (i =  0; i < 32; i = i + 1) begin
           mux_i[i] = in >> (i);    // using ">>" in "for" for wiring mux_i
      end
  end
  
  mux32to1_1b b31 (.D( mux_i[31] ), .sel( shamt ), .Y( out[31] ));
  mux32to1_1b b30 (.D( mux_i[30] ), .sel( shamt ), .Y( out[30] ));
  mux32to1_1b b29 (.D( mux_i[29] ), .sel( shamt ), .Y( out[29] ));
  mux32to1_1b b28 (.D( mux_i[28] ), .sel( shamt ), .Y( out[28] ));
  mux32to1_1b b27 (.D( mux_i[27] ), .sel( shamt ), .Y( out[27] ));
  mux32to1_1b b26 (.D( mux_i[26] ), .sel( shamt ), .Y( out[26] ));
  mux32to1_1b b25 (.D( mux_i[25] ), .sel( shamt ), .Y( out[25] ));
  mux32to1_1b b24 (.D( mux_i[24] ), .sel( shamt ), .Y( out[24] ));
  mux32to1_1b b23 (.D( mux_i[23] ), .sel( shamt ), .Y( out[23] ));
  mux32to1_1b b22 (.D( mux_i[22] ), .sel( shamt ), .Y( out[22] ));
  mux32to1_1b b21 (.D( mux_i[21] ), .sel( shamt ), .Y( out[21] ));
  mux32to1_1b b20 (.D( mux_i[20] ), .sel( shamt ), .Y( out[20] ));
  mux32to1_1b b19 (.D( mux_i[19] ), .sel( shamt ), .Y( out[19] ));
  mux32to1_1b b18 (.D( mux_i[18] ), .sel( shamt ), .Y( out[18] ));
  mux32to1_1b b17 (.D( mux_i[17] ), .sel( shamt ), .Y( out[17] ));
  mux32to1_1b b16 (.D( mux_i[16] ), .sel( shamt ), .Y( out[16] ));
  mux32to1_1b b15 (.D( mux_i[15] ), .sel( shamt ), .Y( out[15] ));
  mux32to1_1b b14 (.D( mux_i[14] ), .sel( shamt ), .Y( out[14] ));
  mux32to1_1b b13 (.D( mux_i[13] ), .sel( shamt ), .Y( out[13] ));
  mux32to1_1b b12 (.D( mux_i[12] ), .sel( shamt ), .Y( out[12] ));
  mux32to1_1b b11 (.D( mux_i[11] ), .sel( shamt ), .Y( out[11] ));
  mux32to1_1b b10 (.D( mux_i[10] ), .sel( shamt ), .Y( out[10] ));
  mux32to1_1b  b9 (.D( mux_i[ 9] ), .sel( shamt ), .Y( out[ 9] ));
  mux32to1_1b  b8 (.D( mux_i[ 8] ), .sel( shamt ), .Y( out[ 8] ));
  mux32to1_1b  b7 (.D( mux_i[ 7] ), .sel( shamt ), .Y( out[ 7] ));
  mux32to1_1b  b6 (.D( mux_i[ 6] ), .sel( shamt ), .Y( out[ 6] ));
  mux32to1_1b  b5 (.D( mux_i[ 5] ), .sel( shamt ), .Y( out[ 5] ));
  mux32to1_1b  b4 (.D( mux_i[ 4] ), .sel( shamt ), .Y( out[ 4] ));
  mux32to1_1b  b3 (.D( mux_i[ 3] ), .sel( shamt ), .Y( out[ 3] ));
  mux32to1_1b  b2 (.D( mux_i[ 2] ), .sel( shamt ), .Y( out[ 2] ));
  mux32to1_1b  b1 (.D( mux_i[ 1] ), .sel( shamt ), .Y( out[ 1] ));
  mux32to1_1b  b0 (.D( mux_i[ 0] ), .sel( shamt ), .Y( out[ 0] ));
  
endmodule: shift_right_32b

//////////////////////////////////////////////////////////////////////////////////

module shift_left_32b
(
  input  logic [31:0] in,
  input  logic [ 4:0] shamt,
  output logic [31:0] out
);
  
  logic [31:0][31:0] mux_i;
  logic [31:0] mux_temp;

  always_comb begin
      integer i;
      for (i =  0; i < 32; i = i + 1) begin
           mux_i[i] = mux_temp >> (31-i);    // using ">>" in "for" for wiring
      end
  end
  
  
  genvar i;
  generate
      for (i = 0; i < 32; i = i + 1) begin: bit_reverse
          assign mux_temp[i] = in[31 - i];
      end
  endgenerate
  
  mux32to1_1b b31 (.D( mux_i[31] ), .sel( shamt ), .Y( out[31] ));
  mux32to1_1b b30 (.D( mux_i[30] ), .sel( shamt ), .Y( out[30] ));
  mux32to1_1b b29 (.D( mux_i[29] ), .sel( shamt ), .Y( out[29] ));
  mux32to1_1b b28 (.D( mux_i[28] ), .sel( shamt ), .Y( out[28] ));
  mux32to1_1b b27 (.D( mux_i[27] ), .sel( shamt ), .Y( out[27] ));
  mux32to1_1b b26 (.D( mux_i[26] ), .sel( shamt ), .Y( out[26] ));
  mux32to1_1b b25 (.D( mux_i[25] ), .sel( shamt ), .Y( out[25] ));
  mux32to1_1b b24 (.D( mux_i[24] ), .sel( shamt ), .Y( out[24] ));
  mux32to1_1b b23 (.D( mux_i[23] ), .sel( shamt ), .Y( out[23] ));
  mux32to1_1b b22 (.D( mux_i[22] ), .sel( shamt ), .Y( out[22] ));
  mux32to1_1b b21 (.D( mux_i[21] ), .sel( shamt ), .Y( out[21] ));
  mux32to1_1b b20 (.D( mux_i[20] ), .sel( shamt ), .Y( out[20] ));
  mux32to1_1b b19 (.D( mux_i[19] ), .sel( shamt ), .Y( out[19] ));
  mux32to1_1b b18 (.D( mux_i[18] ), .sel( shamt ), .Y( out[18] ));
  mux32to1_1b b17 (.D( mux_i[17] ), .sel( shamt ), .Y( out[17] ));
  mux32to1_1b b16 (.D( mux_i[16] ), .sel( shamt ), .Y( out[16] ));
  mux32to1_1b b15 (.D( mux_i[15] ), .sel( shamt ), .Y( out[15] ));
  mux32to1_1b b14 (.D( mux_i[14] ), .sel( shamt ), .Y( out[14] ));
  mux32to1_1b b13 (.D( mux_i[13] ), .sel( shamt ), .Y( out[13] ));
  mux32to1_1b b12 (.D( mux_i[12] ), .sel( shamt ), .Y( out[12] ));
  mux32to1_1b b11 (.D( mux_i[11] ), .sel( shamt ), .Y( out[11] ));
  mux32to1_1b b10 (.D( mux_i[10] ), .sel( shamt ), .Y( out[10] ));
  mux32to1_1b  b9 (.D( mux_i[ 9] ), .sel( shamt ), .Y( out[ 9] ));
  mux32to1_1b  b8 (.D( mux_i[ 8] ), .sel( shamt ), .Y( out[ 8] ));
  mux32to1_1b  b7 (.D( mux_i[ 7] ), .sel( shamt ), .Y( out[ 7] ));
  mux32to1_1b  b6 (.D( mux_i[ 6] ), .sel( shamt ), .Y( out[ 6] ));
  mux32to1_1b  b5 (.D( mux_i[ 5] ), .sel( shamt ), .Y( out[ 5] ));
  mux32to1_1b  b4 (.D( mux_i[ 4] ), .sel( shamt ), .Y( out[ 4] ));
  mux32to1_1b  b3 (.D( mux_i[ 3] ), .sel( shamt ), .Y( out[ 3] ));
  mux32to1_1b  b2 (.D( mux_i[ 2] ), .sel( shamt ), .Y( out[ 2] ));
  mux32to1_1b  b1 (.D( mux_i[ 1] ), .sel( shamt ), .Y( out[ 1] ));
  mux32to1_1b  b0 (.D( mux_i[ 0] ), .sel( shamt ), .Y( out[ 0] ));
  
endmodule: shift_left_32b

//////////////////////////////////////////////////////////////////////////////////

module mux32to1_1b 
(
  input  logic [31:0] D,
  input  logic [ 4:0] sel,
  output logic Y
);
  
  assign Y = ( sel == 5'b00000 ) ? D[ 0] :
             ( sel == 5'b00001 ) ? D[ 1] :
             ( sel == 5'b00010 ) ? D[ 2] :
             ( sel == 5'b00011 ) ? D[ 3] :
             ( sel == 5'b00100 ) ? D[ 4] :
             ( sel == 5'b00101 ) ? D[ 5] :
             ( sel == 5'b00110 ) ? D[ 6] :
             ( sel == 5'b00111 ) ? D[ 7] :
             ( sel == 5'b01000 ) ? D[ 8] :
             ( sel == 5'b01001 ) ? D[ 9] :
             ( sel == 5'b01010 ) ? D[10] :
             ( sel == 5'b01011 ) ? D[11] :
             ( sel == 5'b01100 ) ? D[12] :
             ( sel == 5'b01101 ) ? D[13] :
             ( sel == 5'b01110 ) ? D[14] :
             ( sel == 5'b01111 ) ? D[15] :
             ( sel == 5'b10000 ) ? D[16] :
             ( sel == 5'b10001 ) ? D[17] :
             ( sel == 5'b10010 ) ? D[18] :
             ( sel == 5'b10011 ) ? D[19] :
             ( sel == 5'b10100 ) ? D[20] :
             ( sel == 5'b10101 ) ? D[21] :
             ( sel == 5'b10110 ) ? D[22] :
             ( sel == 5'b10111 ) ? D[23] :
             ( sel == 5'b11000 ) ? D[24] :
             ( sel == 5'b11001 ) ? D[25] :
             ( sel == 5'b11010 ) ? D[26] :
             ( sel == 5'b11011 ) ? D[27] :
             ( sel == 5'b11100 ) ? D[28] :
             ( sel == 5'b11101 ) ? D[29] :
             ( sel == 5'b11110 ) ? D[30] :  D[31] ;
  
endmodule: mux32to1_1b
