module sinewave(
    input clk,data,reset,next1,next2,
    output reg [7:0]sineout
    );
    integer i,j;
    reg [7:0]sine[0:51];
    initial begin
        sine[0]=0; sine[1]=9; sine[2]=18; sine[3]=27; sine[4]=36; sine[5]=44; sine[6]=51; sine[7]=58; sine[8]=64; 
        sine[9]=69; sine[10]=73; sine[11]=75; sine[12]=77; sine[13]=78; sine[14]=77; sine[15]=75; sine[16]=73; sine[17]=69;
        sine[18]=64; sine[19]=58; sine[20]=51; sine[21]=44; sine[22]=36; sine[23]=27; sine[24]=18; sine[25]=9; sine[26]=0;
        sine[27]=-9; sine[28]=-18; sine[29]=-27; sine[30]=-36; sine[31]=-44; sine[32]=-51; sine[33]=-58; sine[34]=-64; 
        sine[35]=-69; sine[36]=-73; sine[37]=-75; sine[38]=-77; sine[39]=-78; sine[40]=-77; sine[41]=-75; sine[42]=-73;
        sine[43]=-69; sine[44]=-64; sine[45]=-58; sine[46]=-51; sine[47]=-44; sine[48]=-36; sine[49]=-27; sine[50]=-18;
        sine[51]=-9; i=0;j=26; 
    end
    always @(posedge clk)
    begin
        if(reset)
        begin 
            sineout=sine[0];
            i=0;j=26;
        end
        else
        begin
        if (next1 && next2)
        begin
            if(data)//when data is 1 we get original sine wave
            begin
                sineout=sine[i];
                i=i+1;
                if(i==52) i=0;
            end
            else//when data is 0(-1 in bipolar) we get 180 degree phase shifted wave
            begin
                sineout=sine[j];
                j=j+1;
                if(j==52) j=0;
            end
        end
        else sineout=sine[0];
        end
    end
endmodule
