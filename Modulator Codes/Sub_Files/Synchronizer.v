module Synchronizer(
    input [3:0]dataeve,
    input [3:0]dataodd,
    input clk,reset,next1,next2,
    output reg even,
    output reg odd
    );
    reg [1:0] i;
    reg [7:0]count=8'h00;
    always @(posedge clk)
    begin
        if(!reset)
        begin
            if(next1 && next2)
            begin
                even<=dataeve[i];
                odd<=dataodd[i];
                count<=count+1'b1;
                if (count==51)
                begin
                    i<=i+1;
                    count<=0;
                    if(i==3) i<=0;
                end
            end
            else
            begin
                even<=1'b0;
                odd<=1'b0;
            end
        end
        else
        begin
            even<=0;
            odd<=0;
            i<=0;
        end
    end
endmodule
