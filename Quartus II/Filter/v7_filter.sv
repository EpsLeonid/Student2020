import v7_param ::*;
module v7_filter (clk, reset, input_data, output_data);
input wire signed [SIZE_ADC_DATA-1:0] input_data;
input wire clk, reset;
output reg signed [(SIZE_ADC_DATA+M_length_var7)+10:0] output_data=1'b0;// last ever-increasing accumulator; take the number of digits with a margin;

reg [SIZE_ADC_DATA-1:0]   d_buffer  [l_var7+k_var7:0]; // buffer of delay-line
//------------------------------------------  +1 digit for sign (-/+)
reg signed [SIZE_ADC_DATA+1:0] d_out=1'b0; // max d_out=2*SIZE_ADC_DATA; number of digits=SIZE_ADC_DATA+1; 
reg signed [SIZE_ADC_DATA-1:0] del_l=1'b0; // buffer of l-delay; number of digits the same as input_data;
reg signed [SIZE_ADC_DATA-1:0] del_k=1'b0; // buffer of k-delay; number of digits the same as input_data;
reg signed [SIZE_ADC_DATA-1:0] del_lk=1'b0; // buffer of (k+l)-delay; number of digits the same as input_data;
reg signed [SIZE_ADC_DATA+M_length_var7:0] m_mult=1'b0; // mult buffer max number SIZE_ADC_DATA+ M_length;
reg signed [(SIZE_ADC_DATA+M_length_var7)+10:0] p_acc=1'b0; // ever-increasing accumulator; take the number of digits with a margin;
reg signed [(SIZE_ADC_DATA+M_length_var7)+10:0] pm_add=1'b0; // last adder; take the number of digits with a margin;
//------------------------------------------

//------------------------------------------ write 0 in all elements of d_buffer
initial begin
	for (int j=0; j<=l_var7+k_var7; j++) begin
		d_buffer[j]=1'b0;
	end
end
//------------------------------------------

always@(posedge clk) begin

//------------------------------------------ write onput data in buffers
	d_buffer[0]=input_data;
	del_l=d_buffer[l_var7];
	del_k=d_buffer[k_var7];
	del_lk=d_buffer[k_var7+l_var7];
//------------------------------------------
	d_out<=input_data-del_l-del_k+del_lk; // input signal with all delays
	
	m_mult=d_out*M_var7;
	p_acc=(p_acc+d_out);
	pm_add<=(m_mult+p_acc);
	
	output_data<=output_data+pm_add; // total output sihnal
//------------------------------------------ shift data in buffer	
	for (int i=1; i<=k_var7+l_var7; i++) begin
		d_buffer[i]<=d_buffer[i-1];
	end
//------------------------------------------

//------------------------------------------ reset everything that is 	
	if (reset==1'b0) begin
//------------------------------------------ reset d_buffer	
		for (int i=0; i<l_var7+k_var7; i++) begin
			d_buffer[i]<=1'b0;
		end	
		del_l=1'b0;
		del_k=1'b0;
		del_lk=1'b0;
		d_out<=1'b0;
		m_mult=1'b0;
		p_acc=1'b0;
		pm_add<=1'b0;
		output_data<=1'b0;		
	end
//------------------------------------------	
end 
 
endmodule