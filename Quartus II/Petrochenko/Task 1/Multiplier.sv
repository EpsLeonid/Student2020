// parameters initialization
module Multiplier (A, B, C);
input wire A;
input wire B;
output reg C;
//--------------------------


always@(A, B) begin
C<=A*B;
end

endmodule