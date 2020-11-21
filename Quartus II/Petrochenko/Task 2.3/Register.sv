// pameters initialization
import  reg_param::*;
module Register (Adata_in, Bdata_in, Cdata_in, clk, summ, mult);
input unsigned [bus_width-1:0] Adata_in;
input unsigned [bus_width-1:0] Bdata_in;
input unsigned [bus_width-1:0] Cdata_in;
input wire clk; 
output reg [(bus_width*2)-1:0] summ=1'b0;
output reg [(bus_width*2)-1:0] mult=1'b0;
//-------------------------


always@ (posedge clk) begin
mult<=Adata_in*Bdata_in;
summ<=Cdata_in+mult;
end
endmodule	
