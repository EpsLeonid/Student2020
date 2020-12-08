import v10_filter_parameters::*;
module v10_filter (clk, reset, input_data, output_data);

	//--------------------------------------------------------------- ports initialization
	input wire signed [SIZE_ADC_DATA-1:0] input_data;
	input wire clk, reset;
	output reg signed [SIZE_FILTER_DATA-1:0] output_data=1'b0;// output signal
	//***********************************************************************************

	//---------------------------------------------------------------- internal registers

	reg signed [SIZE_ADC_DATA-1:0]   delay_line  [(l_var10+k_var10):0]; // input data buffer
	reg signed [SIZE_ADC_DATA+1:0] d_line=1'b0; // d-part of signal

	//--------------------------------------------------------------- additional mult-buffers
	reg signed [SIZE_ADC_DATA+Mw_var10:0] m_buf=1'b0; 
	reg signed [SIZE_ADC_DATA+Mw_var10:0] m_buf2=1'b0;
	//----------------------------------------------------------------------------------

	reg signed [(SIZE_ADC_DATA+Mw_var10):0] p_line=1'b0; // p-part of signal
	reg signed [(SIZE_ADC_DATA+Mw_var10):0] sig_add=1'b0; 
	reg signed [(SIZE_ADC_DATA+Mw_var10):0] s_line=1'b0; // s-part of signal
	//***********************************************************************************

always@(posedge clk) begin

	delay_line[0]=input_data; // write input data in 0 ellement of array
	d_line=input_data-(delay_line[l_var10]+delay_line[k_var10])+delay_line[k_var10+l_var10]; // d-line total

	//---------------------------------------------------------------- mult buffers
	m_buf2<=(input_data-delay_line[l_var10])*M_var10; // 1st mult buffer
	m_buf<=(delay_line[k_var10+l_var10]-delay_line[k_var10])*M_var10; //2nd mult buffer
	//***********************************************************************

	p_line<=p_line+d_line;
	sig_add<=(m_buf+m_buf2+p_line);
	
	s_line<=s_line+sig_add; // total output sihnal
	if (s_line>16'd65535)	output_data<=16'd65535; // overflow check
	else output_data<=s_line;

//------------------------------------------ shift data in delay_line
	for (int i=1; i<=k_var10+l_var10; i++) begin
		delay_line[i]<=delay_line[i-1];
	end
//**************************************************************


//------------------------------------------ reset-block
	if (reset==1'b0) begin
		for (int i=0; i<=l_var10+k_var10; i++) begin
			delay_line[i]<=1'b0;
		end	
		d_line<=1'b0;
		m_buf<=1'b0;
		m_buf2<=1'b0;
		p_line<=1'b0;
		sig_add<=1'b0;
		output_data<=1'b0;	
		s_line<=1'b0;	
	end
//------------------------------------------	
end 
 
endmodule