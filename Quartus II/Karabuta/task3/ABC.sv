module ABC(output [15:0] DATA,
		   input clk,
		   input [7:0] A,
		   input [7:0] B,
		   input [7:0] C
			);
			
always @(posedge clk)
begin
	DATA <= A * B + C; 
end

endmodule