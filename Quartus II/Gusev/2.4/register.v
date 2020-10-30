module register(DATA_OUT, A, B, C, CLK);

	output reg [2*SIZE:0]DATA_OUT; /*1-цу не случайно забыл, когда складываем максимально возможные числа
	к получившееся числу добавится один старший разряд	*/
	input [SIZE-1:0]A, B, C;
	input CLK;
	parameter SIZE = 8;
	always @(posedge CLK)
	begin
	DATA_OUT <= A * B + C; 
	end
endmodule