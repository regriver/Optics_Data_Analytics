clear all
load('Test4ProxBlock1.mat');
load('Test4ProxBlock2.mat');
load('Test4ProxBlock3.mat');
load('Test4ProxBlock4.mat');

T1=Test4ProxBlock1;
T2=Test4ProxBlock2;
T3=Test4ProxBlock3;
T4=Test4ProxBlock4;

%Note: you might have to adjust these values to get the optimal graph
fc=[1,6]; %bandpass filter parameters. the first value is for low pass parameter
%Optimal fc =1 for low pass, 1 to 20 for bandpass
pkh=0.01; %minimum peak height for detection
pkd=.5;%minimum distance between peaks for detection
D=2:4;
%How the function is set up:

%[Average period of peaks, Average frequency of peaks]=
%shuntplot(a,b,c,d,e,f,g,h)

%a is the input
%b is the starting value for the series of graphs
%for example: 0 graphs plot from figure 1-4
%c is the cut off frequency
%d enables(1) or disables (0) peak detection
%e is the minimum peak height for detection
%f is the minimum peak distance for detection
%g is the peak points you want to average
%h enables(1) bandpass or enables (0) low pass

%Uncomment the one you want to look at. DO IT ONE AT A TIME

%[avt,avf,avp]=shuntplot(T1,0,fc,1,pkh,pkd,D,0);

%[avt,avf,avp]=shuntplot(T2,1,fc,1,pkh,pkd,D,0);

%[avt,avf,avp]=shuntplot(T3,2,fc,1,pkh,pkd,D,0);

%[avt,avf,avp]=shuntplot(T4,3,fc,1,pkh,pkd,D,0);
