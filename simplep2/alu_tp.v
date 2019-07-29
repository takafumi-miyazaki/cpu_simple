`timescale 1ps/1ps
module alu_tp;
   reg clk;
   reg [3:0] A, B;
   reg 	     C;
   wire [3:0] D;

   parameter STEP = 1000;

   alu alu(A, B, C, D);

   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end

   initial begin
      A = 4'b0000; B = 4'b0001; C = 1'b0;
      #STEP A = 4'b0100; B = 4'b0001; C = 1'b0;
      #STEP A = 4'b1110; B = 4'b0101; C = 1'b0;
      #STEP A = 4'b1000; B = 4'b0001; C = 1'b1;
      #STEP A = 4'b1010; B = 4'b0101; C = 1'b1;
      $finish;
   end

   initial $monitor($time, "clk=%b, A=%b, B=%b, C=%b, D=%b",
		    clk, A, B, C, D);
endmodule // incrementer_tp

	 
      
