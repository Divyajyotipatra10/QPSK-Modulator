module coswave(
    input clk,data,reset,next1,next2,
    output reg [7:0]cosineout
    );
    integer i,j;
    reg [7:0]cosine[0:51];
    initial begin
        cosine[0]=78; cosine[1]=77; cosine[2]=75; cosine[3]=73; cosine[4]=69; cosine[5]=64; cosine[6]=58; cosine[7]=51; cosine[8]=44; cosine[9]=36; 
        cosine[10]=27; cosine[11]=18; cosine[12]=9; cosine[13]=0; cosine[14]=-9; cosine[15]=-18; cosine[16]=-27; cosine[17]=-36; cosine[18]=-44; 
        cosine[19]=-51; cosine[20]=-58; cosine[21]=-64; cosine[22]=-69; cosine[23]=-73; cosine[24]=-75; cosine[25]=-77; cosine[26]=-78; cosine[27]=-77;
        cosine[28]=-75; cosine[29]=-73; cosine[30]=-69; cosine[31]=-64; cosine[32]=-58; cosine[33]=-51; cosine[34]=-44; cosine[35]=-36; cosine[36]=-27;
        cosine[37]=-18; cosine[38]=-9; cosine[39]=0; cosine[40]=9; cosine[41]=18; cosine[42]=27; cosine[43]=36; cosine[44]=44; cosine[45]=51; 
        cosine[46]=58; cosine[47]=64; cosine[48]=69; cosine[49]=73; cosine[50]=75; cosine[51]=77; i=0; j=26;
    end
    always @(posedge clk)
    begin
        if(reset)
        begin 
            cosineout=0;
            i=0;j=26;
        end
        else
        begin
        if (next1 && next2)
        begin
            if(data)//when data is 1 we get original cosine wave
            begin
                cosineout=cosine[i];
                i=i+1;
                if(i==52) i=0;
            end
            else//when data is 0(-1 in bipolar) we get 180 degree phase shifted wave
            begin
                cosineout=cosine[j];
                j=j+1;
                if(j==52) j=0;
            end
        end
        else cosineout=0;
        end
    end
endmodule
