`timescale 1ns / 1ps
module tb_COMP_U;

  logic [31:0] a_i ;
  logic [31:0] b_i ;
  logic bg_o, eq_o, sl_o ;
  logic bg_x, eq_x, sl_x ;

  comparator_32b_io BRCOMP_EQ  (
    .A( a_i ),
    .B( b_i ),
    .AbgB_i( 1'b0 ), .AslB_i( 1'b0 ), .AeqB_i( 1'b1 ),
    .AbgB_o( bg_o ), .AslB_o( sl_o ), .AeqB_o( eq_o ));

  task tk_expect( bg_x, eq_x, sl_x );
    $display("[%10d] a_i = %10h, b_i = %10h, bg_x = %2h, bg_o = %2h   ", $time, a_i, b_i, bg_x, bg_o );
    $display("[%10d] a_i = %10h, b_i = %10h, eq_x = %2h, eq_o = %2h   ", $time, a_i, b_i, eq_x, eq_o ); 
    $display("[%10d] a_i = %10h, b_i = %10h, sl_x = %2h, sl_o = %2h \n", $time, a_i, b_i, sl_x, sl_o );  
    assert( (bg_x == bg_o)&(eq_x == eq_o)&(sl_x == sl_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin

    repeat(500) begin  // bigger, smaller test  
    a_i = $random;
    b_i = $random;
    sl_x = $unsigned(a_i) < $unsigned(b_i) ? 1'b1 : 1'b0;
    eq_x = $unsigned(a_i) == $unsigned(b_i) ? 1'b1 : 1'b0;
    bg_x = $unsigned(a_i) > $unsigned(b_i) ? 1'b1 : 1'b0;
     #1 tk_expect( bg_x, eq_x, sl_x );
     #49;
    end
	 
    repeat(200) begin  // equal test  
    a_i = $urandom;
    b_i = a_i;
    sl_x = $unsigned(a_i) < $unsigned(b_i) ? 1'b1 : 1'b0;
    eq_x = $unsigned(a_i) == $unsigned(b_i) ? 1'b1 : 1'b0;
    bg_x = $unsigned(a_i) > $unsigned(b_i) ? 1'b1 : 1'b0;
     #1 tk_expect( bg_x, eq_x, sl_x );
     #49;
    end
	 
    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule
