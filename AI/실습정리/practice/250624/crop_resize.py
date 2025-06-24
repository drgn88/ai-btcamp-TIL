import cv2
import numpy as np

# 이미지 파일을 Read
img = cv2.imread("../image_dir/puffin.jpg")

# Crop 300X400 from original image from (100,50) = (x,y)
cropped = img[50:450, 100:400]

# Resize cropped image from 300X400 to 400X200
resized = cv2.resize(cropped, (400,200))

# Image 회전
rotate_90 = cv2.rotate(img, cv2.ROTATE_90_CLOCKWISE)

# Display all
cv2.imshow("Original", img)
cv2.imshow("Cropped image", cropped)
cv2.imshow("Resized image", resized)
cv2.imshow("Rotate image", rotate_90)

cv2.waitKey(0)
cv2.destroyAllWindows()