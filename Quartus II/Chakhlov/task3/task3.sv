module task3(clk, A, B, C, data_out, buff);

import  task3_parameter::size;
input wire clk;
input reg [size-1:0] A, B, C;
 
output reg [2*size-1:0] data_out, buff;

always @(posedge clk)
	begin
		buff <= A * B;
		data_out <= C + buff;
	end
	
endmodule
