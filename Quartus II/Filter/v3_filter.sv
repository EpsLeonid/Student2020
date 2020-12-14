module v3_filter
(
	input wire 	clk,
	input wire	reset,
	input wire  [SIZE_ADC_DATA-1:0]input_data,

	output reg  [SIZE_ADC_DATA-1:0]output_data
);

//--------- import of parameters--------------------------------------------------------------------
import package_settings::*;
import v3_filter_parameters::*;
//--------------------------------------------------------------------------------------------------


//-------- variable equations from the task---------------------------------------------------------
	reg			[(SIZE_ADC_DATA-1)*4:0]y[v3_k:0];
	

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
	
	reg			[(SIZE_ADC_DATA-1)*4:0]dk_d1k;
	reg			[(SIZE_ADC_DATA-1)*4:0]q_1;
	
//------------- form a delay -----------------------------------------------------------------------
	reg         [(SIZE_ADC_DATA-1)*4:0]d1_delay[v3_l-1:0];
	reg         [(SIZE_ADC_DATA-1)*4:0]q_delay;
//--------------------------------------------------------------------------------------------------

always @ (posedge clk or negedge reset) 
	begin
		if (!reset) 
			begin
				dk<=0;
				dl<=0;
				d1_delay[0]<=0;
				
				for (integer i=1; i<=v3_l-1; i++) 
					begin
						d1_delay[i]<=0;
					end
				
				p<=0;
				q<=0;
				s<=0;
				
				mult1<=0;
				mult2<=0;
				
				q_delay<=0;
				q_1<=0;
				
				dlk<=0;
				dk_delay<=0;
				dk_d1k<=0;
				
				output_data<=0;
			
				for (integer i=0; i<=v3_k; i++) 
					begin
						y[i]<=0;
					end
			end
		else 
			begin
				y[0]<=input_data;
				
			for (integer i=1; i<=v3_k; i++) 
				begin
					y[i]<=y[i-1];
				end
				
				dk<=y[0]-y[v3_k];
				dl<=y[0]-y[1];
			
				d1_delay[0]<=dl;
			
			for (integer i=1; i<=v3_k-1; i++) 
				begin
					d1_delay[i]<=d1_delay[i-1];
				end
			
				p<=p+dk_d1k;
				q<=q+mult2;
				s<=s+q_1;
				
				mult2<= m2*p;
				mult1<=m1*p;
			
				q_delay<=q;
				dk_delay<=dk;
				
				dlk<=v3_k*d1_delay[v3_l-1];
				
				dk_d1k<=dk_delay-dlk;
				q_1<=q_delay+mult1;
				
			
				output_data<=s>>>8;
	//--------------------------------------------------------------------------------------
		end
	end
	
	
/*always @ (posedge clk) 
begin
//--------- check condition of reset----------------------------------------------------------------
	if (!reset) 
		begin
			for (int i=1; i<=v3_k; i++)	
				begin		
					y[i]<=0;
				end					
			dk<=0;
			dl<=0;
	
			q<=0;
			p<=0;
			s<=0;
	
			mult2<=0;
			mult1<=0;
			
			p_1<=0;
			q_1<=0;
	
			mult2_1<=0;
			mult2_2<=0;
			mult2_3<=0;
	
			output_data<=0;
		end
//-------------------------------------------------------------------------------------------------------	
	
	else 											// zero shift
		begin
			for(int i=1; i<v3_k; i++)
				begin
					y[i+1]<=y[i];
				end
		
			y[0]<=input_data;
		
			dk<=y[0]-y[v3_k];
			dl<=y[v3_l]-y[v3_l+1];
			
			dlk<=dl*v3_k;
		
			p<=p[1]+dk-dlk;
			p_1<=p;
		
			q<=q[1]+mult2_3;
			q_1<=q;
		
			mult2<=v3_m2*p_1;
			mult1<=v3_m1*p_1;
		
			mult2_1<=mult2;
			mult2_2<=mult2_1;
			mult2_3<=mult2_2;
		
	
			s<=s[1]+q_1+mult1;
			s_1<=s; 
		
			output_data<=s_1;
		end
end
*/
endmodule
