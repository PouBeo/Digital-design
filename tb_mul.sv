`timescale 1ns / 1ps
module tb_multiplier;

  logic [31:0] a_i  ;
  logic [31:0] b_i  ;
  logic [63:0] mul_x;
  logic [63:0] mul_o;

  multipliers dut(
    .operand_a( a_i   ),
    .operand_b( b_i   ),
    .P        ( mul_o ));

  task tk_expect(input logic [63:0] mul_x );

    $display("[%3d] a_i = %10h, b_i = %10h, mul_x = %10h, mul_o = %10h", $time, a_i, b_i, mul_x, mul_o ); 
    assert( (mul_x == mul_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin

    repeat(1000) begin  // ADD TEST
    a_i = $random;
    b_i = $random;
    mul_x = a_i * b_i; 
     #1 tk_expect(mul_x);
     #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule