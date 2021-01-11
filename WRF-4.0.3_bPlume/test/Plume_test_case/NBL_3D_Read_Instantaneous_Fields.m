%% 
% Clear workspace and memory
clearvars;
clc;

%%
% Prior to running this script, move all the high-frequency files to a folder

Files_directory = './High-Frequency/';

% get all the files in the directory
fileslist = dir(Files_directory);

% get number of files
nFiles    = size(fileslist,1);

% Check the below start and end indices
% On Linux OS of TACC Stampede, first two entries of filelist are dummies . and ..
% To confirm, run line 8 and see the fileslist array. 
% If the high-frequency files start at 1st entry, change the below line to 
% for iFile = 1:nFiles

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
    saveFile = strcat('./High-Frequency/',filename,'.mat');
    save(saveFile,'data');
    clear data     
end
