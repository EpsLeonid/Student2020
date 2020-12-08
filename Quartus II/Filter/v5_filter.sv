//----------------------------------------------------------------- Reg/param initialization
import v5_param::*;
module v5_filter (clk, reset, input_data, output_data);
	input wire signed [SIZE_ADC_DATA-1:0] input_data;
	input wire clk, reset;
	output reg [SIZE_FILTER_DATA-1:0] output_data=1'b0;

	reg signed [SIZE_ADC_DATA-1:0]   buff  [(l_var5+k_var5):0]; // array to write d 


	reg signed [SIZE_ADC_DATA+1:0] d=1'b0; // d-line 
	reg signed [SIZE_ADC_DATA+M_dig_var5:0] m_mult=1'b0; // buffer of M-multiplication 
	reg signed [SIZE_ADC_DATA+M_dig_var5:0] m_mult1=1'b0; // buffer of M-multiplication
	reg signed [(SIZE_ADC_DATA+M_dig_var5):0] p_acc=1'b0; //  p-line
	reg signed [(SIZE_ADC_DATA+M_dig_var5):0] pm_add=1'b0;  
	reg signed [(SIZE_ADC_DATA+M_dig_var5):0] out_buff=1'b0; // buffer of output data; take the number of digits with a margin;

//*********************************************************************************************

always@(posedge clk) begin

//------------------------------------------------------------------------------------------
	buff[0]=input_data; // write input data in buffer
	d=input_data-(buff[l_var5]+buff[k_var5])+buff[k_var5+l_var5]; 

	m_mult1<=(input_data-buff[l_var5])*M_var5; 
	m_mult<=(buff[k_var5+l_var5]-buff[k_var5])*M_var5;
	p_acc<=p_acc+d;
	pm_add<=(m_mult+m_mult1+p_acc);
	
	out_buff<=out_buff+pm_add; 
	if (out_buff>16'd65535)	output_data<=16'd65535; // overflow check
	else output_data<=out_buff;

	for (int i=1; i<=k_var5+l_var5; i++) begin // shift data in buffer
		buff[i]<=buff[i-1];
	end

//******************************************************************************************
//------------------------------------------ if reset is 0
	if (reset==1'b0) begin
		for (int i=0; i<=l_var5+k_var5; i++) begin
			buff[i]<=1'b0;
		end	
		d<=1'b0;
		m_mult<=1'b0;
		m_mult1<=1'b0;
		p_acc<=1'b0;
		pm_add<=1'b0;
		output_data<=1'b0;	
		out_buff<=1'b0;	
	end
//------------------------------------------	
end 
 
endmodule
