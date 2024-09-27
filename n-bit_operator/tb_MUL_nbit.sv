`timescale 1ns / 1ps
import FirPkg::*;  // Import to use parameters and typedefs in "FirPkg.sv" package systemverilog file

module tb_MUL_nbit;
  logic [DATA_WIDTH-1 : 0] a_i  ;
  logic [DATA_WIDTH-1 : 0] b_i  ;
  logic [2*DATA_WIDTH - 1 : 0] mul_x;
  logic [2*DATA_WIDTH - 1 : 0] mul_o;

  mul_nbit dut (
    .A( a_i   ),
    .B( b_i   ),
    .P( mul_o ));

 task tk_expect(input logic [2*DATA_WIDTH-1 : 0] mul_x );
    $display("[%3d] a_i = %10h, b_i = %10h, mul_x = %10h, mul_o = %10h", $time, a_i, b_i, mul_x, mul_o ); 
    assert( (mul_x == mul_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  
  
  initial begin

    repeat(2000) begin  // ADD TEST
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