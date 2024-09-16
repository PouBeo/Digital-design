`timescale 1ns / 1ps
module tb_shift_right_arithmetic_32b;

  logic [31:0] a_i  ;
  logic [ 4:0] b_i  ;
  logic [31:0] sra_x;
  logic [31:0] sra_o;

shift_right_arith_32b dut ( .in   ( a_i   ),
                           .shamt( b_i   ),
                           .out  ( sra_o ));

  task tk_expect(input logic [31:0] sra_x );

    $display("[%3d] a_i = %10b, b_i = %10d, sra_x = %10b, sra_o = %10b", $time, a_i, b_i, sra_x, sra_o ); 
    assert( (sra_x == sra_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin
    repeat(1000) begin
    a_i = $random;
    b_i = $random;
    sra_x = a_i >>> b_i; 
     #1 tk_expect(sra_x);
     #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule