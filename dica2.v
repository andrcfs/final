module dica2(
    input [6:0] SW,  
    input enter,    
    output reg [6:0] LEDR   
);
parameter [6:0] 
   senha1 = 7'b0000000,
   senha2 = 7'b0000001,
   senha3 = 7'b1010101;

reg [2:0] count;
          
always @(posedge enter)
begin
    count <= 3'b000;
    if(SW[0]==senha1[0]) count <= count+1;
    if(SW[1]==senha1[1]) count <= count+1;
    if(SW[2]==senha1[2]) count <= count+1;
    if(SW[3]==senha1[3]) count <= count+1;
    if(SW[4]==senha1[4]) count <= count+1;
    if(SW[5]==senha1[5]) count <= count+1;
    if(SW[6]==senha1[6]) count <= count+1;
    case(count)
        3'd0: LEDR <= 7'b0000000;
        3'd1: LEDR <= 7'b0000001;
        3'd2: LEDR <= 7'b0000011;
        3'd3: LEDR <= 7'b0000111;
        3'd4: LEDR <= 7'b0001111;
        3'd5: LEDR <= 7'b0011111;
        3'd6: LEDR <= 7'b0111111;
        3'd7: LEDR <= 7'b1111111;
        default: LEDR <= 7'b0000000;
    endcase
end

endmodule
