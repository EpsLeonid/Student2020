import ABC_parameter::lenght;
module ABC(output [2*lenght-1:0] DATA,
		   input clk,
		   input [lenght-1:0] A,
		   input [lenght-1:0] B,
		   input [lenght-1:0] C
			);
			
always @(posedge clk)
begin
	DATA <= A * B + C; 
end

endmodule