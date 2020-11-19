// parameters initialization
module Multiplier (A, B, C);
input wire A;
input wire B;
output reg C=1'b0;
//--------------------------


always@(A, B) begin
C<=A*B;
end

endmodule