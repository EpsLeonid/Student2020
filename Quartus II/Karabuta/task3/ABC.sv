module ABC(output [15:0] DATA,
		   input clk,
		   input [7:0] A,
		   input [7:0] B,
		   input [7:0] C
		   
			);
					
reg [7:0] A_data;
reg [7:0] B_data;
reg [7:0] C_data;
reg [7:0] C_data_shifted;
reg [15:0] result_multiplier;
reg [15:0] ouput_data;



always @(posedge clk)
begin
	A_data <= A;
	B_data <= B;
	C_data <= C;
	C_data_shifted <= C_data;
	ouput_data <= result_multiplier + C_data_shifted;	
end
		
always @(negedge clk)
begin

	result_multiplier <= A_data * B_data;
	 
end


assign DATA = ouput_data;

endmodule