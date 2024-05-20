module QPSK(
    input [7:0]data,
    input clk,ld,
    output [7:0]qpskout
    );
    wire [3:0]Sheve,Shodd;
    wire even,odd;
    bitsplitter BS(data,clk,ld,Sheve,Shodd,next1,next2);
    Synchronizer QP(Sheve,Shodd,clk,ld,next1,next2,even,odd);
    finalqpsk qpsk(clk,even,odd,ld,next1,next2,qpskout); 
endmodule
