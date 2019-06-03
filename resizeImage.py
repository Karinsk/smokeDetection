import os
import sys
from PIL import Image

cwd = os.getcwd()
os.mkdir(cwd+"/resized/")
for infile in sys.argv[1:]:
    fileName = infile.split('/')[-1]
    outfile = os.path.splitext(infile)[0] + "_crop_resized"
    if infile != outfile:
        try:
            im = Image.open(infile)
            width, height = im.size  #names are not optimal
            box = (int(0.5*(width-height)), 0, int(0.5*(width-height)+height), height)
            region = im.crop(box)
            resized = region.resize((224, 224))
            resized.save(cwd+"/resized/"+fileName)

        except IOError:
            print("cannot crop and resize '%s'" % infile)
