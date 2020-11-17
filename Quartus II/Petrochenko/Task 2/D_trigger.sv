// parameters initialization
module D_trigger (d, clk, out);
input wire d, clk;
output reg out=1'b0;
//---------------------------

always@(posedge clk) begin

if (d==1'b0) begin // set out low if d is low and posedge clk has come
	out<=1'b0;
end

if (d==1'b1) begin // set out hight if d is hight and posedge clk has come
	out<=1'b1;
	end
end

endmodule
