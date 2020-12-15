import v7_param ::*;
module v7_filter (clk, reset, input_data, output_data);
input wire signed [SIZE_ADC_DATA-1:0] input_data;
input wire clk, reset;
output reg signed [SIZE_FILTER_DATA-1:0] output_data=1'b0;// last ever-increasing accumulator; take the number of digits with a margin;

reg signed [SIZE_ADC_DATA-1:0]   d_buffer  [(l_var7+k_var7):0]; // buffer of delay-line
//------------------------------------------  +1 digit for sign (-/+)
reg signed [SIZE_ADC_DATA+1:0] d_out=1'b0; // max d_out=2*SIZE_ADC_DATA; number of digits=SIZE_ADC_DATA+1; 
reg signed [SIZE_ADC_DATA+1:0] d_part1=1'b0; // d-line acc buffer 
reg signed [SIZE_ADC_DATA+1:0] d_part2=1'b0; // d-line acc buffer 
reg signed [SIZE_ADC_DATA+4:0] m_mult=1'b0; // 1st mult buffer max number SIZE_ADC_DATA+ M_length;
reg signed [(SIZE_ADC_DATA+4):0] p_acc=1'b0; // ever-increasing accumulator; take the number of digits with a margin;
reg signed [(SIZE_ADC_DATA+4):0] r_acc=1'b0; // last adder; take the number of digits with a margin;
reg signed [(SIZE_ADC_DATA+4):0] s_acc=1'b0; // buffer of output data; take the number of digits with a margin;

//------------------------------------------

//------------------------------------------ write 0 in all elements of d_buffer
/*initial begin
	for (int j=0; j<=l_var7+k_var7; j++) begin
		d_buffer[j]=1'b0;
	end
end*/
//------------------------------------------

always@(posedge clk or negedge reset) begin
//------------------------------------------ reset everything that is 	
	if (reset==1'b0) begin
		for (int i=0; i<=l_var7+k_var7; i++) begin
			d_buffer[i]<=1'b0;
		end	
		d_out<=1'b0;
		m_mult<=1'b0;
		p_acc<=1'b0;
		r_acc<=1'b0;
		output_data<=1'b0;	
		s_acc<=1'b0;	
	end
//------------------------------------------
	else begin
//------------------------------------------ 
	d_buffer[0]<=input_data; // write input data in buffer
	d_part1<=d_buffer[0]-d_buffer[l_var7]; // input signal with all delays
	d_part2<=d_buffer[k_var7+l_var7]-d_buffer[k_var7];
//------------------------------------------
	d_out<=d_part1+d_part2;
	m_mult<=d_out*M_var7; // 1st mult buffer
	p_acc<=p_acc+d_out;
	r_acc<=p_acc+m_mult;
	s_acc<=s_acc+r_acc;
	
	output_data<=s_acc >>> 3'd4;


//------------------------------------------ shift data in buffer	
	for (int i=1; i<=k_var7+l_var7; i++) begin
		d_buffer[i]<=d_buffer[i-1];
	end
//------------------------------------------
	end

end 
 
endmodule