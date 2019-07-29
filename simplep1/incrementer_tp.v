`timescale 1ps/1ps
module incrementer_tp;
   reg clk, rst;
   reg [3:0] A;
   wire [3:0] B;

   parameter STEP = 1000;

   incrementer incrementer(clk, rst, A, B);

   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end

   initial begin
      A = 4'b0000;
      #STEP A = 4'b0000;
      #STEP A = 4'b0001;
      #STEP A = 4'b0010;
      #STEP A = 4'b0011;
      #STEP A = 4'b0100;
      #STEP A = 4'b0101;
      #STEP A = 4'b0110;
      #STEP A = 4'b0111;
      #STEP A = 4'b1000;
      #STEP A = 4'b1001;
      #STEP A = 4'b1010;
      #STEP A = 4'b1011;
      #STEP A = 4'b1100;
      #STEP A = 4'b1101;
      #STEP A = 4'b1110;
      #STEP A = 4'b1111;
      $finish;
   end

   initial $monitor($time, "clk=%b, rst=%b, A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b",
		    clk, rst, A, B, C, D, E, F, G);
endmodule // register_file_tp

	 
      
