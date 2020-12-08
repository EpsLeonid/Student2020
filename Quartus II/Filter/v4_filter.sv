import package_settings::*;
//import v4_filter_parameters::*;
import v4_filter_parameters::K;
import v4_filter_parameters::L;
import v4_filter_parameters::M;

module v4_filter
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
reg [SIZE_ADC_DATA+6:0] V [K+L:0];
reg [SIZE_ADC_DATA+6:0] D;
reg	[SIZE_ADC_DATA+6:0] D1;
reg	[SIZE_ADC_DATA+6:0] D2;
reg	[SIZE_ADC_DATA+6:0] P1;

always @( posedge clk or posedge !reset)
begin 
	if(!reset)
begin
		for(int I=0; I <= K+L ; I++)
		begin
			V[I] <= 0;
		end
		D <= 0;	
		D1 <= 0;	
		D2 <= 0;	
		P <= 0;	
		P1 <= 0;	
		R <= 0;	
		S <= 0;	
		Md <= 0;	
		output_data <= 0;
		end
	
	else
begin
		V[0] <= input_data;	
		for(int I=1; I <= K+L; I++)
			V[I] <= V[I-1];
		D1 <= V[0] - V[K];
		D2 <= V[L] - V[K+L];
		D <= D1 - D2; 
		P <= P + D;
	    Md <= M * D;
	    P1 <= P;
		R <= P1 + Md;
		S <= S + R;
		output_data <= S >>> 4;
	end 					
end
endmodule