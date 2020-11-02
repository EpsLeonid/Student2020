module multiply(A,B,C,clk,d,out,x,y,z,DATA_OUT);
//Entry parametrs for task 2.2

input A;
input B;
output C;

assign C=A*B;
//Entry parametrs for task 2.3

input wire clk;
input wire d;
output reg out;


always @(posedge clk)
begin
out <= d;
end

//Entry parametrs for task 2.4
import Parametrs_reg::input_size;
import Parametrs_reg::output_size;
input [input_size-1:0]x;
input [input_size-1:0]y;
input [input_size-1:0]z;
output reg [output_size-1:0]DATA_OUT;

always @(posedge clk)
begin
DATA_OUT <= x*y+z;
end
endmodule
