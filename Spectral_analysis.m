% To do the spectral analysis
clc 
clear all
close all
% loading calculated Amplitude spectra of Bouguer Anomaly for some region
X=load("AMP_Spect_P1.txt");
hold on
% setting the scale of axes 
plot(2*pi./X(:,1),log10(X(:,2)),'.-');
% loading the regression lines
Reg1=load("Seg1.txt");
Reg2=load("Seg2.txt");
Reg3=load("Seg3.txt");
Reg4=load("Seg4.txt");
Reg5=load("Seg5.txt");
% generating the model parameters of these regression lines
mdl1 = fitlm(Reg1(:,1),Reg1(:,2));
mdl2 = fitlm(Reg2(:,1),Reg2(:,2));
mdl3 = fitlm(Reg3(:,1),Reg3(:,2));
mdl4 = fitlm(Reg4(:,1),Reg4(:,2));
mdl5 = fitlm(Reg5(:,1),Reg5(:,2));
% storing the model parameters for all lines
C1=mdl1.Coefficients.Estimate;
C2=mdl2.Coefficients.Estimate;
C3=mdl3.Coefficients.Estimate;
C4=mdl4.Coefficients.Estimate;
C5=mdl5.Coefficients.Estimate;
% calculating the depth from following relationship
D1=-(C1(2)*4*pi*log(10))/(4*pi)
D2=-(C2(2)*4*pi*log(10))/(4*pi)
D3=-(C3(2)*4*pi*log(10))/(4*pi)
D4=-(C4(2)*4*pi*log(10))/(4*pi)
D5=-(C5(2)*4*pi*log(10))/(4*pi)
plot(mdl1);
plot(mdl2);
plot(mdl3);
plot(mdl4);
plot(mdl5);
% updating the results manually by marking it on the plot
text(0.6,0.35,"Depth: 2.6080 Km",'FontSize',12);
text(0.17,0.24,"Depth: 5.6476 Km","FontSize",12);
text(0.10,0.65,"Depth: 20.0544 Km","FontSize",12);
text(0.05,1.2,"Depth: 74.7479 Km","FontSize",12);
text(0.02,1.7,"Depth: 75.9506 Km","FontSize",12);
xlabel('Wave No. (rad/km)');
ylabel('Log(A)');
legend('Amplitude Spectrum','data','fit','error bound');
title('Spectral Depth Analysis');
hold off