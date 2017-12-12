% clear all
load('Test3RegFlow1.mat');
load('Test3RegFlow2.mat');
load('Test3RegFlow3.mat');
load('Test3RegFlow4.mat');
load('Test3RegFlow5.mat');

T1=Test3RegFlow1;
T2=Test3RegFlow2;
T3=Test3RegFlow3;
T4=Test3RegFlow4;
T5=Test3RegFlow5;

Set=[T1,T2,T3,T4,T5];

%Regular Flow 1
figure(1)
L=length(T1);
samples=0:L-1;
Fs=5000;
t=samples/Fs;
plot(t,T1)
title('Unfiltered Regular Flow Signal 1');
xlabel('Time (s)');
ylabel('Voltage (V)');

f=Fs*(0:(L/2))/L;

Y=fft(T1);
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
figure(2)
plot(f,P1);
axis([0 400 0 0.06]);
title('FFT of Signal');
xlabel('f (Hz)');
ylabel('Magnitude');

fc=[0.6,50];
[b,a]=butter(3,fc/(Fs/2),'bandpass');
y=filter(b,a,T1);

figure(3)
plot(t,y);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Voltage (V)');

peakdis=1*Fs;
figure(4)
[pks,locs]=findpeaks(y,'MinPeakHeight',0.4,'MinPeakDistance',peakdis);
plot(t,y,t(locs),pks,'or');
period=locs/Fs;
title('Filtered Signal with Peak Locations');
xlabel('Time (s)');
ylabel('Voltage (V)');

persig=period(2:3);

i=1;
newsig=[];
while i<=length(persig)-1;
    t_int=persig(i+1)-persig(i);
    newsig=[newsig t_int];
    i=i+1;
end
avsigtime=mean(newsig);
avsigfre=1/avsigtime;
% subplot(3,3,1);
% plot(Test3RegFlow1);
% subplot(3,3,2);
% plot(Test3RegFlow2);
% subplot(3,3,3);
% plot(Test3RegFlow3);
% subplot(3,3,4);
% plot(Test3RegFlow4);
% subplot(3,3,5);
% plot(Test3RegFlow5);

% figure(2)
% title('Proximal Blockages induced at 5 seconds');
% subplot(2,2,1);
% plot(Test4ProxBlock1);
% subplot(2,2,2);
% plot(Test4ProxBlock2);
% subplot(2,2,3);
% plot(Test4ProxBlock3);
% subplot(2,2,4);
% plot(Test4ProxBlock4);
% 
% figure(3);
% title('Distal Blockages induced at 5 seconds');
% subplot(1,2,1);
% plot(Test5DistBlock1);
% subplot(1,2,2);
% plot(Test5DistBlock2);