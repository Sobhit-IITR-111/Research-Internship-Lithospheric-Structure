% To compare computed/theoretical and observed Bouguer coherence
% closing all commands and closing all images
clc
clear all
close all
% loading Bouguer coherence and bouguer admittance computed data
X=load("BC_pamir_150_dataset_NCP5.txt");
Y=load("BAd_pamir_150_dataset_P5.txt");
%X = load("BA_P1_3CCohe.txt");
%Y = load("BA_P1_3Admitt.txt");
%X =load("BA_P1_2Cohe.txt");
%Y = load("BA_P1_2Admitt.txt");
%X =load("BA_P1_3Cohe.txt");
%Y = load("BA_P1_3Admitt.txt");
%X =load("BA_P1_4Cohe.txt");
%Y = load("BA_P1_4Admitt.txt");
%X =load("BA_P1_5Cohe.txt");
%Y = load("BA_P1_5Admitt.txt");
%Z = load("FAAdmitt.txt");

% calling coheref2() function to compute variables on left
[G2b,k,l,Zb,Zf]=coheref2();
% setting a configuration for Subplot and starting code frame for 1 subplot
% i.e. Bouguer Coherence
subplot(1,2,1);
hold on
% plotting observed Bouguer coherence
P1=errorbar(2*pi*1000*X(:,1),X(:,2),X(:,3),'.');
P1.Color='k';
plot((k*1000),G2b,'r');

% setting the x axis and y axis limits in the plot
yls=[-0.025 1.025];
ylim(yls)
xlim([0 0.2])
% labeling the axes, title and legend
xl(1)=xlabel('wave No. (rad/km)');
yl(1)=ylabel('coherence \gamma_f^2');
title("Bouguer Coherence")
legend('Observed','Theoretical (Te=12)');
hold off
% code frame for 2 subplot i.e Bouguer Admittance
subplot(1,2,2);
hold on
P2=errorbar(2*pi*1000*Y(:,1),Y(:,2),Y(:,3),'.');
P2.Color='k';
plot((k*1000),Zb,'r');
% setting the limits of axes in the plot
yls=[-0.18 0.2];
ylim(yls)
xlim([0 0.2])

% labeling the axes
xl(1)=xlabel('wave No. (rad/km)');
yl(1)=ylabel('Admittance (in mgal/m)');
title("Bouguer Admittance")
legend('Observed','Theoretical');
hold off

% if you want to plot Free Air Admittance just load FAAdmittance file in Z
%subplot(3,1,3);
%hold on
%errorbar(Z(:,1),Z(:,2),Z(:,3),'k');
%semilogx(k*1000,Zf,'r');
%p=p(:)';

%set(gca,'xdir','rev')

%yls=[0 0.15];
%ylim(yls)
%xlim([0.0025 0.1])

%xl(1)=xlabel('Wavelength (km)');
%yl(1)=ylabel('Bouguer Anomaly/Topography Coherence \gamma^2');
%xl(1)=xlabel('wave No. (rad/km)');
%yl(1)=ylabel('Admittance (in mgal/m)');
%title("Free Air Admittance")
%legend('Observed','Theoretical');
%errorbar(Y(:,1),Y(:,2),Y(:,3));
%hold off
