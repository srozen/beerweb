from PIL import Image, ImageChops
from itertools import izip
import math
import sys
import os

def main():
	fileComp, folder = sys.argv[1:1+2]

	img1 = Image.open(fileComp)

	bestresult = 100

	for imgComp in os.listdir(folder):

		img2 = Image.open(os.path.join(folder, imgComp))
		pairs = izip(img1.getdata(), img2.getdata())

		if len(img1.getbands()) == 1:
			dif = sum(abs(p1-p2) for p1,p2 in pairs)
		else:
			dif = sum(abs(c1-c2) for p1,p2 in pairs for c1,c2 in zip(p1,p2))

		ncomponents = img1.size[0] * img1.size[1] * 3

		result = (dif / 255.0 * 100) / ncomponents

		if result < bestresult:

			bestimg = imgComp
			bestresult = result

	print bestimg

main()
