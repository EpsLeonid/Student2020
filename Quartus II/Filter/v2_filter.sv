	import parameters_v2 ::*;
module v2_filter(	clk, 
						reset, 
						input_data, 
						output_data,
);

	
	input wire clk, reset;
	input wire [SIZE_ADC_DATA+5:0]input_data;
/* необходим 21 бит потому, что максимальное значение на выходе равно 293 527, на это нужно 20 бит
и ещё 1 бит на знак + или -
*/
	output reg [SIZE_ADC_DATA + 5:0]output_data;
/* в качестве переменной обозначены регистры с знакопеременными значениями
потому, что в алгоритме приходится сохранять результаты предыдущих вычислений
*/
	reg signed [SIZE_ADC_DATA + 5:0] D[k+l:0];/* Этот массив регистров нужен для того, чтобы
осуществить задержку входного сигнала на l, k, l+k шагов 
*/
	reg signed [SIZE_ADC_DATA + 5:0] p, d, s, r;
	reg signed [SIZE_ADC_DATA + 5:0] D2, D1;
	reg signed [SIZE_ADC_DATA + 5:0] M1;	
	
	always @(posedge clk or negedge reset)// пока тактовый сигнал действует и не подан сброс

		begin
	if (!reset)
		begin
// при активации сброса, данные обнуляются, а массив D необходимо отчистить
		D[0] <= 0;
		D1 <= 0;
		D2 <= 0;

		d  <= 0;
		M1 <= 0;
		p <= 0;
		r <= 0;
		s <= 0;
		output_data <= 0;
		for (integer i = 0; i <= k+l; i++)
		begin
			D[i]<= 0;
		end

	end

	else
	begin
//если хочется задержку выходного сигнала в 1 такт, то =, если в l+1 такт, то <=
		D[0] = input_data;
		D1 = D[0] - D[l];
		D2 = D[k] - D[k+l];

		d  = D1 - D2;
		M1 = d*M;
		p = p + d;
		r = p + M1;
		s = s + r;
		output_data <= s;// выводим выходной сигнал только после того как тактовый стгнал исчезнет
		for (integer i = 1; i <= k+l; i++) // сдвигаем значение входного сигнала в следующий регистр
		begin
			D[i]<= D[i-1];
		end

	end

		end	
endmodule