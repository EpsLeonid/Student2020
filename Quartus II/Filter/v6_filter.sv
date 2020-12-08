module v6_filter
(
	input wire 	clk,
	input wire	reset,
	input wire  [SIZE_ADC_DATA:0]input_data,

	output reg  [SIZE_FILTER_DATA:0]output_data
);

//--------- import of parameters--------------------------------------------------------------------
import package_settings::*;
import v6_parameters::*;
//--------------------------------------------------------------------------------------------------


//-------- variable equations from the task---------------------------------------------------------
	reg			[v6_k:0][SIZE_ADC_DATA:0]y;

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
			for (int i=1; i<=v6_k; i++)	
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
			for(int i=1; i<v6_k; i++)
				begin
					y[i+1]<=y[i];
				end
		
			y[0]<=input_data;
		
			dk<=y[0]-y[v6_k];
			dl<=y[v6_l]-y[v6_l+1];
			
			dlk<=dl*v6_k;
		
			p<=p[1]+dk-dlk;
			p_1<=p;
		
			q<=q[1]+mult2_3;
			q_1<=q;
		
			mult2<=v6_m2*p_1;
			mult1<=v6_m1*p_1;
		
			mult2_1<=mult2;
			mult2_2<=mult2_1;
			mult2_3<=mult2_2;
		
	
			s<=s[1]+q_1+mult1;
			s_1<=s; 
		
			output_data<=s_1;
		end
end

endmodule