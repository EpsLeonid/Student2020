module task2(clk, d, out);

input wire clk, d;
output reg out=1'b0;

always @(posedge clk)
	begin
		out <= d;
	end
	
endmodule
