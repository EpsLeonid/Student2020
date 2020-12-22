import  registr_parameter ::*;
module registr(



input wire clk,

input reg [size-1:0]A,
input reg [size-1:0]B,
input reg [size-1:0]C,

output reg [2*size-1:0]data,DATA
);
 reg [2*size-1:0]MULT;
 reg [size:0]C1,C2;
//parameter size=8;

always @(posedge clk)
begin
C1=1*C;

end

always @(posedge clk)
begin
MULT=A*B;
end

always @(posedge clk)
begin
data<= MULT+C1;
DATA<=data;
end

endmodule
