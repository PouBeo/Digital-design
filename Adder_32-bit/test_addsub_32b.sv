module FA_1b
(
  input  logic A, B, Ci,
  output logic S, Co
);
  assign  S  = A ^ B ^ Ci;
  assign  Co = (A & B)|(A & Ci)|( B& Ci); // Co = AB + Ci(A^B)

endmodule:  FA_1b

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

module addsub4b
(
  input  logic [3:0] A, B,
  input 	logic sel, Cin,
  output logic [3:0] S,
  output logic	Co, V
);
  logic [2:0] c;
  logic [3:0] b;
  
  assign b[0] = B[0]^sel ; // sel: 0 if ADD, 1 if SUB : b^0 = b, b^1 = ~b
  assign b[1] = B[1]^sel ;
  assign b[2] = B[2]^sel ;
  assign b[3] = B[3]^sel ;
  
  FA_1b u0( .A( A[0] ), .B( b[0] ), .Ci( Cin  ), .S( S[0] ), .Co( c[0] )); // Cin shoulb be 'sel': SUB when (sel = 1), a - b = a + (~b) + 1 
  FA_1b u1( .A( A[1] ), .B( b[1] ), .Ci( c[0] ), .S( S[1] ), .Co( c[1] ));
  FA_1b u2( .A( A[2] ), .B( b[2] ), .Ci( c[1] ), .S( S[2] ), .Co( c[2] ));
  FA_1b u3( .A( A[3] ), .B( b[3] ), .Ci( c[2] ), .S( S[3] ), .Co( Co   ));

  assign V = Co ^ c[2] ; // V = 1: OVERFLOW
  
endmodule: addsub4b


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

module addsub_32_bits 
(
  input  logic [31: 0] A, B,
  input  logic add_sub,
  
  output logic [31: 0] S,
  output logic V
);
  logic [ 7: 0] carry_in ;
  
  addsub4b byte_03_00 (.A( A[ 3: 0] ), .B( B[ 3: 0] ), .sel( add_sub ), .Cin( add_sub     ), .S( S[ 3: 0] ), .Co( carry_in[0] ));
  addsub4b byte_07_04 (.A( A[ 7: 4] ), .B( B[ 7: 4] ), .sel( add_sub ), .Cin( carry_in[0] ), .S( S[ 7: 4] ), .Co( carry_in[1] ));
  addsub4b byte_11_08 (.A( A[11: 8] ), .B( B[11: 8] ), .sel( add_sub ), .Cin( carry_in[1] ), .S( S[11: 8] ), .Co( carry_in[2] ));
  addsub4b byte_15_12 (.A( A[15:12] ), .B( B[15:12] ), .sel( add_sub ), .Cin( carry_in[2] ), .S( S[15:12] ), .Co( carry_in[3] ));
  addsub4b byte_19_16 (.A( A[19:16] ), .B( B[19:16] ), .sel( add_sub ), .Cin( carry_in[3] ), .S( S[19:16] ), .Co( carry_in[4] ));
  addsub4b byte_23_20 (.A( A[23:20] ), .B( B[23:20] ), .sel( add_sub ), .Cin( carry_in[4] ), .S( S[23:20] ), .Co( carry_in[5] ));
  addsub4b byte_27_24 (.A( A[27:24] ), .B( B[27:24] ), .sel( add_sub ), .Cin( carry_in[5] ), .S( S[27:24] ), .Co( carry_in[6] ));
  addsub4b byte_31_28 (.A( A[31:28] ), .B( B[31:28] ), .sel( add_sub ), .Cin( carry_in[6] ), .S( S[31:28] ), .Co( carry_in[7] ), .V(V));

endmodule: addsub_32_bits





