clear
Fs=1024;
% Read DAQ files in batch
[daqfile,Filename,nFile]=daqbatchread();
% Filtration and Visualization
for iFile=1:1:nFile
    EMG=daqfile{iFile}(:,3); 
    [fEMG,tEMG]=filterIIR(EMG);
    mfEMG=length(fEMG);
    fEMGplot(fEMG,tEMG);
end