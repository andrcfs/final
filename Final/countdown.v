module countdown(
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
        min <= 5;

    end
    else if(min==0 && seg2==0 && seg1==0 && deci==0 && centi==0 && milli==0)
    begin
        min <= 4'hA;    // F
        seg2 <= 4'hB;   // U
        seg1 <= 4'hC;   // C
        deci <= 4'hC;   // C
        centi <= 4'h0;  // blank
        milli <= 4'h0;  // blank
    end
    else if (enable && (min != 0 || seg2 != 0 || seg1 != 0 || deci != 0 || centi != 0 || milli != 0))
    begin
        if (milli == 0)
        begin
            milli <= 9;
            if (centi == 0)
            begin
                centi <= 9;
                if (deci == 0)
                begin
                    deci <= 9;
                    if (seg1 == 0)
                    begin
                        seg1 <= 9;
                        if (seg2 == 0)
                        begin
                            seg2 <= 5;
                            min <= min - 1;
                        end
                        else
                            seg2 <= seg2 - 1;
                    end
                    else
                        seg1 <= seg1 - 1;
                end
                else
                    deci <= deci - 1;
            end
            else
                centi <= centi - 1;
        end
        else
            milli <= milli - 1;
    end
end
endmodule
