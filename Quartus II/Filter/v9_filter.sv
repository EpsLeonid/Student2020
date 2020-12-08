import package_settings::*;
import v9_parameter::*;

module v9_filter (
//--------------------------------------------------------------------------------------
	input  wire                                                  clk,
	input  wire                                                  reset,
//--------------------------------------------------------------------------------------
	input  wire [SIZE_ADC_DATA - 1:0]                            input_data,
//--------------------------------------------------------------------------------------
	output reg  [SIZE_ADC_DATA - 1:0]                            output_data);
//--------------------------------------------------------------------------------------

	reg         [(SIZE_ADC_DATA - 1)*4:0]                                signal_delay [k_9:0];
	
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                dk;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                d1;
	
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                d1_delay [l_9-1:0];
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                k_d1;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                dk_k_d1;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                dk_delay;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                p;
	
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                m1_p;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                m2_p;

	
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                q;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                q_delay;
	reg         [(SIZE_ADC_DATA - 1)*4:0]                                q_m1_p;

	reg         [(SIZE_ADC_DATA - 1)*4:0]                                s;

	always @ (posedge clk or negedge reset) begin
		if (!reset) begin
		//--------------------------------------------------------------------------------------
			dk														<= 0;
			d1														<= 0;
			
			d1_delay [0]													<= 0;
			for (integer i = 1; i <= l_9-1; i++) begin
				d1_delay[i]												<= 0;
			end
													
			k_d1														<= 0;
			dk_k_d1														<= 0;
			dk_delay													<= 0;
			p														<= 0;
			
			m1_p														<= 0;
			m2_p														<= 0;
			q_delay														<= 0;
			q		 												<= 0;
			q_m1_p														<= 0;
			
			s														<= 0;
			
			output_data													<= 0;
			
			for (integer i = 0; i <= k_9; i++) begin
				signal_delay[i]												<= 0;
			end
		//--------------------------------------------------------------------------------------
		end
	else begin
    //--------------------------------------------------------------------------------------
			signal_delay[0]													<= input_data;
			for (integer i = 1; i <= k_9; i++) begin
				signal_delay[i]												<= signal_delay[i-1];
			end
			dk														<= signal_delay[0] - signal_delay[k_9];
			d1														<= signal_delay[0] - signal_delay[1];
			
			d1_delay [0]													<= d1;
			
			for (integer i = 1; i <= l_9-1; i++) begin
				d1_delay[i]												<= d1_delay[i-1];
			end
			
			k_d1														<= k_9 * d1_delay[l_9-1];
			dk_delay 													<= dk;
			dk_k_d1														<= dk_delay - k_d1;
			p															<= p + dk_k_d1;
			
			m2_p														<= m2 * p;
			q														<= q + m2_p;
			
			m1_p														<= m1 * p;
			q_delay														<= q;
			q_m1_p														<= q_delay + m1_p;
			s															<= s + q_m1_p ;
			
			output_data													<= s >>> 8;
	//--------------------------------------------------------------------------------------
		end
	end

endmodule