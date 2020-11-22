import  registr_parameter::size;

module registr(clk, summ, mult, A,B,C);

input wire clk;

input reg [size-1:0]A;
input reg [size-1:0]B;
input reg [size-1:0]C;

output reg [2*size-1:0]summ;
output reg [2*size-1:0]mult;


always @(posedge clk)

begin

mult <=A*B;
summ <= mult+C;
end

endmodule 