module v3_filter
(
input wire clk,
input wire reset,
input wire signed [SIZE_ADC_DATA-1:0] input_data,
output reg signed [SIZE_FILTER_DATA-1:0] output_data
);


import package_settings::*;
import v3_filter_parameters::*;




reg 		[SIZE_ADC_DATA+6:0]		v [11:0];
reg 		[SIZE_ADC_DATA+6:0]		dk;
reg 		[SIZE_ADC_DATA+6:0]		dl;
reg 		[SIZE_ADC_DATA+6:0]		dl_prom[5:0];
reg 		[SIZE_ADC_DATA+6:0]		p;
reg 		[SIZE_ADC_DATA+6:0]		p_delay;
reg 		[SIZE_ADC_DATA+6:0]		q;
reg 		[SIZE_ADC_DATA+6:0]		s;
//--------------------------------------------------------------------------------------------------

always @ (posedge clk or negedge reset)
begin

	if (!reset)
	  begin
            v[0] <= 0;
      
      for (integer i = 1; i<=v3_k; i++)
			begin
				 v[i] <=  v[i-1];
			end
	  dk <= 0;
	  dl <= 0;
	  dl_prom[0] <= 0; 
	  for (integer i = 1; i<=v3_l; i++)
			begin
				 dl_prom[i] <=  0;
			end
	  p <= 0;
	  q <= 0;
	  s <= 0;
	  output_data <= 0;

      end
	else
      begin
      v[0] <= input_data;
      
      for (integer i = 1; i<=v3_k; i++)
			begin
				 v[i] <=  v[i-1]; 
			end
	  dk <= v[1] + v[v3_k-1];
	  dl <= v[0] + v[1];
	  dl_prom[0] <= dl; 
	  for (integer i = 1; i<=v3_l; i++)
			begin
				 dl_prom[i] <=  dl_prom[i-1]; 
			end
	  p <= p + dk - v3_k*dl_prom[v3_l-1]; 
	  p_delay <= p;
	  q <= q + v3_m2*p;
	  s <= s + q + v3_m1*p_delay;
	  output_data <= s>>8;
      end
end

endmodule
