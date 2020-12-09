module v10_filter (clk, reset, input_data, output_data);
import package_settings::*;
import v10_filter_parameters::*;
//parameter  k_v10=4'd10, l_v10=3'd6, M_v10=5'd16, M_length_v10=3'd4;

input wire unsigned [SIZE_ADC_DATA-1:0] input_data;
input wire clk, reset;
output reg unsigned [SIZE_FILTER_DATA-1:0] output_data=1'b0;
		
reg unsigned [SIZE_ADC_DATA-1:0] buffer_data  [(l_v10 + k_v10):0];
reg unsigned [SIZE_ADC_DATA+1:0] d_kl_v10 = 1'b0; 					
reg unsigned [SIZE_ADC_DATA+M_length_v10:0] r_buff1_v10 = 1'b0; 				
reg unsigned [SIZE_ADC_DATA+M_length_v10:0] r_buff2_v10 = 1'b0; 				
reg unsigned [SIZE_ADC_DATA+M_length_v10:0] p_accum_v10 = 1'b0; 			
reg unsigned [SIZE_ADC_DATA+M_length_v10:0] r_tot_v10 = 1'b0; 
reg unsigned [SIZE_ADC_DATA+M_length_v10:0] output_buffer = 1'b0;		
//--------------------------------------------------------------------------------------------------//		

initial begin
	for (int j=0; j <= l_v10 + k_v10; j++) 
	begin
		buffer_data[j]=1'b0;
	end
end

always@(posedge clk)
begin

	buffer_data[0]=input_data; 							
	d_kl_v10 = input_data - (buffer_data[l_v10] + buffer_data[k_v10]) + buffer_data[k_v10 + l_v10]; 
	
	r_buff1_v10 <= (input_data + buffer_data[k_v10 + l_v10]) * M_v10; 					
	r_buff2_v10 <= (buffer_data[l_v10]+ buffer_data[k_v10]) * M_v10; 			
	
	p_accum_v10 <= (p_accum_v10 + d_kl_v10);
	r_tot_v10 <= (r_buff1_v10 - r_buff2_v10) + p_accum_v10;
	
	output_buffer <= output_buffer + r_tot_v10; 	
		
	if (output_buffer>16'd65535) begin	output_data<=16'd65535; end
	else begin output_data<=output_buffer; end
				
	for (int i=1; i <= k_v10 + l_v10; i++)
		begin
		buffer_data[i] <= buffer_data[i - 1];
		end



	if (reset == 1'b0) 
		begin
			for (int i=0; i <= l_v10 + k_v10; i++)
				begin
					buffer_data[i] <= 1'b0;
				end	
			d_kl_v10 <= 1'b0;
			r_buff1_v10 <= 1'b0;
			r_buff2_v10 <= 1'b0;
			p_accum_v10 <= 1'b0;
			r_tot_v10 <= 1'b0;
			output_buffer <= 1'b0;
			output_data <= 1'b0;		
		end
end 
 
endmodule

