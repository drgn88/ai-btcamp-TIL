import cv2
import numpy as np

src = cv2.imread("../image_dir/strawberry.jpg", cv2.IMREAD_COLOR)
b,g,r = cv2.split(src)
inverse = cv2.merge((r,g,b))

b_np = src[:,:,0]
g_np = src[:,:,1]
r_np = src[:,:,2]
inverse_np = cv2.merge((r_np,g_np,b_np))
#inverse_np = cv2.merge((b_np,g_np,r_np))

cv2.imshow("b", b)
cv2.imshow("g", g)
cv2.imshow("r", r)
cv2.imshow("inverse", inverse)
cv2.imshow("inverse_np", inverse_np)
cv2.waitKey()
cv2.destroyAllWindows()