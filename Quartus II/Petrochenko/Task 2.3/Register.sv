// pameters initialization
import  reg_param::*;
module Register (Adata_in, Bdata_in, Cdata_in, clk, Output_data, mult);
input unsigned [bus_width-1:0] Adata_in;
input unsigned [bus_width-1:0] Bdata_in;
input unsigned [bus_width-1:0] Cdata_in;
input wire clk; 
output reg [(bus_width*2)-1:0] Output_data=1'b0;
output reg [(bus_width*2)-1:0] mult=1'b0;// mult data
reg [bus_width-1:0] buffer [2:0]; // Cdata_buffer
reg cnt=1'b0; // clk for delay Cdata_in by a beat

always@ (posedge clk) begin
cnt<=~cnt;
buffer[cnt]<=Cdata_in;
mult<=Adata_in*Bdata_in;
Output_data<=mult+buffer[cnt];
end

endmodule	
