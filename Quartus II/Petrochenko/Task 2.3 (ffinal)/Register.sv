import Register_param::*;
module Register (Adata_in, Bdata_in, Cdata_in, clk, output_data);
//------------------------------------------- input signals
input reg [bus_width-1:0] Adata_in;
input reg [bus_width-1:0] Bdata_in;
input reg [bus_width-1:0] Cdata_in;
input reg clk;
//**********************************************************
output reg [bus_width*2-1:0] output_data=1'b0;
reg [bus_width-1:0] C_buffer [1:0]; // C-buffer
reg [bus_width*2-1:0] Mult_buffer=1'b0; // buffer if multiplication of A-data and B-data


always@(posedge clk) begin
	C_buffer[0]<=Cdata_in;
	C_buffer[1]<=C_buffer[0]; // shift input C-data for 1 count
end

always@ (negedge clk) 	Mult_buffer<=Adata_in*Bdata_in;

assign 	output_data=Mult_buffer+C_buffer[1];

endmodule