module finalqpsk(
    input clk,dataeve,dataodd,reset,next1,next2,
    output reg [7:0]avgout
    );
    wire [7:0]sineout,cosout;
    sinewave Seve(clk,dataeve,reset,next1,next2,sineout);
    coswave Codd(clk,dataodd,reset,next1,next2,cosout);
    always @(posedge clk)
    begin
        avgout=(sineout+cosout);
    end
endmodule
