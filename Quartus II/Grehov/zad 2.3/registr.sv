import  registr_parameter::size;

module registr(clk, DATA_OUT, A,B,C);

input wire clk;

input reg [size-1:0]A;
input reg [size-1:0]B;
input reg [size-1:0]C;

output reg [(2*size):0]DATA_OUT;
reg [(2*size):0]mult;
reg [(2*size):0]C1;

/*always @(posedge clk)
begin
C1<=C;
end
*/
always @(posedge clk)

begin

mult <=A*B;
//mult1<=mult;
DATA_OUT <= mult+C;

end

endmodule 