module registro_senha(
	input wire SET,
	input wire CLR,
	input [6:0] DIN,
	output reg [6:0] DOUT
);

always @(posedge SET or posedge CLR)
begin
if (CLR)
	DOUT = 7'b 0000000;
else
	DOUT <= DIN;
end
endmodule