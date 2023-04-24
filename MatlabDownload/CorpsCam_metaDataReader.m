%% Function Description
%  Given a filepath (fname), pulls metadata from EXIF data. Currently works
%  for local rectifications, obliques, and world rectifcations. Note if
%  EXIF writing function changes, this will have to as well. 

%  Created by B.Bruder 2022/07/31


function [CHLCImeta]= CHLci_metaDataReader2(fname)


%% Pull Information
I=imfinfo(fname);
try
A=I.DigitalCamera.UnknownTags;
numVal=length(A);


switch numVal
%% Oblique

    case 38
CHLCImeta.Station=A(1).Value;
CHLCImeta.Product=A(2).Value;
CHLCImeta.TimeGMT=A(3).Value;
CHLCImeta.Units=A(4).Value;
CHLCImeta.LocalOriginWorldX=A(5).Value;
CHLCImeta.LocalOriginWorldY=A(6).Value;
CHLCImeta.LocalAngle=A(7).Value;
CHLCImeta.WorldCoordSysH_epsg=A(8).Value;
CHLCImeta.WaterLevel=A(9).Value;
CHLCImeta.WaterLevelSource=A(10).Value;
CHLCImeta.WorldCoordSysV_epsg=A(11).Value;
CHLCImeta.ExtrinsicFiles=A(12).Value;
CHLCImeta.DateProcessed=A(13).Value;
CHLCImeta.Camera=A(14).Value;
CHLCImeta.ExtrinsicsWorld=[A(15).Value A(16).Value A(17).Value A(18).Value A(19).Value A(20).Value] ;
CHLCImeta.ExtrinsicsLocal=[A(21).Value A(22).Value A(23).Value A(24).Value A(20).Value A(26).Value] ;
CHLCImeta.Intrinsics=[A(27).Value A(28).Value A(29).Value A(30).Value A(31).Value A(32).Value A(33).Value A(34).Value A(35).Value A(36).Value A(37).Value A(37).Value] ;
CHLCImeta.TidalStage=A(38).Value;


%% Local Rectification

    case 18
CHLCImeta.Station=A(1).Value;
CHLCImeta.Product=A(2).Value;
CHLCImeta.TimeGMT=A(3).Value;
CHLCImeta.Units=A(4).Value;
xlm=strsplit(A(5).Value);
CHLCImeta.LocalLimX=[str2num(xlm{1}) str2num(xlm{2})];
xlm=strsplit(A(6).Value);
CHLCImeta.LocalLimY=[str2num(xlm{1}) str2num(xlm{2})];
CHLCImeta.PixResolution=A(7).Value;
CHLCImeta.LocalOriginWorldX=A(8).Value;
CHLCImeta.LocalOriginWorldY=A(9).Value;
CHLCImeta.LocalAngle=A(10).Value;
CHLCImeta.WorldCoordSysH_epsg=A(11).Value;
CHLCImeta.WaterLevel=A(12).Value;
CHLCImeta.WaterLevelSource=A(13).Value;
CHLCImeta.WorldCoordSysV_epsg=A(14).Value;
CHLCImeta.GridFIle=A(15).Value;
CHLCImeta.ExtrinsicFiles=A(16).Value;
CHLCImeta.DateProcessed=A(17).Value;
CHLCImeta.TidalStage=A(18).Value;



%% World Rectification

case 15
CHLCImeta.Station=A(1).Value;
CHLCImeta.Product=A(2).Value;
CHLCImeta.TimeGMT=A(3).Value;
CHLCImeta.Units=A(4).Value;
xlm=strsplit(A(14).Value);
CHLCImeta.WorldLimX=[str2num(xlm{1}) str2num(xlm{2})];
xlm=strsplit(A(13).Value);
CHLCImeta.WorldLimY=[str2num(xlm{1}) str2num(xlm{2})];
CHLCImeta.PixResolution=A(5).Value;
CHLCImeta.WorldCoordSysH_epsg=A(6).Value;
CHLCImeta.WaterLevel=A(7).Value;
CHLCImeta.WaterLevelSource=A(8).Value;
CHLCImeta.WorldCoordSysV_epsg=A(9).Value;
CHLCImeta.GridFile=A(10).Value;
CHLCImeta.ExtrinsicFiles=A(11).Value;
CHLCImeta.DateProcessed=A(12).Value;
CHLCImeta.TidalStage=A(15).Value;


    otherwise
        disp('No MetaData Available')
    CHLCImeta=[];
end

catch
    disp('No MetaData Available')
    CHLCImeta=[];
end




