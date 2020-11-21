module registr(clk, data_out, A,B,C);
import  registr_parameter::size;
input wire clk;

input reg [size-1:0]A;
input reg [size-1:0]B;
input reg [size-1:0]C;

output reg [2*size-1:0]data_out;
always @(posedge clk)
data_out <= A*B+C;
endmodule 