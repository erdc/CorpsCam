from minio import Minio
import wget 
import logging


client = Minio("coastalimaging.erdc.dren.mil")
 
objects = client.list_objects("FrfPier", prefix="Raw/Obliques/c1/", recursive=True,)
 
    # will download alllll files, be careful!
for obj in objects:
    print(["wget https://coastalimaging.erdc.dren.mil/" + "FrfPier/" + obj.object_name])
   