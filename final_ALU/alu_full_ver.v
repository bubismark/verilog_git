module alu_full_ver (a, b, opcode, res);
	
	input a;
	input b;
	input opcode;
	
	output res;
	
	//input
	wire [3:0] opcode;
	wire [7:0] a     ;
	wire [7:0] b     ;
	wire [7:0] temp_sum ;
	wire carry;

	//output
	logic  [7:0] res   ;
	alu_8 only (.x (a),.y (b), .sel (opcode),.sum (temp_sum),.carry(carry));

	always_comb begin
		casez(opcode)
			4'b0000 : assign res ={carry,temp_sum} ;
			4'b0001 : assign res = temp_sum ;
			4'b0010 : assign res = a & b    ;
			4'b0011 : assign res = a | b    ;
			4'b0100 : assign res = a ^ b    ;
			4'b0101 : assign res = ~b       ;  
			4'b0110 : assign res = a & (~b) ;	
			4'b0111 : assign res = a >>> 1  ;
			4'b1000 : assign res = a >>  1  ;
			4'b1001 : assign res = a <<  1  ;
			default : assign res = 8'b11111111;
		endcase
	end 
     endmodule 
	 
	 	 
