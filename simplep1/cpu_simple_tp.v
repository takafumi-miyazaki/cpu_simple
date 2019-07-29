`timescale 1ps/1ps
module cpu_simple_tp;
   reg clk, rst;
   wire [3:0] out_PC; // progrm counter 観測用
   wire [7:0] out_IM;
   parameter STEP = 1000;

   cpu_simple cpu_simple(clk, rst, out_PC, out_IM);

   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end

   initial begin
      rst = 1;
      #STEP rst = 0;
      #STEP 
      #STEP 
      #STEP
      #STEP
      #STEP 
      #STEP 
      #STEP
      #STEP
      #STEP 
      #STEP 
      #STEP
      $finish;
   end

   initial $monitor($time, "clk=%b, rst=%b, PC=%b, Inst=%b",
		    clk, rst, out_PC, out_IM);
endmodule // cpu_simple_tp

 
