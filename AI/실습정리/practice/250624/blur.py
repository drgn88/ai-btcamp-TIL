import cv2
src = cv2.imread("../image_dir/puffin.jpg", cv2.IMREAD_COLOR)
dst = cv2.blur(src, (30, 30), anchor=(-1,-1), borderType=cv2.BORDER_DEFAULT)
dst2 = cv2.blur(src, (30, 30), anchor=(-1,-1), borderType=cv2.BORDER_REFLECT)

cv2.imshow("dst", dst)
cv2.imshow("dst_reflect", dst2)
cv2.waitKey()
cv2.destroyAllWindows()