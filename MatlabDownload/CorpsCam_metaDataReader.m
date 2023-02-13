%% Function Description
%  Given a filepath (fname), pulls metadata from EXIF data. Currently works
%  for local rectifications, obliques, and world rectifcations. Note if
%  EXIF writing function changes, this will have to as well. 

%  Created by B.Bruder 2022/07/31


function [CorpsCam]= CorpsCam_metaDataReader(fname)


%% Pull Information
I=imfinfo(fname);
try
A=I.DigitalCamera.UnknownTags;
numVal=length(A);

%% Oblique

if length(A)==37
CorpsCam.Station=A(1).Value;
CorpsCam.Product=A(2).Value;
CorpsCam.TimeGMT=A(3).Value;
CorpsCam.Units=A(4).Value;
CorpsCam.LocalOriginWorldX=A(5).Value;
CorpsCam.LocalOriginWorldY=A(6).Value;
CorpsCam.LocalAngle=A(7).Value;
CorpsCam.WorldCoordSysH_epsg=A(8).Value;
CorpsCam.WaterLevel=A(9).Value;
CorpsCam.WaterLevelSource=A(10).Value;
CorpsCam.WorldCoordSysV_epsg=A(11).Value;
CorpsCam.ExtrinsicFiles=A(12).Value;
CorpsCam.DateProcessed=A(13).Value;
CorpsCam.Camera=A(14).Value;
CorpsCam.ExtrinsicsWorld=[A(15).Value A(16).Value A(17).Value A(18).Value A(19).Value A(20).Value] ;
CorpsCam.ExtrinsicsLocal=[A(21).Value A(22).Value A(23).Value A(24).Value A(20).Value A(26).Value] ;
CorpsCam.Intrinsics=[A(27).Value A(28).Value A(29).Value A(30).Value A(31).Value A(32).Value A(33).Value A(34).Value A(35).Value A(36).Value A(37).Value A(37).Value] ;
end

%% Local Rectification

if length(A)==17
CorpsCam.Station=A(1).Value;
CorpsCam.Product=A(2).Value;
CorpsCam.TimeGMT=A(3).Value;
CorpsCam.Units=A(4).Value;
xlm=strsplit(A(5).Value);
CorpsCam.LocalLimX=[str2num(xlm{1}) str2num(xlm{2})];
xlm=strsplit(A(6).Value);
CorpsCam.LocalLimY=[str2num(xlm{1}) str2num(xlm{2})];
CorpsCam.PixResolution=A(7).Value;
CorpsCam.LocalOriginWorldX=A(8).Value;
CorpsCam.LocalOriginWorldY=A(9).Value;
CorpsCam.LocalAngle=A(10).Value;
CorpsCam.WorldCoordSysH_epsg=A(11).Value;
CorpsCam.WaterLevel=A(12).Value;
CorpsCam.WaterLevelSource=A(13).Value;
CorpsCam.WorldCoordSysV_epsg=A(14).Value;
CorpsCam.GridFIle=A(15).Value;
CorpsCam.ExtrinsicFiles=A(16).Value;
CorpsCam.DateProcessed=A(17).Value;
end


%% World Rectification

if length(A)==14
CorpsCam.Station=A(1).Value;
CorpsCam.Product=A(2).Value;
CorpsCam.TimeGMT=A(3).Value;
CorpsCam.Units=A(4).Value;
xlm=strsplit(A(14).Value);
CorpsCam.WorldLimX=[str2num(xlm{1}) str2num(xlm{2})];
xlm=strsplit(A(13).Value);
CorpsCam.WorldLimY=[str2num(xlm{1}) str2num(xlm{2})];
CorpsCam.PixResolution=A(5).Value;
CorpsCam.WorldCoordSysH_epsg=A(6).Value;
CorpsCam.WaterLevel=A(7).Value;
CorpsCam.WaterLevelSource=A(8).Value;
CorpsCam.WorldCoordSysV_epsg=A(9).Value;
CorpsCam.GridFile=A(10).Value;
CorpsCam.ExtrinsicFiles=A(11).Value;
CorpsCam.DateProcessed=A(12).Value;
end

catch
    disp('No MetaData Available')
    CorpsCam=[];
end




