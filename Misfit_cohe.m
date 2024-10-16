% To compute the misfit function and giving out the EET and loading
% fraction value which gives the lowest value of Misfit function and this
% for multiple regions
clc
clear all
close all
% loading bouguer coherence data for multiple profile region
x=["BC_pamir_150_dataset_CP1.txt" "BC_pamir_150_dataset_CP2.txt" "BC_pamir_150_dataset_CP3.txt" "BC_pamir_150_dataset_CP4.txt" "BC_pamir_150_dataset_NCP5.txt"];
%x=["BC_pamir_dataset_P1.txt" "BC_pamir_dataset_P2.txt" "BC_pamir_dataset_P3.txt" "BC_pamir_dataset_P4.txt" "BC_pamir_dataset_P5.txt"];
%x=["BCC_pamir_250_dataset_250_P1.txt" "BCC_pamir_250_dataset_250_P2.txt" "BCC_pamir_250_dataset_250_P3.txt" "BCC_pamir_250_dataset_250_P4.txt" "BCC_pamir_250_dataset_250_P5.txt"];
%x=["BC_pamir_dataset_150-450_CP1.txt" "BC_pamir_dataset_150-450_CP2.txt" "BC_pamir_dataset_150-450_CP3.txt" "BC_pamir_dataset_150-450_CP4.txt" "BC_pamir_dataset_150-450_CP5.txt"];
%x=["SCBA_P1_1BWFCohe.txt" "SCBA_P1_2BWFCohe.txt" "SCBA_P1_3BWFCohe.txt" "SCBA_P1_4BWFCohe.txt" "SCBA_P1_5BWFCohe.txt"];
%x=["SCBA_P1_1FCohe.txt" "SCBA_P1_2FCohe.txt" "SCBA_P1_3FCohe.txt" "SCBA_P1_4FCohe.txt" "SCBA_P1_5FCohe.txt"];
%x = [ "BA_P1_1CCohe.txt" "BA_P1_2CCohe.txt" "BA_P1_3CCohe.txt" "BA_P1_4CCohe.txt" "BA_P1_5CCohe.txt" ];
%x = [ "BA_P1_1Cohe.txt" "BA_P1_2Cohe.txt" "BA_P1_3Cohe.txt" "BA_P1_4Cohe.txt" "BA_P1_5Cohe.txt" ];
%x="SCBA_P1FCohe.txt";

Te = (0:1000:70000); % Elastic thickness in meters
F2 = (0:0.05:1); % Loading fractions
r = 0; % Initial-load correlation coefficient
g = 9.81;
rc=2670;
drho=630;
%T=45000;
g=9.81;
E=1.4e11;
v=0.25;
G=6.67430e-11;
Parameters=[];
% outer loop  if for region
for q=1:length(x)
    % once it loads the particular region
    X=load(x(q));
    Misfit=[];
    % this loop is to iterate over many loading fractions
for f=1:length(F2)
    % once it fix the loading fraction
    f2=F2(f);
    % this loop is to iterate over many EET values
    for i=1:length(Te)
    Misfit(f,i)=0;
    % once it fix the EET value
    te=Te(i);
    % calculates fluxural rigidity
    D=(E*te^3)/(12*(1-v^2));
    count=0;
    for u=1:length(X(:,1))
    j=X(u,1)*2*pi;
    if(j>0.0001)
        break;
    end
  count=count+1;
  KK4=(j^4);
  xai=1+D*KK4/drho/g;
  phi=1+D*KK4/rc/g;
  beta=rc/xai/drho;
  % calculation for bouguer coherence
  Ctop=(xai+f2*rc^2/drho^2*phi-r*sqrt(f2)*rc/drho*(phi*xai+1))^2;
  Cbot1=xai^2+f2*rc^2/drho^2-2*r*sqrt(f2)*rc/drho*xai;
  Cbot2=1+f2*rc^2/drho^2*phi^2-2*r*sqrt(f2)*rc/drho*phi;
  % See Forsyth Eq. (25)
  G2b=(Ctop/Cbot1/Cbot2);
  % using L2 norm for minimization
  Misfit(f,i)=Misfit(f,i)+(X(count,2)-G2b)^2;
    end
    end
end
[A,row]=min(Misfit);
[GM,col]=min(A);
Parameters(q,:)=[Te(col)/1000 F2(row(col))];
hold on
    ylim([0 0.1]);
    plot(Te/1000,Misfit(row(col),:),'-','Color','k');
    xlabel("Te(in km)");
    ylabel("Misfit");
end
% displaying the output results
Parameters

%[row,col]=find(min(Misfit)==Misfit);
%Misfit
  % Forsyth Eqs. (3) and (6)
  

  % Should you ever need to AVERAGE you would need to average the
  % elements in the numerator and the denominator separately  
  % Olhede and Simons, Eq. (64)
 