function Z = ColeCole( w )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
Zo=1000;

m1=0.25;
m2=0.75;
c1=0.5;
c2=1;
t1=10.^-2;
t2=10.^-5;

z1=m1.*(1-1./(1+(1i.*w.*t1).^c1));

z2=m2.*(1-1./(1+(1i.*w.*t2).^c2));


Z=Zo.*(1-z1-z2);



end

