module d_trigger(clk, d, out);
input wire clk;
input wire d;
output reg out;
always @(posedge clk)
begin
out <= d;
end
endmodule 