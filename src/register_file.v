module register_file (clk, rst, A, B, C, D, E, F, G) ;
   input clk, rst;
   input [1:0] A, B, C; // A->F, B->G, D->C
   input [3:0] D;
   input [0:0] E; // D->C
   output [3:0] F, G;
   reg [3:0] 	file [0:3];

   always @ (posedge rst) begin
      file[2'b00] = 2'b00;
      file[2'b01] = 2'b01;
      file[2'b10] = 2'b10;
      file[2'b11] = 2'b11;
   end   
   
   function [3:0] read_file;
      input [1:0] address;
      input [3:0] file [0:3];

      case (address)
	2'b00: read_file = file[2'b00];
	2'b01: read_file = file[2'b01];
	2'b10: read_file = file[2'b10];
	2'b11: read_file = file[2'b11];
	default: read_file = 4'bxxxx;
      endcase // case (address)
   endfunction // case

   assign F = read_file(A, file[0:3]);
   assign G = read_file(B, file[0:3]);
   
   
   
endmodule // register_file
