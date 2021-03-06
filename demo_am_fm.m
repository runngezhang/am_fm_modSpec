%%
clear all
%addpath(genpath('.........../voicebox'));
addpath gaborfilterbank/


%declare a variable containing main information for filter bank
filB.Gabor= 1; %1 if compute features using gabbor filter bank, 0 with gammabank
filB.A=0; %num and den of gama bank
filB.B=0; 
filB.nfilt=27; %number of filters
filB.gd=0;    %group delay for the gama-bank, may be useful 
filB.nTaps=256; %number of points for the gabor filterbank
filB.e_rms_bw=160; %rms 
filB.scale='m'; %frequency scale for the filterbank, 'm' fr mel, 'e' for erb

FR=[100 7000]; %frequency range to compute the features
FS=16e3;
[s,fs]=audioread('frf04_s09_solo.wav');
if fs~=16e3
    s =resample(s, 16e3, fs); %resample          
end
feats=all_feats(s,filB,FS,FR);
%WIF is a matrix, each row is an observation and only contains features
%from active frames, all frames without vocal activity are eliminated

figure
subplot(211), plot(feats.WIF)
subplot(212), plot(feats.MHEC)