module register_file (clk, rst, A, B, C, D, E, F, G) ;
   input clk, rst;
   input [1:0] A, B, C; // A->F, B->G, D->C
   input [3:0] D;
   input [0:0] E; // D->C
   output [3:0] F, G;
   reg [3:0] 	F, G;
   //reg [3:0] 	file00, file01, file10, file11;
   reg [3:0] 	file[3:0];
   
   /*   
   always @ (posedge rst) begin
      file00 = 2'b00;
      file01 = 2'b01;
      file10 = 2'b10;
      file11 = 2'b11;
   end   

   function [3:0] read_file;
      input [1:0] address;
      input [3:0] file00, file01, file10, file11;

      case (address)
	2'b00: read_file = file00;
	2'b01: read_file = file01;
	2'b10: read_file = file10;
	2'b11: read_file = file11;
	default: read_file = 4'bxxxx;
      endcase // case (address)
   endfunction // case

   assign F = read_file(A, file00, file01, file10, file11);
   assign G = read_file(B, file00, file01, file10, file11);
    */
   always @ (posedge rst) begin
      file[2'b00] <= 4'b0001;
      file[2'b01] <= 4'b0010;
      file[2'b10] <= 4'b0100;
      file[2'b11] <= 4'b1000;
   end

   always @ (A or B) begin
      F = file[A];
      G = file[B];
   end
   
   always @ (posedge clk)
     if (E)
       file[C] = D;
   
endmodule // register_file
