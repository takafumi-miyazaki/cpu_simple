module program_counter(clk, rst, A, B);
   input clk; // clock
   input rst; // reset signal
   input [3:0] A; // 
   output [3:0] B; // 
   reg [3:0] 	register; //

   always @ (posedge clk) begin
      register <= A;
      if (rst == 1) begin
	 register <= 4'b0000;
      end
   end
   
   assign B = register;

endmodule // program_counter

   

  
