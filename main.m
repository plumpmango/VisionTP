CONESG = double(imread('conesgauche.pgm'));
CONESD = double(imread('conesdroite.pgm'));
Percent = 1;

%R1 = rect(CONESG);
%R1 = magic(10);
%test
%R2 = nonmax(R1,3);

%indices des R sup ou égale à un seuil
%[I,J] = select1(R2,Percent);

%indices des NbPoints d'intérets
%[I,J] = select2(R2,6);

%%%%Test sur exemple fourni
SigmaDerivation = 1;
SigmaIntegration = 2;
Method = 'Harris-Plessey';
WindowSize = 7;
Percent = 1;
%Construire R
Im = double(imread('cameraman.tif'));
R = response(Im,SigmaDerivation,SigmaIntegration,Method);
R = nonmax(R,WindowSize);
[I,J] = select1(R,Percent);
figure; im(Im); plotpoints(I,J);