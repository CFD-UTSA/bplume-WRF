%%
clearvars;
clc;

%%
Files_directory = './';

fileslist = dir(Files_directory);
nFiles    = size(fileslist,1);

for iFile = 3:nFiles
    filename  = fileslist(iFile).name;
    fileData  = strcat(Files_directory,filename);
    temp0     = importdata(fileData);
    totalRows = size(temp0,1);
    k = 1;    
    for kk = 2:totalRows
        temp1 = temp0{kk,1};
        temp2 = strsplit(temp1,' ');
        j     = 1;
        for i = 2:size(temp2,2)
            data(k,j) = str2double(temp2{1,i});
            j         = j + 1;
        end
        k = k + 1;
        %     fprintf('Processed - %s\n',num2str((kk/totalRows)*100));
    end
    saveFile = strcat('./',filename,'.mat');
    save(saveFile,'data');
    clear data     
end
