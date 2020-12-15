module v10_filter (clk, reset, input_data, output_data);
import v10_filter_parameters::*;

input wire signed [SIZE_ADC_DATA-1:0] input_data;
input wire clk, reset;
output reg signed [SIZE_FILTER_DATA-1:0] output_data=1'b0;
		
reg signed [SIZE_ADC_DATA-1:0] buffer_data  [(l_v10 + k_v10):0];
reg signed [SIZE_ADC_DATA+1:0] d_kl_v10 = 1'b0; 	
reg signed [SIZE_ADC_DATA+1:0] d_kl_v10_1 = 1'b0; 
reg signed [SIZE_ADC_DATA+1:0] d_kl_v10_2 = 1'b0; 								
reg signed [SIZE_ADC_DATA+3:0] m_buff_v10 = 1'b0; 	
reg signed [SIZE_ADC_DATA+3:0] p_accum_v10 = 1'b0; 							
reg signed [SIZE_ADC_DATA+3:0] r_tot_v10 = 1'b0; 				
reg signed [SIZE_ADC_DATA+3:0] s_tot_v10 = 1'b0; 			
		
//--------------------------------------------------------------------------------------------------//		
/*
initial begin
	for (int j=0; j <= l_v10 + k_v10; j++) 
	begin
		buffer_data[j]=1'b0;
	end
end*/

always@(posedge clk or negedge reset) begin

	if (reset == 1'b0)  begin
			for (int i=0; i <= l_v10 + k_v10; i++) begin
					buffer_data[i] <= 1'b0;
			end	
			d_kl_v10 <= 1'b0;
			d_kl_v10_1 <= 1'b0;
			d_kl_v10_2 <= 1'b0;
			p_accum_v10 <= 1'b0;
			r_tot_v10 <= 1'b0;
			m_buff_v10 <= 1'b0;
			output_data <= 1'b0;	
			s_tot_v10 <= 1'b0;
		end
		
	else begin

	buffer_data[0]<=input_data; 							
	d_kl_v10_1 <= buffer_data[0] -buffer_data[l_v10];
	d_kl_v10_2 <= buffer_data[k_v10 + l_v10] - buffer_data[k_v10];
	d_kl_v10 <= d_kl_v10_1 + d_kl_v10_2;
	
	m_buff_v10 <=  d_kl_v10*M_v10; 					
	
	p_accum_v10 <= p_accum_v10 + d_kl_v10;
	r_tot_v10 <= r_tot_v10 + m_buff_v10;
	s_tot_v10 <= s_tot_v10 + r_tot_v10;
	
	output_data <= s_tot_v10 >> 3'd4;	

				
	for (int i=1; i <= k_v10 + l_v10; i++) begin
		buffer_data[i] <= buffer_data[i - 1];
	end

	end


end 
 
endmodule

