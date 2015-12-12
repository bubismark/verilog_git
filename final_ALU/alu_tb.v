// Testbench for 8 bit adder with carry out
// Runs all possible 8 bit add combinations
// Checks and prints results  

module alu_tb ();

logic  [7:0]x;
logic  [7:0]y;
logic  [3:0]     sel;
logic  [7:0]sum;
logic       pass;

initial begin
  pass = 1;
		for(int i=6;i<7;i=i+1)begin	
			  for (int j=0; j<256; j=j+1) begin
					for (int k=0; k<256; k=k+1) begin
					  #1;
					  sel = i;
					  x = j;
					  y = k;
					  #1;
					  if (sel==0)
						begin
						  if (x+y ==  sum) // testing sum
							$display ("OK:   %3d + %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d + %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==1)
						begin
						  if (x-y ==  sum) // testing sub
							$display ("OK:   %3d - %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d - %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==2)
						begin
						  if ((x&y) ==  sum) // testing and 
							$display ("OK:   %3d & %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d & %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==3)
						begin
						  if (x|y ==  sum) // testing or
							$display ("OK:   %3d | %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d | %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==4)
						begin
						  if ((x^y) ==  sum) // testing xor
							$display ("OK:   %3d ^ %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d ^ %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==5)
						begin
						  if (~(y) ==  sum) // testing not b
							$display ("OK:  original y %3d should be  %3d amd is %3d", y, ~y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL:original y %3d should be  %3d amd is %3d", y, ~y, sum);
						  end
						end
						if (sel==6)
						begin			
						  if ( (x & (~y)) ==  sum) // testing x and ~y 
							$display ("OK:   %3d & ~(%3d) = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL mark testing x and ~y: this is x: %3d and y: %3d  and (~y): %3d but  result is : %3d instade of :%3d", x, y,(~y),  sum, x&((~y)+8'b00000001));
						  end
						end
						if (sel==7)
						begin
						  if ( x >>> 1==  sum) // testing x  arithmetic shift right 
							$display ("OK: this is x:%3d and shifted arithmetic : %3d", x, sum);
						  else begin
							pass = 0;	
							$display ("FAIL testing x  arithmetic shift right:this is x: %3d this is shifted : %3d", x, sum);
						  end
						end
						if (sel==8)
						begin
						  if (x>>1 ==  sum) // testing x logical shift right 
							$display ("OK: this is x:%3d and logiccly shifted right :%3d", x, sum);
						  else begin
							pass = 0;	
							$display ("FAIL testing x logical shift right: %3d - %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==9)
						begin
						  if (x<<1 ==  sum) // testing x logical shift left
							$display ("OK: this is x:%3d and logiccly shifted left: %3d", x, sum);
						  else begin
							pass = 0;	
							$display ("FAIL testing x logical shift left :this is x %3d and this is res: %3d ", x,  sum);
						  end
						end
										  
					end
			  end
		end 
  $display ("TEST STATUS: %s", pass ? "PASS" : "FAIL");
end

// DUT instance
alu_full_ver i_add_8 
(
 .res         (sum[7:0]),
 .opcode          (sel),
 // Inputs
 .a           (x[7:0]),
 .b           (y[7:0]));

endmodule

