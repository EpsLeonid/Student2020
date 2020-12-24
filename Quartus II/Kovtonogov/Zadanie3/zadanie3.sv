module zadanie3(A,B,C,DATA_OUT,clk,data);
import  parameter1 ::width;
//import  parameter1 ::a;
//import  parameter1 ::b;



input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;

input wire clk;

output reg[2*width-1:0] DATA_OUT,data;

reg [2*width-1:0]MULT;
 reg [2*width-1:0]C1;
always @(posedge clk)
begin
C1=1*C;

end

always @(posedge clk)
begin
MULT<=A*B;
end

always @(posedge clk)
begin
DATA_OUT= MULT+C1;
data=DATA_OUT;
end

endmodule
