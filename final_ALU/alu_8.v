module alu_8(x, y, sel, sum, carry);
	//logic
	
	input [7:0] x;
	input [7:0] y;
	input [2:0] sel;
	//output
	
	output [7:0] sum;
	output carry;

	
	//Port Data types
	
	wire [7:0] x;
	wire [7:0] y;
	wire [7:0] sum ;
	wire carry;
	wire [2:0] sel;
	// Internal variables
	
	wire temp_carry_1;
	wire temp_carry_2;
	wire temp_carry_3;
	wire temp_carry_4;
	wire temp_carry_5;
	wire temp_carry_6;
	wire temp_carry_7;
	
	
	//code

	half_alu only (.in_x    (x[0]),
				  .in_y    (y[0]),
				  .sel     (sel[0]),
					  .sum     (sum[0]),
					  .carry_o (temp_carry_1)
					  );
					  
	full_alu first (.in_x    (x[1]),
					  .in_y    (y[1]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_1),
					  .sum     (sum[1]),
					  .carry_o (temp_carry_2)
					  );
					  
	full_alu second (.in_x    (x[2]),
					  .in_y    (y[2]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_2),
					  .sum     (sum[2]),
					  .carry_o (temp_carry_3)
					  );
	
	full_alu third (.in_x    (x[3]),
					  .in_y    (y[3]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_3),
					  .sum     (sum[3]),
					  .carry_o (temp_carry_4)
					  );
					  
	full_alu forth (.in_x    (x[4]),
					  .in_y    (y[4]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_4),
					  .sum     (sum[4]),
					  .carry_o (temp_carry_5)
					  );
	
	full_alu fifth (.in_x    (x[5]),
					  .in_y    (y[5]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_5),
					  .sum     (sum[5]),
					  .carry_o (temp_carry_6)
					  );
	
	full_alu sixth (.in_x    (x[6]),
					  .in_y    (y[6]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_6),
					  .sum     (sum[6]),
					  .carry_o (temp_carry_7)
					  );
	
	full_alu seventh (.in_x    (x[7]),
					  .in_y    (y[7]),
					  .sel     (sel[0]),
					  .carry_i (temp_carry_7),
					  .sum     (sum[7]),
					  .carry_o (carry)
					  );

endmodule 