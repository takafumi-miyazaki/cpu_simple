module program_counter( A, B, clk);
// reset signal 

   input [3:0] A;
   input       clk;
   output [3:0] B;

   reg [3:0] 	register;

   always @ (posedge clk) begin
      register <= A;
   end

   assign B = register;

endmodule // program_counter

   

  
