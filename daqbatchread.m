
function [daqfile,Filename,nFile]=daqbatchread()
Allfile=dir(fullfile('*.daq'));       
StrAllfile=struct2cell(Allfile);  
Filename=StrAllfile(1,:);        
[~,nFile]=size(Filename);   
jdaq=0;             
for idaq=1:1:nFile
    if strfind(Filename{idaq},'.daq')   
        jdaq=jdaq+1;
        [daqfile{jdaq}]=daqread(Filename{idaq}); 
    end
end