`include "D:/BKU/CTMT/2011919_Processor/ALU.sv"  


// This is the |...| comparator: unsign
module comparator_4b(
  input  logic [ 3:0] A, B,
  output logic AbgB, AslB, AeqB
);
  logic [ 3:0] eq;
  assign eq = A ~^ B ;  // eq[i] = ~(A[i]^B[i]) = 1 when Ai = Bi
  
  // A equal B : A = B when A[i] = B[i] true with all [i]
  assign AeqB = &eq ;
  
  // A bigger than B : A > B when (A_B) = (1xxx_0xxx) or (e1xx_e0xx) or (ee1x_ee0x) or (eee1_eee0); (*):e = eq[i] 
  assign AbgB = A[3]&(~B[3]) | (eq[3])&A[2]&(~B[2]) | (eq[3])&(eq[2])&A[1]&(~B[1]) | (eq[3])&(eq[2])&(eq[1])&A[0]&(~B[0]) ;

  // A smaller than B: A < B when (A_B) = (0xxx_1xxx) or (e0xx_e1xx) or (ee0x_ee1x) or (eee0_eee1); (*):e = eq[i] 
  assign AslB = B[3]&(~A[3]) | (eq[3])&B[2]&(~A[2]) | (eq[3])&(eq[2])&B[1]&(~A[1]) | (eq[3])&(eq[2])&(eq[1])&B[0]&(~A[0]) ;

  /*  // Simply A smaller than B when A NOT (bigger or equal) B:
      assign AslB = ~ (AeqB & AbgB) ;  */ 

endmodule: comparator_4b

////////////////////////////////////////////////////////////////////////////////////////////////////////
// This module can be used as ic7485
// Function: 

module comparator_4b_io(
  input  logic [ 3:0] A, B,
  input  logic AbgB_i, AslB_i, AeqB_i,
  output logic AbgB_o, AslB_o, AeqB_o
);
  logic AbgB_temp, AslB_temp, AeqB_temp;
  
  // Compare two values input
  comparator_4b COMP_noncascade(.A( A ), .B( B ),.AbgB( AbgB_temp ), .AslB( AslB_temp ), .AeqB( AeqB_temp ));

  // Output combine both current 4-bit comparison and the other one
  assign AbgB_o = AbgB_temp | ( AeqB_temp & AbgB_i ) ; // if current 4-bit of A is not bigger than B, it will if A = B and bigger-input signal is 1
  assign AeqB_o = AeqB_temp & AeqB_i ;
  assign AslB_o = AslB_temp | ( AeqB_temp & AslB_i ) ;
  
endmodule: comparator_4b_io 

////////////////////////////////////////////////////////////////////////////////////////////////////////
//
module comparator_8b_io(
  input  logic [ 7:0] A, B,
  input  logic AbgB_i, AslB_i, AeqB_i,
  output logic AbgB_o, AslB_o, AeqB_o
);
  logic bg_io, sl_io, eq_io; 
  
  comparator_4b_io HIGH_haflbyte (.A( A[7:4] ), .B( B[7:4] ),
                                  .AbgB_i(  bg_io ), .AslB_i(  sl_io ), .AeqB_i(  eq_io ),
                                  .AbgB_o( AbgB_o ), .AslB_o( AslB_o ), .AeqB_o( AeqB_o ));
											 
  comparator_4b_io  LOW_haflbyte (. A( A[3:0] ), .B( B[3:0] ),
                                  .AbgB_i(  AbgB_i ), .AslB_i(  AslB_i ), .AeqB_i(  AeqB_i ),
                                  .AbgB_o(   bg_io ), .AslB_o(   sl_io ), .AeqB_o(  eq_io ));
endmodule: comparator_8b_io

////////////////////////////////////////////////////////////////////////////////////////////////////////

module comparator_32b_io(
  input  logic [31:0] A, B,
  input  logic AbgB_i, AslB_i, AeqB_i,
  output logic AbgB_o, AslB_o, AeqB_o
);
  logic bg_B0, sl_B0, eq_B0; // output flag of comparison between "Byte 0" of A, B
  logic bg_B1, sl_B1, eq_B1; 
  logic bg_B2, sl_B2, eq_B2; 

  comparator_8b_io byte_07_00 (.A( A[ 7: 0] ), .B( B[ 7: 0] ), .AbgB_i(  AbgB_i ), .AslB_i(  AslB_i ), .AeqB_i(  AeqB_i ), .AbgB_o(  bg_B0 ), .AslB_o(  sl_B0 ), .AeqB_o(  eq_B0 ));
  comparator_8b_io byte_15_08 (.A( A[15: 8] ), .B( B[15: 8] ), .AbgB_i(   bg_B0 ), .AslB_i(   sl_B0 ), .AeqB_i(   eq_B0 ), .AbgB_o(  bg_B1 ), .AslB_o(  sl_B1 ), .AeqB_o(  eq_B1 ));
  comparator_8b_io byte_23_16 (.A( A[23:16] ), .B( B[23:16] ), .AbgB_i(   bg_B1 ), .AslB_i(   sl_B1 ), .AeqB_i(   eq_B1 ), .AbgB_o(  bg_B2 ), .AslB_o(  sl_B2 ), .AeqB_o(  eq_B2 ));								 
  comparator_8b_io byte_31_24 (.A( A[31:24] ), .B( B[31:24] ), .AbgB_i(   bg_B2 ), .AslB_i(   sl_B2 ), .AeqB_i(   eq_B2 ), .AbgB_o( AbgB_o ), .AslB_o( AslB_o ), .AeqB_o( AeqB_o ));

endmodule: comparator_32b_io
