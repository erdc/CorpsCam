import exifread

f = open("C:/Users/RDCHLBLB/Documents/GitHub/chl_coastalimaging/CHLCI_PublicDownload/20220809T213000Z.FrfTower.c4.dark.jpg", "rb")
tags = exifread.process_file(f)

#Local Rectified (tags 0-16)
print('Station: ' + str(tags.get('EXIF Tag 0xD000','notForThisImageType')))
print('Product: ' + str(tags.get('EXIF Tag 0xD001','notForThisImageType')))
print('TimeGMT: ' + str(tags.get('EXIF Tag 0xD002','notForThisImageType')))
print('Units: ' + str(tags.get('EXIF Tag 0xD003','notForThisImageType')))
print('LocalLimX: ' + str(tags.get('EXIF Tag 0xD004','notForThisImageType')))
print('LocalLimY: ' + str(tags.get('EXIF Tag 0xD005','notForThisImageType')))
print('PixResolution: ' + str(tags.get('EXIF Tag 0xD006','notForThisImageType')))
print('LocalOriginWorldX: ' + str(tags.get('EXIF Tag 0xD007','notForThisImageType')))
print('LocalOriginWorldY: ' + str(tags.get('EXIF Tag 0xD008','notForThisImageType')))
print('LocalAngle: ' + str(tags.get('EXIF Tag 0xD009','notForThisImageType')))
print('WorldCoordSysH_epsg: ' + str(tags.get('EXIF Tag 0xD010','notForThisImageType')))
print('WaterLevel: ' + str(tags.get('EXIF Tag 0xD011','notForThisImageType')))
print('WaterLevelSource: ' + str(tags.get('EXIF Tag 0xD012','notForThisImageType')))
print('WorldCoordSysV_epsg: ' + str(tags.get('EXIF Tag 0xD013','notForThisImageType')))
print('GridFile: ' + str(tags.get('EXIF Tag 0xD014','notForThisImageType')))
print('ExtrinsicFiles: ' + str(tags.get('EXIF Tag 0xD015','notForThisImageType')))
print('DateProcessed: ' + str(tags.get('EXIF Tag 0xD016','notForThisImageType')))

# Geo Rectified (tags 0-3,6-16, 42-43
print('WorldLimX: ' + str(tags.get('EXIF Tag 0xD043','notForThisImageType')))
print('WorldLimY: ' + str(tags.get('EXIF Tag 0xD042','notForThisImageType')))

# Oblique  (tags 0-3,7-13,15-41)
print('Camera: ' + str(tags.get('EXIF Tag 0xD017','notForThisImageType')))
print('ExtrinsicsWorld: ' +  str(tags.get('EXIF Tag 0xD018','nan'))  + str(tags.get('EXIF Tag 0xD019','nan'))  +str(tags.get('EXIF Tag 0xD020','nan')) +str(tags.get('EXIF Tag 0xD022','nan'))+str(tags.get('EXIF Tag 0xD023','nan')) +str(tags.get('EXIF Tag 0xD024','nan')))
print('ExtrinsicsLocal: ' +  str(tags.get('EXIF Tag 0xD025','nan'))  + str(tags.get('EXIF Tag 0xD026','nan'))  +str(tags.get('EXIF Tag 0xD027','nan')) +str(tags.get('EXIF Tag 0xD028','nan'))+str(tags.get('EXIF Tag 0xD029','nan')) +str(tags.get('EXIF Tag 0xD030','nan')))
print('Intrinsics: ' +  str(tags.get('EXIF Tag 0xD031','nan'))  + str(tags.get('EXIF Tag 0xD032','nan'))  +str(tags.get('EXIF Tag 0xD033','nan')) +str(tags.get('EXIF Tag 0xD034','nan'))+str(tags.get('EXIF Tag 0xD035','nan')) +str(tags.get('EXIF Tag 0xD036','nan'))+str(tags.get('EXIF Tag 0xD037','nan'))+str(tags.get('EXIF Tag 0xD038','nan'))+str(tags.get('EXIF Tag 0xD039','nan'))+str(tags.get('EXIF Tag 0xD040','nan'))+str(tags.get('EXIF Tag 0xD041','nan')))
