module SIPO(
    input dataeve,
    input dataodd,
    input clk,
    input outt,
    input reset,
    output reg [3:0]outeve,
    output reg [3:0]outodd,
    output reg next1,
    output reg next2
    );
    reg [2:0]counteve=3'b000;
    reg [2:0]countodd=3'b000;
    initial begin
	   outeve=4'b0000;
	   outodd=4'b0000;
	   counteve=3'b000;
	   countodd=3'b000;
	   next1=1'b0;
	   next2=1'b0;
    end
    always @(posedge clk or posedge reset)
    begin
	   if(reset)
	   begin
	      outeve<=4'b0000;
		  outodd<=4'b0000;
	   	  counteve<=3'b000;
		  countodd<=3'b000;
		  next1<=1'b0;
		  next2<=1'b0;
	   end
	   else
	   begin
		  if(!outt)
		  begin
			 if(counteve>4)
			 begin
			     outeve<=outeve;//holds current value
			     next1<=1'b1;
			     
			 end
			 else
			 begin
			     outeve<=outeve>>1'b1;
			     outeve[3]<=dataeve;//fills in new data
			     counteve<=counteve+1'b1;
			 end
		  end
		  else
		  begin
			 if(countodd>3)
			 begin
			     outodd<=outodd;//holds current value
			     next2<=1'b1;
			 end
			 else
			 begin
			     outodd<=outodd>>1'b1;
			     outodd[3]<=dataodd;//fills in new data
			     countodd<=countodd+1'b1;
			 end
		  end
	end
end
endmodule
