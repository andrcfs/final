module dica_logica (
    input set,                 
    input reset,      
	 input [6:0] cont,
    input [6:0] senha_oculta,   
    input [6:0] tentativa,      
    output reg [6:0] dica       
);

    
    reg [2:0] operacao_sorteada; 

    
    always @(posedge set) begin
    
            operacao_sorteada <= cont%6; 
    end

    
    always @(*) begin
        case (operacao_sorteada)
            3'b000: dica = senha_oculta & tentativa;
            3'b001: dica = senha_oculta | tentativa; 
            3'b010: dica = ~(senha_oculta & tentativa); 
            3'b011: dica = ~(senha_oculta | tentativa); 
            3'b100: dica = senha_oculta ^ tentativa; 
            3'b101: dica = ~(senha_oculta ^ tentativa); 
            default: dica = 7'b0; 
        endcase
    end

endmodule