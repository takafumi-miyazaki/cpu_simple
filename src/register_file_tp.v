`timescale 1ps/1ps
module register_file_tp;
   reg clk, rst;
   reg [1:0] A, B, C;
   reg [3:0] D;
   reg 	     E;
   wire [3:0] F, G;

   parameter STEP = 1000;

   register_file register_file(clk, rst, A, B, C, D, E, F, G);

   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end

   initial begin
      rst = 1; A=2'bxx; B= 2'bxx;
      #STEP A=2'b00;
      #STEP A=2'b01;
      #STEP A=2'b10;
      #STEP A=2'b11;
      #STEP B=2'b00;
      #STEP B=2'b01;
      #STEP B=2'b10;
      #STEP B=2'b11;
      $finish;
   end

   initial $monitor($time, "clk=%b, rst=%b, A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b",
		    clk, rst, A, B, C, D, E, F, G);
endmodule // register_file_tp

	 
      
