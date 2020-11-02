module d_trigger(output out,
				 input d,clk
				);


always @ (posedge clk)
begin
	out <= d;
end


		
endmodule