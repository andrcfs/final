module relogio(
    input  wire       clk,
    input  wire       enable,
	 input  wire       reset, 
    output reg [3:0] min,
	 output reg [3:0] seg1,
    output reg [3:0] seg2,
    output reg [3:0] deci,
    output reg [3:0] centi,
    output reg [3:0] milli
);

always @(posedge clk, posedge reset)
begin
    if (reset)
    begin
        milli <= 0;
        centi <= 0;
        deci <= 0;
        seg1 <= 0;
		  seg2 <= 0;
        min <= 0;
    end
    else if (enable&&min!=2)
    begin
        if (milli == 9)
        begin
            milli <= 0;
            if (centi == 9)
            begin
                centi <= 0;
                if (deci == 9)
                begin
                    deci <= 0;
                    if (seg1 == 9)
                    begin
                        seg1 <= 0;
                        if (seg2 == 9)
									 begin
										seg2 <= 0;
										min <= min + 1;
									 end                            
                        else
                            seg2 <= seg2 + 1;
                    end
                    else
                        seg1 <= seg1 + 1;
                end
                else
                    deci <= deci + 1;
            end
            else
                centi <= centi + 1;
        end
        else
            milli <= milli + 1;
    end
end
endmodule