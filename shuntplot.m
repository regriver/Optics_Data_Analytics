function [avsigtime,avsigfre,avsigpeak]=shuntplot(input,graph,fc,button,pkheight,pkdistance,bound,sel)
v=(graph*5)+1;
figure(v)
L=length(input);
samples=0:L-1;
Fs=5000;
t=samples/Fs;
plot(t,input)
title('Unfiltered Signal');
xlabel('Time (s)');
ylabel('Voltage (V)');

f=Fs*(0:(L/2))/L;

Y=fft(input);
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
figure(v+1)
plot(f,P1);
axis([0 400 0 0.06]);
title('FFT of Signal');
xlabel('f (Hz)');
ylabel('Magnitude');

if sel==1;
[b,a]=butter(3,fc/(Fs/2),'bandpass');
y=filter(b,a,input);
end

if sel==0;
[b,a]=butter(3,fc(1)/(Fs/2),'low');
y=filter(b,a,input);
end

figure(v+2)
plot(t,y);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Voltage (V)');

if button==1;
peakdis=pkdistance*Fs;
figure(v+3)
[pks,locs]=findpeaks(y,'MinPeakHeight',pkheight,'MinPeakDistance',peakdis);
period=locs/Fs;

persig=period(bound);

plot(t,y,t(locs(bound)),pks(bound),'or');

title('Filtered Signal with Peak Locations');
xlabel('Time (s)');
ylabel('Voltage (V)');






i=1;
newsig=[];
while i<=length(persig)-1;
    t_int=persig(i+1)-persig(i);
    newsig=[newsig t_int];
    i=i+1;
end
avsigtime=mean(newsig);
avsigfre=1/avsigtime;
avsigpeak=mean(pks(bound));
end
if button==0;
    
avsigtime=0;
avsigfre=0;
avsigpeak=0;
end

Y=fft(y);
P2=abs(Y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
figure(v+4)
plot(f,P1);
axis([fc(1)-4 fc(2)+4 0 0.04]);
title('FFT of Filtered Signal');
xlabel('f (Hz)');
ylabel('Magnitude');

end