module task3(clk, A, B, C, data_out, buff_result, buff_C, buff_buff_C);

import  task3_parameter::size;
input wire clk;
input unsigned [size-1:0] A, B, C;
output reg [size-1:0]  buff_C=1'b0, buff_buff_C=1'b0;
output reg [2*size-1:0] data_out=1'b0, buff_result=1'b0;

always @(posedge clk)
begin
	buff_C <= C;
	buff_buff_C <= buff_C;
	buff_result <= A*B;
	data_out <= buff_result + buff_buff_C;
end
	
endmodule
