from PIL import Image, ImageChops
from itertools import izip
import math
import sys


def image_entropy(img):
    """calculate the entropy of an image"""
    # this could be made more efficient using numpy
    histogram = img.histogram()
    histogram_length = sum(histogram)
    samples_probability = [float(h) / histogram_length for h in histogram]
    return -sum([p * math.log(p, 2) for p in samples_probability if p != 0])


file1, file2 = sys.argv[1:1+2]

img1 = Image.open(file1)
img2 = Image.open(file2)

pairs = izip(img1.getdata(), img2.getdata())
if len(img1.getbands()) == 1:
    # for gray-scale jpegs
    dif = sum(abs(p1-p2) for p1,p2 in pairs)
else:
    dif = sum(abs(c1-c2) for p1,p2 in pairs for c1,c2 in zip(p1,p2))

ncomponents = img1.size[0] * img1.size[1] * 3
print (dif / 255.0 * 100) / ncomponents

img = ImageChops.difference(img1,img2)
#img.save('test_diff2.png')
#print image_entropy(img) # 8.15698432026

