`timescale 1ns / 1ps
module tb_add_sub_32_bits ;
  logic [31: 0] A, B, S, S_x;
  logic sel, V;

  addsub_32_bits uut (
    .A( A ),
    .B( B ),
    .add_sub( sel ),
    .S( S ),
    .V( V ));

  task tk_expect(input logic [31:0] S_x );
    $display("[%3d] a_i = %10h, b_i = %10h,  sel_i = %7d, S_expect = %10h, S_result = %10h", $time, A, B, sel, S_x, S ); 
    assert( (S_x == S)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin
    repeat(50) begin
    A= $random;
    B= $random;
    sel= 0;
    S_x = A + B; 
    #1 tk_expect(S_x);
    #49;
    end

    repeat(50) begin
    A= $random;
    B= $random;
    sel= 1;
    S_x = A - B; 
    #1 tk_expect(S_x);
    #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule
