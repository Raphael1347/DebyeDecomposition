clear
clc
close all
R0=1;

f=logspace(-3,4,1000);

w=f.*(2*pi);

% r=rand(100,1).';
% 
% m=r/sum(r)*rand;
clear r

t=logspace(-5,10,1000).';

% for i=1:numel(w);
% Z(i)=R0*(1-sum(m.*(1-1./(1+1i.*w(i).*t))));
% end
% Zn=(R0-Z)/R0;


[Znr,Zni]=ColeCole(w);

 
% Znr=m*((t*w).^2./(1+(t*w).^2));
% 
% Zni=m*((t*w)./(1+(t*w).^2));


Zn=[Znr Zni].';

clear R0



A1=(t*w).^2./(1+(t*w).^2);
A2=(t*w)./(1+(t*w).^2);
A=[A1 A2].';


mk=lsqnonneg(A,Zn);


Znr2=mk.'*((t*w).^2./(1+(t*w).^2));

Zni2=mk.'*((t*w)./(1+(t*w).^2));




figure(1)

subplot(2,2,1)
plot(Znr,-Zni,'x')
hold on
plot(Znr2,-Zni2)
xlabel('Partie réel de Z*')
ylabel('Partie imaginaire de Z*')

subplot(2,2,2)
Amp=sqrt(Znr.^2+Zni.^2);
Amp2=sqrt(Znr2.^2+Zni2.^2);

semilogx(w,Amp,'x')
hold on
semilogx(w,Amp2)

xlabel('Fréquence angulaire')
ylabel('Amplitude de Z*')


subplot(2,2,3)

Phase=atan(Zni./Znr);
Phase2=atan(Zni2./Znr2);

loglog(w,-Phase,'x')
hold on
loglog(w,-Phase2)

xlabel('Fréquence angulaire')
ylabel('Phase')

% figure(2)
% 
% subplot(2,2,1)
% plot(Znr2,-Zni2)
% xlabel('Partie réel de Z*')
% ylabel('Partie imaginaire de Z*')
% 
% subplot(2,2,2)
% semilogx(f,Amp2)
% xlabel('Fréquence angulaire')
% ylabel('Amplitude de Z*')
% 
% subplot(2,2,3)
% loglog(f,-Phase2)
% 
% xlabel('Fréquence angulaire')
% ylabel('Phase')

