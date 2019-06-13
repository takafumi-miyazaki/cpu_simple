`timescale 1ps/1ps
module instruction_memory_tp;
   reg [3:0] A;
   reg 	     clk;
   wire [7:0] B;

   parameter STEP = 1000;

   instruction_memory instruction_memory(A, B);
   
   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end
   
   initial begin
      A = 4'b0000;
      #(STEP/2) A = 4'b0001;
      #(STEP/2) A = 4'b0010;
      #(STEP/2) A = 4'b0011;
      #(STEP/2) A = 4'b0100;
      #(STEP/2) A = 4'b0101;
      #(STEP/2) A = 4'b0110;
      #(STEP/2) A = 4'b0111;
      #(STEP/2) A = 4'b1000;
      #(STEP/2) A = 4'b1001;
      #(STEP/2) A = 4'b1010;
      #(STEP/2) A = 4'b1011;
      #(STEP/2) A = 4'b1100;
      #(STEP/2) A = 4'b1101;
      #(STEP/2) A = 4'b1110;
      #(STEP/2) A = 4'b1111;
      $finish;
   end

   initial $monitor($time, "clk=%b A=%b B=%b", clk, A, B);
         
endmodule // program_counter
