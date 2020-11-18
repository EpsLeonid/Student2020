	import parameters_v2 ::*;
module FilterV2(	clk, 
						reset, 
						output_data_exp_gen, 
						output_data_v2);

	
	input wire clk, reset;
	input wire [SIZE_ADC_DATA-1:0]output_data_exp_gen;
	
	output reg [2*SIZE_FILTER_DATA:0]output_data_v2;
	
	reg signed [2*SIZE_ADC_DATA -1:0] D[0:k+l];
	reg signed [2*SIZE_ADC_DATA +4:0] p, d, s, r;
	reg signed [2*SIZE_ADC_DATA -1:0] D1, D2;
	reg signed [2*SIZE_ADC_DATA + 4:0] M1;	
	
	always @(posedge clk or negedge reset)

		begin
			if (!reset)
				begin 	

					output_data_v2 <= 0;

				end
					else	
						begin
					
							D[k+l] <= output_data_exp_gen;

							D1 <= D[0]-D[k];
							D2 <= D[l]-D[k+l];

							d <= D1-D2;	
							p <= p + d;
							M1 <= M*d;
							r <= p + M1;
							s <= s + r;
					
							output_data_v2 <= s;
					
							for (integer n = 1; n <= 1; n++)
								begin
									D[n] <= D[n-1];
								end
						end

		end	
endmodule