import  registr_parameter ::*;
module registr(clk, data,MULT, A,B,C);

//parameter width=8;

input wire clk;

input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;

output reg [2*width-1:0]data;
output reg [2*width-1:0]MULT;


always @(posedge clk)

begin
MULT<=A*B;
data <= MULT+C;
end

endmodule
