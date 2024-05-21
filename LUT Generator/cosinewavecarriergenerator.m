clc;
clear;
t=0:pi/26:2*pi;
x=[];
for i=1:length(t)
    x=[x int32(fix(cos(t(i))*10000/128))];%8bit signed output
end
disp(x)
for i=1:length(t)
    fprintf("cosine[%d]=%d; ",(i-1),x(i))
end
