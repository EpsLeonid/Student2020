module v6_filter
(
	input wire 	clk,
	input wire	reset,
	input wire  [SIZE_ADC_DATA-1:0]input_data,

	output reg  [SIZE_ADC_DATA-1:0]output_data
);

//--------- import of parameters--------------------------------------------------------------------
import package_settings::*;
import v6_parameters::*;
//--------------------------------------------------------------------------------------------------


//-------- variable equations from the task---------------------------------------------------------
	reg			[(SIZE_ADC_DATA-1)*4:0]y[v6_k:0];

	reg			[(SIZE_ADC_DATA-1)*4:0]dk;
	reg			[(SIZE_ADC_DATA-1)*4:0]dl;
	
	reg			[(SIZE_ADC_DATA-1)*4:0]q;
	reg			[(SIZE_ADC_DATA-1)*4:0]p;
	reg			[(SIZE_ADC_DATA-1)*4:0]s;
	
	reg			[(SIZE_ADC_DATA-1)*4:0]dlk;   					// k*dl
	reg			[(SIZE_ADC_DATA-1)*4:0]dk_delay; 				// dk-dlk
	reg			[(SIZE_ADC_DATA-1)*4:0]mult2; 					// m2*p
	reg			[(SIZE_ADC_DATA-1)*4:0]mult1; 					// m1*p
//--------------------------------------------------------------------------------------------------

	
//------------- form a delay -----------------------------------------------------------------------
	reg			[(SIZE_ADC_DATA-1)*4:0]dk_d1k;
	reg			[(SIZE_ADC_DATA-1)*4:0]q_1;
	reg         [(SIZE_ADC_DATA-1)*4:0]d1_delay[v6_l-1:0];
	reg         [(SIZE_ADC_DATA-1)*4:0]q_delay;
//--------------------------------------------------------------------------------------------------

	
always @ (posedge clk or negedge reset) 
begin
//--------- check condition of reset----------------------------------------------------------------
	if (!reset) 
		begin
				dk<=0;
				dl<=0;
				d1_delay[0]<=0;
				
			for (int i=1; i<=v6_k; i++)	
				begin		
					d1_delay[i]<=0;
				end					
			dk<=0;
			dl<=0;
	
			q<=0;
			p<=0;
			s<=0;
			
			q_delay<=0;
			mult2<=0;
			mult1<=0;
			
			
			q_1<=0;
	
			dlk<=0;
			dk_delay<=0;
			dk_d1k<=0;
	
			output_data<=0;
			
		for (int i=0; i<=v6_k; i++) 
					begin
						y[i]<=0;
					end
			end
//-------------------------------------------------------------------------------------------------------	
	
	else 
			begin
				y[0]<=input_data;
				
			for (integer i=1; i<=v6_k; i++) 
				begin
					y[i]<=y[i-1];
				end
				
				dk<=y[0]-y[v6_k];
				dl<=y[0]-y[1];
			
				d1_delay[0]<=dl;
			
			for (integer i=1; i<=v6_k-1; i++) 
				begin
					d1_delay[i]<=d1_delay[i-1];
				end
			
				p<=p+dk_d1k;
				q<=q+mult2;
				s<=s+q+mult1;;
				
				mult2<= m2*p;
				mult1<=m1*p;
			
				
				dlk<=v6_k*d1_delay[v6_l-1];
				
				dk_d1k<=dk-dlk;
				
				
			
				output_data<=s>>>8;
end
end
endmodule
