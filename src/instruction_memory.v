module instruction_memory(A, B);
   input [3:0] A; // address signal
   output [7:0] B; // output instruction data
   reg [7:0] B;
//   reg [7:0] 	im [0:15]; // instruction memory 8bit 16 instruction

   always @ (A) begin
      case (A)
	4'b0000: B = 8'b00000110; // 00加算 REG[10] = REG[00] + REG[01]
	4'b0001: B = 8'b01111000; // 01減算 REG[00] = REG[11] - REG[10]
	4'b0010: B = 8'b11001111; // 11分岐 if(REG[00]==0)PC[t+1] = IM[1111]
	4'b0011: B = 8'b00000000;
	4'b0100: B = 8'b00000000;
	4'b0101: B = 8'b00000000;
	4'b0110: B = 8'b00000000;
	4'b0111: B = 8'b00000000;
	4'b1000: B = 8'b00000000;
	4'b1001: B = 8'b00000000;
	4'b1010: B = 8'b00000000;
	4'b1011: B = 8'b00000000;
	4'b1100: B = 8'b00000000;
	4'b1101: B = 8'b00000000;
	4'b1110: B = 8'b00000000;
	4'b1111: B = 8'b00000000;
      endcase // case (A)
   end
   
endmodule // instruction_memory
