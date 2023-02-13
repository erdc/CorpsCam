function [CHLci_url fname] = CHLci_urlGenerator(station,camera,itype,t_in)

%% Function Description
%  Function will provide the url for desired CHL Coastal Imaging product on
%  the website https://coastalimaging.erdc.dren.mil/. An example of its use
%  to batch download files is CHLci_pullFilesExamples.m. Note, just because
%  this file generates a name, does not mean it exists. 

%  Available Stations and products are found in readMe.txt

%  Created: 20220729 by Brittany Bruder


%% User Inputs_____________________________________________________________

% t_in -The time of interest in UTC MATLAB Datenum format. See schedule of 
%       collects for given station in readMe.txt. No need to add the sec 
%       addtion typically associated with image products.

% itype - The type of file to download. File types available for each 
%         stationare listed for a given station in readMe.txt. Input is a 
%         string and can be 
%
%         ____Image Products____
%         'snap' 
%         'timex' 
%         'bright'
%         'dark'
%         'var'
%         'rundark'
%
%         ____Analysis Products____
%         'cBathy'
%
%         ____Timestacks (only available for cx)____
%         'mBW'
%         'runupY' where Y is alongshore coordinate
%         'vbarX'  where X is cross-shore coordinate
%
%         ____Raw____ (not available for cx)
%         'ras'

% station - This is the station name, i.e. head directory seen on 
%           https://coastalimaging.erdc.dren.mil/. It should be a string
%           that matches the directory name. Available Stations listed in
%           readMe.txt


% camera  - This is the camera of the image to be downloaded. It should be
%           a string 'cn' where n is the camera number. Numbers will pull
%           oblique images where the entry 'cx' will provide a georectified
%           image products. Number of cameras  and grids available in 
%           readMe.txt.
%




%% Function Outputs________________________________________________________
% CHLci_url - A string containing the url to download a given file. Note it
%             is not garunteed this file exists.

% fname     - A string with the filename

%% Define Base URL
base='https://coastalimaging.erdc.dren.mil/';

%% Adjust Parameters Based on File itype

% If an oblique, the file is a jpg
if strcmp(itype,'snap')==1 | strcmp(itype,'var')==1 | strcmp(itype,'timex')==1 | strcmp(itype,'bright')==1 | strcmp(itype,'dark')==1 | strcmp(itype,'rundark')==1 & strcmp(camera,'cx')==0    
ftype='jpg';
end

% If a rectified product, it is a tif file
if isempty(strfind(camera,'cxgeo'))==0  
ftype='tif';
end




%% Create Strings Dependent on Time

% Create datetime structure from t_in
tvec=datevec(t_in);
t=datetime(tvec);

tstr1=datestr(tvec,'yyyy_mm_dd');
tstr2=datestr(tvec,'yyyymmddTHHMMSSZ');

%% Build File Name
fname=strcat(tstr2,'.',station,'.',camera,'.',itype,'.',ftype);

%% Build Directory Structure
% Obliques
if strcmp(ftype,'jpg') & isempty(strfind(camera,'cx'))==1
ds=strcat(station,'/Raw/Obliques/',camera,'/',tstr1,'/'); 
else
ds=strcat(station,'/Processed/Orthophotos/',camera,'/',tstr1,'/'); 
end

%% Build url
CHLci_url=strcat(base,ds,fname);


