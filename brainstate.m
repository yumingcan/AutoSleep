clear
Fs=1024;
f1=0.5;
f2=60;
tWind=5;
n=512;
deltastart=2;
deltaend=5;
thetastart=6;
thetaend=10;
% Read DAQ files in batch
[daqfile,Filename,nFile]=daqbatchread();
% Filtration and Visualization
for iFile=1:1:nFile
    EEG=daqfile{iFile}(:,1);
    EMG=daqfile{iFile}(:,3); 
    fEEG=filterFIR(filterIIR(EEG),f1,f2);
    [fEMG,tEMG]=filterIIR(EMG);
    mfEMG=length(fEMG);
    fEMGplot(fEMG,tEMG);
    EMGcriteria=input('Please set the EMG criteria:');
    nWind=fix(mfEMG/(Fs*tWind));
    for iWind=1:1:nWind
        wEMG=max(abs(fEMG(Fs*tWind*(iWind-1)+1:Fs*tWind*iWind)));
        wPower=powerfft(fEEG(Fs*tWind*(iWind-1)+1:Fs*tWind*iWind),n);
        wDelta=max(wPower(deltastart:deltaend));
        wTheta=max(wPower(thetastart:thetaend));
        if wEMG > EMGcriteria
           State{iWind,iFile}='W'; 
        elseif wDelta<=wTheta
           State{iWind,iFile}='P';
        else
           State{iWind,iFile}='S';
        end
    end
    xlswrite(strcat('Auto',Filename{iFile}(1:end-4),'.xlsx'),State(1:nWind,iFile));
    % duration
    Tabduration{iFile}=stateduration(tWind,State(1:nWind,iFile));
    % transition
    Tabtrainsition{iFile}=statetrainsition(State(1:nWind,iFile));
end
