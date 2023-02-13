from minio import Minio
import wget 
import logging


client = Minio("coastalimaging.erdc.dren.mil")
 
objects = client.list_objects("FrfTower", prefix="Processed/Orthophotos/cx/", recursive=True,)
 
    # will download alllll files, be careful!
for obj in objects:
    print(["wget https://coastalimaging.erdc.dren.mil/" + "FrfTower/" + obj.object_name])
    logging.basicConfig(filename='output2.txt', level=logging.DEBUG, format='')
    logging.debug("https://coastalimaging.erdc.dren.mil/" + "FrfTower/" + obj.object_name)

