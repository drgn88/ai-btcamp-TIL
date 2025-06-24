import cv2
import numpy as np

# 이미지 파일을 Read하고 color space 정보 출력
color = cv2.imread("../image_dir/strawberry.jpg", cv2.IMREAD_COLOR)

# color = cv2.imread("strawberry_dark.jpg", cv2.IMREAD_COLOR)
print(color.shape)

height,width,channels = color.shape
cv2.imshow("Original Image",color)

# Color Channel을 B, G, R로 분할하여 출력
b,g,r = cv2.split(color)
rgb_split = np.concatenate((b,g,r), axis = 1)
cv2.imshow("BGR Channels", rgb_split)

# 색공간을 BGR에서 HSV로 변환
hsv = cv2.cvtColor(color, cv2.COLOR_BGR2HSV)

# 색공간을 BGR에서 흑백으로 변환
gray = cv2.cvtColor(color, cv2.COLOR_BGR2GRAY)

# Color Channel을 B, G, R로 분할하여 출력
g = cv2.split(gray)
rgb_split_g = np.concatenate(g, axis = 1)
cv2.imshow("Gray Channels", rgb_split_g)

# Channel을 H, S, V로 분할하여 출력
h,s,v=cv2.split(hsv)
hsv_split = np.concatenate((h,s,v),axis= 1)
cv2.imshow("Split HSV", hsv_split)

cv2.waitKey()