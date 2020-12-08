//import  registr_parameter ::*;
module registr(



input wire clk,

input reg [width-1:0]A,
input reg [width-1:0]B,
input reg [width-1:0]C,

output reg [2*width-1:0]data,
output reg [2*width-1:0]MULT,
output reg [2*width-1:0]C1
);

parameter width=8;
always @(posedge clk)

begin
MULT<=A*B;
C1<=C;
data <= MULT+C1;
end

endmodule
