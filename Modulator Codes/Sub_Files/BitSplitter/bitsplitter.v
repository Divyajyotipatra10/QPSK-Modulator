module bitsplitter(
    input [7:0]data,
    input clk,
    input ld,
    output [3:0] Sheve,
    output [3:0] Shodd,
    output next1,
    output next2
    );
    wire outpiso;
    wire outtff;
    wire even;
    wire odd;
    PISO sr(data,clk,ld,outpiso);//NRZ L output
    TFFp fdff(clk,ld,outtff);//T flip flop for deciding between even or odd bits
    mux1 eve(outpiso,1'b0,outtff,even);//bit splitter
    mux1 od(1'b0,outpiso,outtff,odd);//bit splitter
    SIPO sr1(even,odd,clk,outtff,ld,Sheve,Shodd,next1,next2);
endmodule
