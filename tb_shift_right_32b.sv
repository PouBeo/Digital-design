`timescale 1ns / 1ps
module tb_shift_right_32b;

  logic [31:0] a_i  ;
  logic [ 4:0] b_i  ;
  logic [31:0] slr_x;
  logic [31:0] slr_o;

shift_right_32b dut ( .in   ( a_i   ),
                      .shamt( b_i   ),
                      .out  ( slr_o ));

  task tk_expect(input logic [31:0] slr_x );

    $display("[%3d] a_i = %10b, b_i = %10d, slr_x = %10b, slr_o = %10b", $time, a_i, b_i, slr_x, slr_o ); 
    assert( (slr_x == slr_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin
    repeat(1000) begin
    a_i = $random;
    b_i = $random;
    slr_x = a_i >> b_i; 
     #1 tk_expect(slr_x);
     #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule