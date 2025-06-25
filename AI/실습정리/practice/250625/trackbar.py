# import cv2
# import numpy as np

# topLeft = (50, 50)
# bold = 0

# cap = cv2.VideoCapture(4)

# # Callback function for the trackbar
# def on_bold_trackbar(value):
#     #print("Trackbar value:", value)
#     global bold
#     bold = value
    
    
# cv2.namedWindow("Camera")
# cv2.createTrackbar("bold", "Camera", bold, 10, on_bold_trackbar)

# #성공적으로 video device가 열리면 while문 반복
# while(cap.isOpened()):
#     #한 프레임을 읽어옴
#     ret, frame = cap.read()
#     if ret is False:
#         print("Can't receive frame (stream end?). Exiting...")
#         break
#     # Text
#     cv2.putText(frame, "TEXT", topLeft, cv2.FONT_HERSHEY_SIMPLEX, 2, (0,255,255), 1 + bold)
    
#     # Display
#     cv2.imshow("Camera", frame)
    
#     key = cv2.waitKey(1)
#     if key & 0xFF == ord('q'):
#         print("사용자가 'q'를 눌렀습니다. 종료합니다...")
#         break

# # 사용이 끝난 카메라 자원 해제
# cap.release()
# # 열려있는 모든 창 닫기
# cv2.destroyAllWindows()

# Quiz code
# import cv2
# import numpy as np

# topLeft = (50, 50)
# bold = 0
# # RGB 값 초기화
# red = 0
# green = 255
# blue = 255

# cap = cv2.VideoCapture(4) # 4번 카메라 장치를 엽니다.

# # 굵기 트랙바 콜백 함수
# def on_bold_trackbar(value):
#     global bold
#     bold = value

# # R, G, B 트랙바 콜백 함수
# def on_red_trackbar(value):
#     global red
#     red = value

# def on_green_trackbar(value):
#     global green
#     green = value

# def on_blue_trackbar(value):
#     global blue
#     blue = value

# cv2.namedWindow("Camera") # "Camera"라는 이름의 창을 만듭니다.
# cv2.createTrackbar("bold", "Camera", bold, 10, on_bold_trackbar) # 굵기 트랙바를 만듭니다.
# # R, G, B 트랙바를 만듭니다.
# cv2.createTrackbar("Red", "Camera", red, 255, on_red_trackbar)
# cv2.createTrackbar("Green", "Camera", green, 255, on_green_trackbar)
# cv2.createTrackbar("Blue", "Camera", blue, 255, on_blue_trackbar)

# # 비디오 장치가 성공적으로 열렸는지 확인
# if not cap.isOpened():
#     print("오류: 비디오 장치를 열 수 없습니다.")
#     exit()

# # 비디오 장치가 열려 있으면 루프 반복
# while(cap.isOpened()):
#     # 한 프레임을 읽어옴
#     ret, frame = cap.read()
#     if ret is False:
#         print("프레임을 수신할 수 없습니다 (스트림 종료?). 종료합니다...")
#         break

#     # 텍스트 색상에 동적인 RGB 값을 사용합니다.
#     # OpenCV는 BGR 형식을 사용하므로 순서는 (파랑, 초록, 빨강)입니다.
#     cv2.putText(frame, "I LOVE YOU", topLeft, cv2.FONT_HERSHEY_SIMPLEX, 2, (blue, green, red), 1 + bold)

#     # 화면에 표시
#     cv2.imshow("Camera", frame)

#     key = cv2.waitKey(1) # 1ms 동안 키 입력을 기다립니다.
#     if key & 0xFF == ord('q'): # 'q' 키가 눌리면
#         print("사용자가 'q'를 눌렀습니다. 종료합니다...")
#         break

# cap.release() # 비디오 캡처 객체를 해제합니다.
# cv2.destroyAllWindows() # 모든 OpenCV 창을 닫습니다.

###################################################################################################################
# 하트 버전
import cv2
import numpy as np

topLeft = (50, 50)
bold = 0
red = 0
green = 255 # 초기값
blue = 255

cap = cv2.VideoCapture(4)

def on_bold_trackbar(value):
    global bold
    bold = value

def on_red_trackbar(value):
    global red
    red = value

def on_green_trackbar(value): # Green 트랙바 콜백 함수
    global green
    green = value

def on_blue_trackbar(value): # Blue 트랙바 콜백 함수
    global blue
    blue = value

cv2.namedWindow("Camera")
cv2.createTrackbar("bold", "Camera", bold, 10, on_bold_trackbar)
cv2.createTrackbar("Red", "Camera", red, 255, on_red_trackbar)
cv2.createTrackbar("Green", "Camera", green, 255, on_green_trackbar) # <--- 여기를 수정했습니다!
cv2.createTrackbar("Blue", "Camera", blue, 255, on_blue_trackbar)

def draw_heart(image, center_x, center_y, size, color):
    points_relative = np.array([
        [0.0, -0.3],
        [0.2, -0.5],
        [0.5, -0.5],
        [0.7, -0.3],
        [0.0, 0.5],
        [-0.7, -0.3],
        [-0.5, -0.5],
        [-0.2, -0.5],
    ], dtype=np.float32)

    points_scaled = points_relative * size
    points_translated = points_scaled + np.array([center_x, center_y])
    points_int = points_translated.astype(np.int32)

    cv2.fillPoly(image, [points_int.reshape((-1, 1, 2))], color, cv2.LINE_AA)

if not cap.isOpened():
    print("Error: Could not open video device.")
    exit()

while(cap.isOpened()):
    ret, frame = cap.read()
    if ret is False:
        print("Can't receive frame (stream end?). Exiting...")
        break

    h, w, _ = frame.shape

    heart_color = (blue, green, red) # BGR 순서로 하트 색상 설정
    heart_size = 200

    heart_center_x = w // 2
    heart_center_y = h // 2

    draw_heart(frame, heart_center_x, heart_center_y, heart_size, heart_color)

    cv2.putText(frame, "LOVE", topLeft, cv2.FONT_HERSHEY_SIMPLEX, 2, (blue, green, red), 1 + bold)

    cv2.imshow("Camera", frame)

    key = cv2.waitKey(1)
    if key & 0xFF == ord('q'):
        print("사용자가 'q'를 눌렀습니다. 종료합니다...")
        break

cap.release()
cv2.destroyAllWindows()

###################################################################################################################

