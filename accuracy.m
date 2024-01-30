clear
Allfile=dir(fullfile('*.xlsx'));       
StrAllfile=struct2cell(Allfile);  
Filename=StrAllfile(1,:);        
[~,nFile]=size(Filename);   
jxlsx=0;             
for ixlsx=1:1:nFile
    if strfind(Filename{ixlsx},'.xlsx')   
        jxlsx=jxlsx+1;
        [xlsxfile{jxlsx}]=importdata(Filename{ixlsx}); 
    end
end
for iFile=1:1:nFile/2
    mannual=xlsxfile{iFile};
    auto=xlsxfile{iFile+nFile/2};
    index=cellfun(@strcmp, mannual, auto);
    stat=tabulate(index);
    accu(iFile)=stat(2,3);
end