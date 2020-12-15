

//----------------------------------------------------------------- Reg/param initialization
import v8_param::*;
module v8_filter (clk, reset, input_data, output_data);
	input wire signed [SIZE_ADC_DATA-1:0] input_data;
	input wire clk, reset;
	output reg [SIZE_FILTER_DATA-1:0] output_data=1'b0;

	reg signed [SIZE_ADC_DATA-1:0]   buff  [(l_var8+k_var8):0]; // array to write d 


	reg signed [SIZE_ADC_DATA+1:0] dfrst=1'b0; // d-line 
	reg signed [SIZE_ADC_DATA+1:0] dscnd=1'b0; // d-line 
	reg signed [SIZE_ADC_DATA+1:0] dlast=1'b0; // d-line 
	reg signed [SIZE_ADC_DATA+4:0] mult=1'b0; // buffer of M-multiplication 
	reg signed [(SIZE_ADC_DATA+4):0] p_part=1'b0; //  p-line
	reg signed [(SIZE_ADC_DATA+4):0] r_part=1'b0;  
	reg signed [(SIZE_ADC_DATA+4):0] s_part=1'b0; 

//*********************************************************************************************

always@(posedge clk or negedge reset) begin
//------------------------------------------ if reset is 0
	if (reset==1'b0) begin
		for (int i=0; i<=l_var8+k_var8; i++) begin
			buff[i]<=1'b0;
		end	
		dfrst<=1'b0;
		dscnd<=1'b0;
		dlast<=1'b0;
		mult<=1'b0;
		p_part<=1'b0;
		r_part<=1'b0;
		output_data<=1'b0;	
		s_part<=1'b0;	
	end
//------------------------------------------	
	else begin

//------------------------------------------------------------------------------------------
	buff[0]<=input_data; // write input data in buffer
	dfrst<=buff[0]-buff[l_var8];
	dscnd<=buff[k_var8+l_var8]-buff[k_var8];
	dlast<=dfrst+dscnd; 

	mult<=dlast*M_var8; 
	p_part<=p_part+dlast;
	r_part<=p_part+mult;
	s_part<=s_part+r_part;
	output_data<=s_part >> 3'd4;

	for (int i=1; i<=k_var8+l_var8; i++) begin // shift data in buffer
		buff[i]<=buff[i-1];
	end

//******************************************************************************************
	end
end 
 
endmodule