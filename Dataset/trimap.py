import cv2
import numpy as np
import os
from PIL import Image

alpha = ""

bcount = 0
def trimap(img):
    kernel = np.ones((5 , 5) , np.uint8)
    erosion = cv2.erode(img , kernel , iterations=3)
    dilation = cv2.dilate(img , kernel , iterations=3)
    sub = np.subtract(dilation , erosion)

    ret , thresh1 = cv2.threshold(sub ,3 , 120 , cv2.THRESH_BINARY)
    ret , ero1 = cv2.threshold(erosion , 3 , 255 , cv2.THRESH_BINARY)
    z = np.add(thresh1 , ero1)
    return z

for im_name in os.listdir("D:\\project\\adafa\\"):#directory containing trimap images
    img = cv2.imread("D:\\project\\adafa\\" + im_name)
    out = trimap(img)
    cv2.imwrite("D:\\project\\out\\" + im_name[ :len(im_name) - 4 ] + '_' + str(bcount) + '.png',out )#directory of the output folder
    bcount = bcount+1
    #imshow(k)

