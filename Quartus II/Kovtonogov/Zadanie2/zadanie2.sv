module zadanie2 (q,d,clk);
input clk;
input d;

output reg q;

always @(posedge clk)
   q <= d;
	
endmodule