	import Bits ::*;
module register(DATA_OUT, A, B, C, CLK);
	output reg signed [2*SIZE+1:0]DATA_OUT; /*1-цу не случайно забыл, когда складываем максимально возможные числа
	к получившееся числу добавится один старший разряд	*/
	input reg signed [SIZE-1:0]A, B, C;
	input wire CLK;
	reg signed [2*SIZE-1:0]M;
	always @*
	begin
	M <= A*B;
	DATA_OUT <= M + C; 
	end
endmodule
