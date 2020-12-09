import  registr_parameter::width;

module registr(clk,DATA_OUT,mult,A,B,C);

input wire clk;

input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;


output reg [2*width-1:0]mult;
output reg [2*width-1:0]DATA_OUT;


always @(posedge clk)

begin

mult <=A*B;

DATA_OUT <=mult+C;
end

endmodule 


