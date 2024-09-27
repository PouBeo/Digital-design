`timescale 1ns / 1ps
import FirPkg::*;  // Import to use parameters and typedefs in "FirPkg.sv" package systemverilog file

module tb_ADDSUB_nBIT;

  logic [DATA_WIDTH-1 : 0] a_i  ;
  logic [DATA_WIDTH-1 : 0] b_i  ;
  logic sel_i;
  logic [DATA_WIDTH-1 : 0] s_x;
  logic [DATA_WIDTH-1 : 0] s_o;

  addsub_nbit dut(
               .A      ( a_i   ),
               .B      ( b_i   ),
               .add_sub( sel_i ),
               .S      ( s_o   ));

  task tk_expect(input logic [DATA_WIDTH-1 : 0]s_x);
    $display("[%3d] a_i = %10h, b_i = %10h,  sel_i = %7d, s_x= %10h, s_o = %10h", $time, a_i, b_i, sel_i, s_x, s_o ); 
    assert( (s_x == s_o)) else begin
      $display("TEST FAILED");
    end
  endtask

  initial begin

    repeat(1000) begin  // ADD TEST
    a_i   = $random;
    b_i   = $random;
    sel_i = 0;
    s_x   = a_i + b_i; 
     #1 tk_expect(s_x);
     #49;
    end

    repeat(1000) begin  // SUB TEST
    a_i = $random;
    b_i = $random;
    sel_i = 1;
    s_x= a_i - b_i; 
     #1 tk_expect(s_x);
     #49;
    end

    $display("TEST PASSED");
    $stop;
    $finish;
  end
endmodule