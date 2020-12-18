import package_settings::*;

import v10_filter_parameters::k_10;
import v10_filter_parameters::l_10;
import v10_filter_parameters::M_10;

module v10_filter
( 
input wire clk,
input wire reset,
input wire signed [SIZE_ADC_DATA-1:0] input_data,
output reg signed [SIZE_FILTER_DATA-1:0] output_data
);

reg [SIZE_ADC_DATA+6:0] P;
reg [SIZE_ADC_DATA+6:0] Md;
reg [SIZE_ADC_DATA+6:0] S;
reg [SIZE_ADC_DATA+6:0] R;
reg [SIZE_ADC_DATA+6:0] V [k_10+l_10:0];
reg [SIZE_ADC_DATA+6:0] D;
reg	[SIZE_ADC_DATA+6:0] D1;
reg	[SIZE_ADC_DATA+6:0] D2;

always @( posedge clk or posedge !reset)
begin 
	if(!reset)
begin
		for(int I=0; I <= k_10+l_10 ; I++)
		begin
			V[I] <= 0;
		end
		D <= 0;	
		D1 <= 0;	
		D2 <= 0;	
		P <= 0;		
		R <= 0;	
		S <= 0;	
		Md <= 0;	
		output_data <= 0;
		end
	
	else
begin
		V[0] <= input_data;	
		for(int I=1; I <= k_10+l_10; I++)
			V[I] <= V[I-1];
		D1 <= V[0] - V[k_10];
		D2 <= V[l_10] - V[k_10+l_10];
		D <= D1 - D2; 
		P <= P + D;
	    Md <= M_10 * D;
		R <= P + Md;
		S <= S + R;
		output_data <= S >>> 4;
	end 					
end
endmodule