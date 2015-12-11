module half_alu(in_x, in_y, sel, sum, carry_o);
	//input
	
	input in_x;
	input in_y;
	input sel ; 
	
	//output
	
	output sum;
	output carry_o;
	
	//Port Data types
	
	wire in_x;
	wire in_y;
	wire se;
	wire sum;
	wire carry_o;
	
	//code
	
	assign sum = in_x ^ in_y;
	
	assign carry_o = (in_x ^ sel) & in_y;

endmodule 