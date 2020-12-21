import  registr_parameter::width;

module registr(clk,DATA_OUT,mult,A,B,C,C1);

input wire clk;

input reg [width-1:0]A;
input reg [width-1:0]B;
input reg [width-1:0]C;


reg [2*width-1:0]mult, C1;
output reg [2*width-1:0]DATA_OUT;


always @(posedge clk)

begin

mult <=A*B;
C1 <=C;
DATA_OUT <=mult+C1;
end

endmodule 


