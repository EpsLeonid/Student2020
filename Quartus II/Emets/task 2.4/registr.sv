module registr(clk, data, A,B,C);

input wire clk;

input reg [7:0]A;
input reg [7:0]B;
input reg [7:0]C;

output reg [15:0]data;

always @(posedge clk)
begin
data <= A*B+C;
end
endmodule
