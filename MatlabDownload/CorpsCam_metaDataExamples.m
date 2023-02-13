%% Script Description
%  This script provides some examples of how to pull metadata for plotting
%  of CorpsCams Files

%  Specific collect times for each station are stated in the readMe.txt for
%  each filetype and station.

%  More information about input parameters are in CorpsCams_urlGenerator.m

%  Created: 20220728 by Brittany Bruder


%% Example 1: Oblique Image
clear all
fname='20220906T170000Z.FrfTower.c1.timex.jpg'
% Get MetaData
[CorpsCam]= CorpsCam_metaDataReader(fname)
% Load Image
I=imread(fname);
% Show Image
f1=figure;
imshow(I)
title([CorpsCam.Station ':' CorpsCam.Camera ' ' CorpsCam.TimeGMT])


%% Example 2: Geotiff Rectification
clear all

fname='20220906T170000Z.FrfTower.cxgeo.timex.tif'

% Get MetaData
[CorpsCam]= CorpsCam_metaDataReader(fname)
% Load Image
I=imread(fname);


% Plot Via Geospatial Toolbox
[A,R] = readgeoraster(fname);
f1=figure;
mapshow(A,R)
xlabel(['Easting [' CorpsCam.Units ']']);
ylabel(['Northing [' CorpsCam.Units ']']);
title([CorpsCam.Station ' ' CorpsCam.TimeGMT])

% Plot Via Standard matlab using imshow
f2=figure;
e=CorpsCam.WorldLimX(1):CorpsCam.PixResolution:CorpsCam.WorldLimX(2);
n=CorpsCam.WorldLimY(1):CorpsCam.PixResolution:CorpsCam.WorldLimY(2);
imagesc(e,n,flipud(I))
set(gca,'ydir','normal')
axis equal
xlabel(['Easting [' CorpsCam.Units ']']);
ylabel(['Northing [' CorpsCam.Units ']']);
title([CorpsCam.Station ' ' CorpsCam.TimeGMT])



%% Example 3: Local Rectification
clear all

fname='20220906T170000Z.FrfTower.cx.timex.jpg'

% Get MetaData
[CorpsCam]= CorpsCam_metaDataReader(fname)
% Load Image
I=imread(fname);


% Plot Via Standard matlab in Imaging
f2=figure;
x=CorpsCam.LocalLimX(1):CorpsCam.PixResolution:CorpsCam.LocalLimX(2);
y=CorpsCam.LocalLimY(1):CorpsCam.PixResolution:CorpsCam.LocalLimY(2);
imagesc(x,y,flipud(I))
set(gca,'ydir','normal')
axis equal
xlabel(['X [' CorpsCam.Units ']']);
ylabel(['Y [' CorpsCam.Units ']']);
title([CorpsCam.Station ' ' CorpsCam.TimeGMT])