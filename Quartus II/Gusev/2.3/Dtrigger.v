module Dtrigger( d, clk, out); 
    input wire d, clk;
    output  reg out;

 always @(posedge clk)
 out <= d;
 endmodule
