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
      rst = 1; A = 2'bxx; B = 2'bxx;
      #STEP rst = 0; A=2'b00;
      #STEP A=2'b01;
      #STEP A=2'b10;
      #STEP A=2'b11;
      #STEP B=2'b00;
      #STEP B=2'b01;
      #STEP B=2'b10;
      #STEP B=2'b11;
      #STEP A=2'b00; B=2'b00;
      #STEP A=2'b01; B=2'b01;
      #STEP A=2'b10; B=2'b10;
      #STEP A=2'b11; B=2'b11;
      #STEP A=2'b00; C=2'b00; E=1'b1; D=4'b1000;
      #STEP A=2'b01; C=2'b01; E=1'b1; D=4'b0100;
      #STEP A=2'b10; C=2'b10; E=1'b1; D=4'b0010;
      #STEP A=2'b11; C=2'b11; E=1'b1; D=4'b0001;
      #STEP A=2'b11; C=2'b11; E=1'b0; D=4'b1111;
      #STEP
      $finish;
   end

   initial $monitor($time, "clk=%b, rst=%b, A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b",
		    clk, rst, A, B, C, D, E, F, G);
endmodule // register_file_tp

	 
      
