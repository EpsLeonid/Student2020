module registr(clk, data, A,B,C);
import  registr_parameter ::*;
input wire clk;

input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;

output reg [2*width-1:0]data;

always @(posedge clk)

data <= A*B+C;

endmodule
