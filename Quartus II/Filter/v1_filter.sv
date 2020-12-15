import v1_param ::*;
module v1_filter (clk, reset, input_data, output_data);

	//--------------------------------------------------------------- ports initialization
	input wire signed [SIZE_ADC_DATA-1:0] input_data;
	input wire clk, reset;
	output reg signed [SIZE_FILTER_DATA-1:0] output_data=1'b0;// output signal
	//***********************************************************************************

	//---------------------------------------------------------------- internal registers
	reg signed [SIZE_ADC_DATA-1:0]   mass  [(l_var1+k_var1):0]; // input data buffer
	reg signed [SIZE_ADC_DATA+1:0] d_line1=1'b0; // d-part1 of signal
	reg signed [SIZE_ADC_DATA+1:0] d_line2=1'b0; // d-part1 of signal
	reg signed [SIZE_ADC_DATA+1:0] d_tot=1'b0; // d data with all delays
	reg signed [SIZE_ADC_DATA+3:0] m_buf=1'b0; 
	reg signed [(SIZE_ADC_DATA+3):0] p_line=1'b0; // p-part of signal
	reg signed [(SIZE_ADC_DATA+3):0] r_line=1'b0; 
	reg signed [(SIZE_ADC_DATA+3):0] s_line=1'b0; // s-part of signal
	//***********************************************************************************

always@(posedge clk or negedge reset) begin
 //------------------------------------------ reset-block
	if (reset==1'b0) begin
		for (int i=0; i<=l_var1+k_var1; i++) begin
			mass[i]<=1'b0;
		end	
		d_line1<=1'b0;
		d_line2<=1'b0;
		m_buf<=1'b0;
		p_line<=1'b0;
		r_line<=1'b0;
		output_data<=1'b0;	
		s_line<=1'b0;	
	end
//------------------------------------------	 
	else begin

	mass[0]<=input_data; // write input data in 0 ellement of array
	d_line1<=mass[0]-mass[l_var1];
	d_line2<=mass[k_var1+l_var1]-mass[k_var1];
	d_tot<=d_line1+d_line2;
	
	m_buf<=d_tot*M_var1; 
	p_line<=p_line+d_tot;
	r_line<=p_line+m_buf;
	s_line<=s_line+r_line;
	
	output_data<=s_line >>> 3'd4;
	//------------------------------------------ shift data in mass
	for (int i=1; i<=k_var1+l_var1; i++) begin
		mass[i]<=mass[i-1];
	end
//**************************************************************
	end

end


 
endmodule