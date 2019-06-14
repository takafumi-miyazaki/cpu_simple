module multiplexer(A, B, C, D);
   input [3:0] A, B;
   input       C;
   output [3:0] D;

   assign D = ( C == 1'b0) ? A: B;

endmodule // multiplexer

