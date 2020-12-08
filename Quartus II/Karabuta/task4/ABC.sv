//ATTENTION
//simulation with Cyclone III EPC3C5F256C6

import ABC_parameter::lenght;

module ABC(output [2*lenght-1:0] DATA,
		   input clk,
		   input [lenght-1:0] A,
		   input [lenght-1:0] B,
		   input [lenght-1:0] C
			);
			
			
reg [lenght-1:0] A_data;
reg [lenght-1:0] B_data;
reg [lenght-1:0] C_data;
reg [lenght-1:0] C_data_shifted;
reg [2*lenght-1:0] result_multiplier;
reg [2*lenght-1:0] ouput_data;

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