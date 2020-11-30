import v3_filter_parameters::*;
module v3_filter
(
	input wire 			clk,
	input wire 			reset,
	input wire 			[SIZE_ADC_DATA-1:0]input_data, 			//NOT SURE
	
	output reg  		[SIZE_ADC_DATA-1:0]output_data 
);
	integer 			i;
	
	reg					[SIZE_ADC_DATA-1:0]p;
	reg					[SIZE_ADC_DATA-1:0]q;
	reg					[SIZE_ADC_DATA-1:0]s;
	reg					[SIZE_ADC_DATA-1:0]d_l;
	reg					[SIZE_ADC_DATA-1:0]d_k;
	reg					[SIZE_ADC_DATA-1:0]kdl;
	
	reg                 [2*SIZE_ADC_DATA-1:0]mult_1;
	reg                 [2*SIZE_ADC_DATA-1:0]mult_2;
	reg                 [2*SIZE_ADC_DATA-1:0]mult_kd_l;
	
	reg					[k+l:0][SIZE_ADC_DATA-1:0]y;
	
always@(posedge clk or posedge reset)
begin


if (reset)
	begin
		for(i=1;i<=k+l;i++)
			begin
				y[i]<=0;
			end
		d_l<=0;
		d_k<=0;
			
		p<=0;
		q<=0;
		s<=0;
		
		output_data<=0;	
	end
	
	
else
	begin
		for(i=1;i<=k+l;i++)
			begin
				y[i+1]<=y[i];
			end
		y[0]<=input_data;
		
		d_k<=y[0]-y[1];
		d_l<=y[k]-y[k+l];
			
		mult_1<=p*m1;
		mult_2<=p*m2;
		mult_kd_l<=k*d_l[i-l];
		
		p <= p[i] + d_k[i] - mult_kd_l;
		q <= q[i] + mult_2;
		s <= s[i] + q + mult_1;
		
		output_data<=s;

	end
 end
endmodule
