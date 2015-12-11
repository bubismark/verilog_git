module full_alu(in_x, in_y, sel, carry_i, sum, carry_o);
	//input
	
	input in_x;
	input in_y;
	input carry_i;
	input sel;
	
	//output
	
	output sum;
	output carry_o;
	
	//Port Data types
	wire sel;
	wire in_x;
	wire in_y;
	wire carry_i;
	wire sum ;
	wire carry_o;
	// Internal variables
	
	wire temp_sum;
	wire temp_carry;
	wire temp_or;
	assign carry_o = temp_or | temp_carry;
	//code
	half_alu first (.in_x    (in_x),
					  .in_y    (in_y),
					  .sel      (sel),
					  .sum     (temp_sum),
					  .carry_o (temp_carry)
					  );
					  
	half_alu second (.in_x    (temp_sum),
					  .in_y    (carry_i),
					  .sel      (sel),
					  .sum     (sum),
					  .carry_o (temp_or)
					  );
	
	
	
endmodule 