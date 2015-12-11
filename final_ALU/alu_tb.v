// Testbench for 8 bit adder with carry out
// Runs all possible 8 bit add combinations
// Checks and prints results  

module alu_tb ();

logic [7:0] x;
logic [7:0] y;
logic  [2:0]     sel;
logic [7:0] sum;
logic       pass;

initial begin
  pass = 1;
		for(int i=0;i<6;i=i+1)begin	
			  for (int j=0; j<256; j=j+1) begin
					for (int k=0; k<256; k=k+1) begin
					  #1;
					  sel = i;
					  x = j;
					  y = k;
					  #1;
					  if (sel==0)
						begin
						  if (x+y ==  sum) 
							$display ("OK:   %3d + %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d + %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==1)
						begin
						  if (x-y ==  sum) 
							$display ("OK:   %3d - %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d - %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==2)
						begin
						  if ((x&y) ==  sum) 
							$display ("OK:   %3d & %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d & %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==3)
						begin
						  if (x|y ==  sum) 
							$display ("OK:   %3d | %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d | %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==4)
						begin
						  if ((x^y) ==  sum) 
							$display ("OK:   %3d ^ %3d = %3d", x, y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL: %3d ^ %3d = %3d", x, y,  sum);
						  end
						end
						if (sel==5)
						begin
						  if (~(y) ==  sum) 
							$display ("OK:  original y %3d should be  %3d amd is %3d", y, ~y, sum);
						  else begin
							pass = 0;	
							$display ("FAIL:original y %3d should be  %3d amd is %3d", y, ~y, sum);
						  end
						end
					  
					end
			  end
		end 
  $display ("TEST STATUS: %s", pass ? "PASS" : "FAIL");
end

// DUT instance
alu i_add_8 
(
 .res         (sum[7:0]),
 .opcode          (sel),
 // Inputs
 .a           (x[7:0]),
 .b           (y[7:0]));

endmodule

