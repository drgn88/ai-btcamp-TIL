import numpy as np
import cv2

# 이미지 파일을 Read
img = cv2.imread("../image_dir/puffin.jpg")

# Image란 이름의 Display 창 생성
cv2.namedWindow("image", cv2.WINDOW_NORMAL)

# Numpy ndarray H/W/C order
print(img.shape)

# Read한 이미지 파일을 Display
cv2.imshow("img", img)

# 키 입력 대기
cv2.waitKey(0)

# output.png로 읽은 이미지 파일을 저장
cv2.imwrite("output.png", img)

# Destroy all windows
cv2.destroyAllWindows()