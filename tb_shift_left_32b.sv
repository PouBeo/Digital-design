`timescale 1ns / 1ps
module tb_shift_left_32b;

  logic [31:0] a_i  ;
  logic [ 4:0] b_i  ;
  logic [31:0] sll_x;
  logic [31:0] sll_o;

shift_left_32b dut ( .in   ( a_i   ),
                     .shamt( b_i   ),
                     .out  ( sll_o ));

  task tk_expect(input logic [31:0] sll_x );

    $display("[%3d] a_i = %10h, b_i = %10h, sll_x = %10h, sll_o = %10h", $time, a_i, b_i, sll_x, sll_o ); 
    assert( (sll_x == sll_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin
    repeat(1000) begin
    a_i = $random;
    b_i = $random;
    sll_x = a_i << b_i; 
     #1 tk_expect(sll_x);
     #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule