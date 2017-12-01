from PIL import Image
def getArr(pix):
    for y in range(0, 64):
	print("{", end="")
	s = ""
	for x in range(0, 120):
	    s += (str(getCol(pix[x,y])) + ", ")
	print(s + "}, ", end="")
def getCol(rgb):
	if rgb[0] == 255:
		return 1
	elif rgb[3] == 255:
		return 2
	else:
		return 0
path = input("Enter path: ")
m = Image.open(path)
pix = im.load()
getArr(pix)
