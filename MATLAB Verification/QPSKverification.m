clc;
clear;
t=0:pi/26:2*pi;
data=input("Enter 8 bit vector");
x=[];
y=[];
for i=1:(length(t)-1)
    x=[x sin(t(i))];
    y=[y cos(t(i))];
end
%even and odd splitter
i=1;
even=[];
while i<=length(data)
    even=[even data(i)];
    i=i+2;
end
j=2;
odd=[];
while j<=length(data)
    odd=[odd data(j)];
    j=j+2;
end
disp(even);
disp(odd);
i=4;
sineve=[];
cosodd=[];
while i>=1
   if even(i)==1
       sineve=[sineve x];
   else
       sineve=[sineve (-1)*x]; 
   end
   if odd(i)==1
       cosodd=[cosodd y];
   else
       cosodd=[cosodd (-1)*y];
   end
   i=i-1;
end
qpsk=(sineve+cosodd)/2;
subplot(3,1,1);
plot(sineve);
subplot(312);
plot(cosodd);
subplot(313);
plot(qpsk);
