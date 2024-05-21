module test(

    );
    reg [7:0]data;
    reg clk,ld;
    wire [7:0]qpskout;
    QPSK dut(data,clk,ld,qpskout);
    initial begin
        clk<=1'b0;
        forever #10 clk<=~clk;
    end
    initial begin
        ld<=1'b1;
        data<=8'b00101100;//0110//0010 //modifiable value. Supports 8 bit data
        #25
        ld<=1'b0;
        #9000
        $stop;
    end
endmodule
