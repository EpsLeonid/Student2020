module zadanie3(A,B,C,DATA_OUT,D,clk);
import  parameter1 ::width;
import  parameter1 ::a;
import  parameter1 ::b;



input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;

input wire clk;

output reg[a:0] D;
output reg[b:0] DATA_OUT;



always @(posedge clk)
begin
D=A*B;
DATA_OUT=D+C;
end

endmodule
