	import v5_param ::*;
module v5_filter(	clk, 
						reset, 
						input_data, 
						output_data,
);

	
	input wire clk, reset;
	input wire [SIZE_ADC_DATA+5:0]input_data;
/* Neobhodimo 20 Bits, 19 chtobu vlezlo znachenie 293 527 i 1 Bit dl`a znaka
*/
	output reg [SIZE_FILTER_DATA+3:0]output_data;
/* v kachestve peremennou oboznachenu registru c znakoperemennumu znacheniamu
potomu, chto v algoritme prihodits`a sohranat` rezul`tatu predudyshih vuchesleniu
*/
	reg signed [SIZE_ADC_DATA + 5:0] D[k_5+l_5:0];/* etot massive registrov ny}I{en dl`a togo, chtobu
osyshestvit` smeshenue vhodnogo cignala na l, k, l+k shagov 
*/
	reg signed [SIZE_ADC_DATA + 5:0] p, d, s, r;
	reg signed [SIZE_ADC_DATA + 5:0] D2, D1;
	reg signed [SIZE_ADC_DATA + 5:0] M1;	
	
	always @(posedge clk or negedge reset)// poka clk  podan u sbros

		begin
			if (!reset)
		begin
// pri  sbrosa, dannue obnulauyt`sa, a massive D neobhodimo otchistit`
		D[0] <= 0;
		D1 <= 0;
		D2 <= 0;

		d  <= 0;
		M1 <= 0;
		p <= 0;
		r <= 0;
		s <= 0;
		output_data <= 0;
		for (integer i = 0; i <= k_5+l_5; i++)
		begin
			D[i]<= 0;
		end

	end

	else
	begin

		D[0] <= input_data;
		D1 <= D[0] - D[l_5];
		D2 <= D[k_5] - D[k_5+l_5];

		d  <= D1 - D2;
		M1 <= d*M_5;
		p <= p + d;
		r <= p + M1;
		s <= s + r;
		output_data <= s >>> 4;
		for (integer i = 1; i <= k_5+l_5; i++) // cdvigaem podanyu signal v sosedniu register
		begin
			D[i]<= D[i-1];
		end

	end

		end	
endmodule