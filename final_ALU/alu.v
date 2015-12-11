module alu (a, b, opcode, res);
	
	input a;
	input b;
	input opcode;
	
	output res;
	
	//input
	wire [2:0] opcode;
	wire [7:0] a     ;
	wire [7:0] b     ;
	wire [7:0] temp_sum ;
	wire carry;

	//output
	logic  [7:0] res   ;
	alu_8 only (.x (a),.y (b), .sel (opcode),.sum (temp_sum));

	always@(opcode,a,b)
	case(opcode)
		3'b000: assign res ={carry,temp_sum} ;
		3'b001: assign res = temp_sum ;
		3'b010: assign res = a & b ;
		3'b011: assign res = a | b ;
		3'b100: assign res = a^b   ;
		3'b101: assign res = ~b    ;  
	endcase
     endmodule 
	 
	 //full_alu only(.x (a),.y (b), .sel (opcode),.sum (res));
	 
