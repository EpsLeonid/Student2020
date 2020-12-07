module v3_filter
(
	input wire 	clk,
	input wire	reset,
	input wire  [SIZE_ADC_DATA : 0]input_data,

	output reg  [SIZE_FILTER_DATA : 0]output_data
);

//--------- import of parameters--------------------------------------------------------------------
import package_settings::*;
import v3_filter_parameters::*;
//--------------------------------------------------------------------------------------------------


//-------- variable equations from the task---------------------------------------------------------
	reg			[v3_k:0][SIZE_ADC_DATA:0]y;

	reg			[SIZE-1:0]dk;
	reg			[SIZE-1:0]dl;
	
	reg			[SIZE-1:0]q;
	reg			[SIZE-1:0]p;
	reg			[SIZE-1:0]s;
	
	reg			[SIZE-1:0]dlk;   					// k*dl

	reg			[SIZE-1:0]mult2; 					// m2*p(n)
	reg			[SIZE-1:0]mult1; 					// m1*p(n)
//--------------------------------------------------------------------------------------------------

	
//------------- form a delay -----------------------------------------------------------------------

	reg			[SIZE-1:0]p_1;
	reg			[SIZE-1:0]q_1;
	reg			[SIZE-1:0]s_1;

	reg			[SIZE-1:0]mult2_1;
	reg			[SIZE-1:0]mult2_2;
	reg			[SIZE-1:0]mult2_3;
//--------------------------------------------------------------------------------------------------

	
always @ (posedge clk) 
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
		
			dk<=v[0]-y[v3_k];
			dl<=y[v3_l]-y[v3_l+1];
			
			dlk<=dl*v3_k;
		
			p<=p[1]+dk-dlk;
			p_1<=p;
		
			q<=q[1]+p_m2_3;
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

endmodule
