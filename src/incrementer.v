module incrementer(clk, rst, A, B);
   input clk, rst;
   input [3:0] A;
   output [3:0] B;

   assign B = A + 4'b0001;
endmodule // incrementer
