function varargout=coheref2()
% COHEREF2(infl,onfl,land)
%
% Expected coherence from Forsyth (1985)
% One elastic thickness, several loading ratios.
%
% Forsyth (1985), Figure 8.
%
% OUTPUT:
%
% Lots of handle variables
%
% See also: ADMITR, ADMITB, ADMITF2, COHERETE
%
% Last modified by fjsimons-at-alum.mit.edu, 03/07/2012

% remember forsyth function works only for one vector at a time i.e. either
% Te(EET) vector or f2(loading fraction) vector
Te = 12000; %(10000:5000:70000); % Elastic thickness in meters
f2 = 0.05;%(0: 0.05: 1); % Loading fractions
r = 0; % Initial-load correlation coefficient
%zm = 35000; % Depth to the interface in meters
%D1 = 2670; % Density contrast at the surface interface
%D2 = 630; % Density contrast at the subsurface interface
g = 9.81; % Gravitational acceleration in m/s²
lambda=linspace(10,2000,1000)*1000;
rc=2670;
drho=630;
T=45000;
g=9.81;
xver=0;
% Do the calculations by calling forsyth function
[G2b,k,l,Zb,Zf]=forsyth(Te,lambda,f2,r,rc,drho,T,g,xver);

% ignore the below comments
%k=2*pi./lambda;
% Make the plot, wavelength in km
%k = logspace(-3, -0.8, 200) / 1000; % Wavenumbers in rad/m
%pltit = 1; % Plot the results
%defval('infl',1)
%defval('onfl',1)

% Elastic thickness [m]
%Te=40*1000;

% Loading ratios
%f2=[0.1 0.5 1 2 5];

% Initial-loading correlation coefficient
%r=0;

% Wavelengths [m]

%subplot(2,1,1);

%set(p,'linew',2)

%post=[0.3200    0.40  % 0.1
      %0.3300    0.45  % 0.5
      %0.3400    0.50  % 1
      %0.3500    0.55  % 2
      %0.3600    0.60  % 5
     % 0.0400    0.04];

%post(1:5,1)=post(1:5,1)-0.05;
  
%hold on
%b=gca;
%d=axes;
%tbb=0.015*infl;
%tbx=0.03*onfl;
%fb=fillbox([post(1:end-1,1)-tbx post(1:end-1,1)+tbx post(1:end-1,2)+tbb post(1:end-1,2)-tbb],'w');
%hold on
%fb=[fb ; fillbox([post(end,1)-tbx/onfl post(end,1)+tbx/onfl post(end,2)+tbb*1.25 post(end,2)-tbb*1.25],'w')];
%axes(d)
%axis([0 1 0 1])
%set(d,'color','none')
%noticks(d)
%nolabels(d)

%for index=1:length(f2)
%  t(index)=text(post(index,1),post(index,2),num2str(f2(index)));
%end
%t(index+1)=text(post(index+1,1),post(index+1,2),'f^2');

%set(t,'horizontala','center')
%
%set(d,'position',get(b,'position'))

%longticks(b)

%set(b,'XTickLabel',[10 100 1000])

%set([gca xl yl],'fonts',12)

%defval('land',1)
%if land==1
  %fig2print(gcf,'landscape')
  %figdisp
%end

varns={G2b,k,l,Zb,Zf};
varargout=varns(1:nargout);


