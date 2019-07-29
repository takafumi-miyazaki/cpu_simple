module alu(A, B, C, D);
   input [3:0] A, B;
   input       C;
   output [3:0] D;
   
   assign D = (C == 1'b1) ? (A - B) : (A + B);

endmodule
 
