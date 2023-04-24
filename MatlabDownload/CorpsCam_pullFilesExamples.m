%% Script Description
%  This script provides some examples of how to download files from the
%  website https://coastalimaging.erdc.dren.mil/. Note, do not run script
%  in its entirty (F5); Each example is to be run alone. 

%  Specific collect times for each station are stated in the readMe.txt for
%  each filetype and station.

%  More information about input parameters are in CorpsCams_urlGenerator.m

%  Created: 20220728 by Brittany Bruder


%% Example 1: Download A Single Image
clear all

%User Input
t_in=datenum(2022,9,6,17,0,0); % Date and Time of Collect in datenum format
station='FrfTower'; % Station Name (in readMe.txt).
camera='cxgeo'; % Camera Number
itype='timex'; % Type of product

saveDir=pwd; % Where you want to save file. Currently set to present working directory

% Generate File Name
[CorpsCam_url fname] = CorpsCam_urlGenerator(station,camera,itype,t_in);

% Try to Download file
try
outfilename = websave(fullfile(saveDir,fname),CorpsCam_url);
disp(['Download Completed: ' fname ])
catch
    disp([fname ' not found. Double check collect time and camera number. Check that saveDir exists'])
    % Will make empty file if not existant
    delete(fullfile(saveDir,fname))
end



return
%% Example 2: Download All Camera Images for time
clear all

%User Input
t_in= datenum(2022,9,6,15,0,0);
cnums={'c1','c2','c3','c4'}; % Specify what cameras you want 
station='Lynnhaven'; % Station Name (in readMe.txt).
itype='timex'; % Type of product
saveDir=pwd; % Where you want to save file. Currently set to present working directory

for k=1:length(cnums)
camera=cnums{k};
[CorpsCam_url fname] = CorpsCam_urlGenerator(station,cnums{k},itype,t_in);
FNAME{k}=fname;
URLs{k}=CorpsCam_url;
% Try to Download file
try
outfilename = websave(fullfile(saveDir,fname),CorpsCam_url);
disp(['Download Completed: ' fname ])
saveFlag(k)=1;
catch
    disp([fname ' not found. Double check collect time and camera number. Check that saveDir exists'])
    % Will make empty file if not existant
    delete(fullfile(saveDir,fname))
    % Flag to See if it downloaded
    saveFlag(k)=0;
end
end

% Note saveFlag is a vector that quickly shows what file was saved and what
% was not. Aligns with FNAME and URLs


%% Example 3: Download various itypes for a given time (Note collect time for each must be the same)
clear all

%User Input
t_in= datenum(2022,07,27,13,0,0);
station='FrfTower'; % Station Name (in readMe.txt).
camera='c1'; % Camera Number
ITYPES={'snap','timex','bright'}; % Type of product
saveDir=pwd; % Where you want to save file. Currently set to present working directory

for k=1:length(ITYPES)
itype=ITYPES{k};
[CorpsCam_url fname] = CorpsCam_urlGenerator(station,camera,itype,t_in);
FNAME{k}=fname;
URLs{k}=CorpsCam_url;
% Try to Download file
try
outfilename = websave(fullfile(saveDir,fname),CorpsCam_url);
disp(['Download Completed: ' fname ])
saveFlag(k)=1;
catch
    disp([fname ' not found. Double check collect time and camera number. Check that saveDir exists'])
    delete(fullfile(saveDir,fname))
    saveFlag(k)=0;
    % Will make empty file if not existant
end
end

% Note saveFlag is a vector that quickly shows what file was saved and what
% was not. Aligns with FNAME and URLs


%% Example 4: Download specific image for a camera within a time period
clear all

%User Input
dt=1/24; % Collection Frequency (# hr/24)
t_range= datenum(2022,7,27,11,0,0):dt:datenum(2022,7,27,15,0,0);

station='FrfTower'; % Station Name (in readMe.txt).
camera='c1'; % Camera Number
itype='timex'; % Type of product
saveDir=pwd; % Where you want to save file. Currently set to present working directory

for k=1:length(t_range)
t_in=t_range(k);
[CorpsCam_url fname] = CorpsCam_urlGenerator(station,camera,itype,t_in);
FNAME{k}=fname;
URLs{k}=CorpsCam_url;
% Try to Download file
try
outfilename = websave(fullfile(saveDir,fname),CorpsCam_url);
disp(['Download Completed: ' fname ])
saveFlag(k)=1;
catch
    disp([fname ' not found. Double check collect time and camera number. Check that saveDir exists'])
    % Will make empty file if not existant
    delete(fullfile(saveDir,fname))
    saveFlag(k)=0;
end
end

% Note saveFlag is a vector that quickly shows what file was saved and what
% was not. Aligns with FNAME and URLs


