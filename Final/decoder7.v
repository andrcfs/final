module decoder7 (In, Out);
	input [3:0] In;
	output reg[6:0] Out;

	always @(*)	
		case (In)
			4'b0000 : Out = ~7'b0111111; 
			4'b0001 : Out = ~7'b0000110;
			4'b0010 : Out = ~7'b1011011; 
			4'b0011 : Out = ~7'b1001111; 

			4'b0100 : Out = ~7'b1100110; 
			4'b0101 : Out = ~7'b1101101; 
			4'b0110 : Out = ~7'b1111101; 
			4'b0111 : Out = ~7'b0000111; 
 
			4'b1000 : Out = ~7'b1111111; 
			4'b1001 : Out = ~7'b1101111;
			
			4'b1010 : Out = ~7'b1110001;  // now F
			4'b1011 : Out = ~7'b0111110;  // now U
			// 12 remains as C:
			4'b1100 : Out = ~7'b0111001; 
	
			default : Out = ~7'b0000000;
		endcase
		
endmodule