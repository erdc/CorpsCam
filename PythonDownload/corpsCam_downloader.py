######################################################
#Packages
from minio import Minio
import wget 
import os
######################################################
#Function Description
# Script will look at a folder you specify on your local machine (dfolder)
# and download all of the latest CoastSnap Oblique Images for that station
# (stationName) that do not already exist in that folder. If the folder is
# empty it will download all the available images. 
#############################################################################
#User Input
stationName = "AvalonPier"

#Download Folder
dfolder = "D:\AvalonTest"

#######################################################
# Code, Do not mess with

#checks if folder exists, if not makes it
if not os.path.exists(dfolder):
    os.makedirs(dfolder)
#Set up MINIO API
client = Minio("coastalimaging.erdc.dren.mil")
#Get List of all Oblique Images 
objects = client.list_objects(stationName, prefix="Processed/alignedObliques/c1", recursive=True,)
# Download if it doesnt already exist in dfolder 
for obj in objects:
    file = obj.object_name.split("/")[-1]
    if os.path.exists(os.path.join(dfolder, file)):
        print(file, "already downloaded")
    else:
        wget.download('https://coastalimaging.erdc.dren.mil/' + stationName + "/"+obj.object_name, dfolder)
        print(file, "downloaded")
       
