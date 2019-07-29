module cpu_simple(clk, rst, out_PC, out_IM);
   input clk, rst;
   output [3:0] out_PC; // program counterを観測する. シュミレーションのために必要.
   wire [3:0] 	out_IC; // incrementerの出力 
   output [7:0] out_IM; // instruction memoryの出力. 
   wire [7:0] out_RF; // register fileの出力
   wire [3:0] out_AL; // aluの出力
   wire [3:0] out_MX; // multiplexerの出力

   multiplexer multiplexer(.A(out_IC), .B(out_IM[3:0]),
			   .C(out_IM[7]&out_IM[6]&(out_RF[7]|out_RF[6]|out_RF[5]|out_RF[4])),
			   .D(out_MX));   
   program_counter program_counter(.clk(clk), .rst(rst),
				   .A(out_MX), .B(out_PC));
   incrementer incrementer(.A(out_PC), .B(out_IC));
   instruction_memory instructino_momory(.A(out_PC), .B(out_IM));
   register_file register_file(.clk(clk), .rst(rst),
			       .A(out_IM[5:4]), .B(out_IM[3:2]),
			       .C(out_IM[1:0]), .D(out_AL),
			       .E(~out_IM[7]), .F(out_RF[7:4]),
			       .G(out_RF[3:0]));
   alu alu(.A(out_RF[7:4]), .B(out_RF[3:0]), .C(out_IM[6]), .D(out_AL));
   
endmodule // cpu_simple

     
