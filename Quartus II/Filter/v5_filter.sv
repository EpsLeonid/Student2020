import package_settings::*;
//import v5_param::*;
import v5_param::k;
import v5_param::l;
import v5_param::m;

module v5_filter (clk,reset,input_data,output_data );

	input wire clk, reset;
	
	input wire signed [SIZE_ADC_DATA-1:0] input_data;
	
	output reg signed [SIZE_FILTER_DATA-1:0] output_data;
	

	reg signed [SIZE_ADC_DATA + 5:0] y[k+l:0];

	reg signed [SIZE_ADC_DATA + 5:0] p, d, s, r;
	reg signed [SIZE_ADC_DATA + 5:0] D2, D1;
	reg signed [SIZE_ADC_DATA + 5:0] Md;	
	
	always @(posedge clk or negedge reset)

		begin
			if (!reset)
		begin

		y[0] <= 0;
		D1 <= 0;
		D2 <= 0;
		d  <= 0;
		Md <= 0;
		p <= 0;
		r <= 0;
		s <= 0;
		output_data <= 0;
		for (integer i = 0; i <= k+l; i++)
		begin
			y[i]<= 0;
		end

	end

	else
	begin

		y[0] <= input_data;
		D1 <= y[0] - y[l];
		D2 <= y[k] - y[k+l];

		d  <= D1 - D2;
		Md <= m*d;
		p <= p + d;
		r <= p + Md;
		s <= s + r;
		output_data <= s >>> 4;
		for (integer i = 1; i <= k+l; i++) 
		begin
			y[i]<= y[i-1];
		end

	end

		end	
endmodule