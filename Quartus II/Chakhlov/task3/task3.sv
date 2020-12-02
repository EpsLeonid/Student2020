module task3(clk, A, B, C, data_out, buff_result, buff_A, buff_B, buff_C, buff_buff_C);
////////////////////////////////////////////////////////
//////////////////NOT/WORKING//////////////////////////
///////////////////////////////////////////////////////
import  task3_parameter::size;
input wire clk;
input reg [size-1:0] A, B, C;
output reg [size-1:0] buff_A, buff_B, buff_C, buff_buff_C;
output reg [2*size-1:0] data_out, buff_result;

always @(posedge clk)
begin
	buff_A <= A;
	buff_B <= B;
	buff_C <= C;
	buff_buff_C <= buff_C;
end

always @(posedge clk)
	begin
		buff_result <= buff_A * buff_B;
	end

always @(posedge clk)
	begin
		data_out <= buff_result + buff_buff_C;
	end	
			
endmodule
