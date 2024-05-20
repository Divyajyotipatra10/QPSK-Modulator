module PISO(
    input [7:0]data,
    input clk,
    input ld,
    output reg dout
    );
    reg [7:0]shftreg;

    initial begin
	   shftreg=8'b00000000;
    end

    always @(posedge clk)
    begin
	   if(ld)
	   begin
		  shftreg<=data;
		  dout<=shftreg[0];
	   end
	   else
	   begin
		  shftreg<=shftreg>>1'b1;
		  shftreg[7]<=1'b0;
		  dout<=shftreg[0];
	   end
    end
endmodule
