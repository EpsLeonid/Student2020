module Dtrigger( d, clk, out); // описан статичесикй D-триггер
    input wire d, clk;
    output  reg out;

 always @* // выполняется при всех изменениях сигналов
    if(clk == 1'b0)
    begin
      out <= out;
    end
    else 
    begin
	 if (d == 1'b0)
      out <= d;
		else out <= d;
    end
 
 
 endmodule