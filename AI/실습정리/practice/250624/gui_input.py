# import cv2
# import numpy as np

# # Read from the first camera device
# cap = cv2.VideoCapture(4)

# topLeft = (50, 50)
# bottomRight = (300, 300)

# # 성공적으로 video device가 열렸으면 while문 반복
# while(cap.isOpened()):
#     #한프레임을 읽어옴
#     ret, frame = cap.read()
    
#     #Line
#     cv2.line(frame, topLeft, bottomRight, (0,255,0), 5)
    
#     # Rectangle
#     cv2.rectangle(frame, [pt+30 for pt in topLeft], [pt-30 for pt in bottomRight], (0,0,255), 5)
    
#     # Text
#     font = cv2.FONT_HERSHEY_SIMPLEX
#     cv2.putText(frame, 'me', [pt+80 for pt in topLeft], font, 2, (0,255,255), 10)
    
#     #Display
#     cv2.imshow("Camera", frame)
    
#     # 'q' 키를 눌렀을 때 종료
#     key = cv2.waitKey(1)
#     if key & 0xFF == ord('q'):
#         print("사용자가 'q'를 눌렀습니다. 종료합니다...")
#         break

import cv2
import numpy as np
import sys

# --- 전역 변수 설정 (마우스 이벤트를 위해) ---
# 마우스 클릭으로 그릴 원들의 정보를 저장할 리스트: [(center_x, center_y), radius, color, thickness]
circles_to_draw = []

# 마우스 이벤트 콜백 함수 정의
def draw_circle_on_mouse_click(event, x, y, flags, param):
    """
    마우스 이벤트를 처리하는 콜백 함수.
    왼쪽 버튼 클릭 시 해당 위치에 원 정보를 저장합니다.
    """
    if event == cv2.EVENT_LBUTTONDOWN:
        # 클릭한 위치를 중심점으로 하는 원 정보 추가
        center = (x, y)
        radius = 20        # 원의 반지름
        color = (0, 255, 0) # 초록색 (BGR)
        thickness = -1     # -1은 원을 채웁니다. 양수는 선의 두께입니다.
        circles_to_draw.append((center, radius, color, thickness))
        print(f"마우스 클릭: 원 추가됨 (중심: {center})")

# --- 웹캠 설정 시작 ---
camera_index = 4 # 0번이 가장 일반적인 기본 웹캠 인덱스입니다. (4번이 작동하지 않으면 0이나 1을 시도)
cap = cv2.VideoCapture(camera_index)

if not cap.isOpened():
    print(f"오류: 카메라 {camera_index}번을 열 수 없습니다.")
    print("카메라 인덱스, 드라이버, 접근 권한 등을 확인하세요.")
    sys.exit(1)

w = 640
h = 480
cap.set(cv2.CAP_PROP_FRAME_WIDTH, w)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, h)

actual_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
actual_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
print(f"실제 설정된 카메라 해상도: {actual_width}x{actual_height}")

# 그림을 그릴 고정 좌표 (기존 코드에서 가져옴)
topLeft = (50, 50)
bottomRight = (300, 300)

# 텍스트 폰트 설정
font = cv2.FONT_HERSHEY_SIMPLEX

# --- 웹캠 설정 끝 ---

# 'Camera' 윈도우를 생성하고 마우스 콜백 함수를 연결
cv2.namedWindow("Camera")
cv2.setMouseCallback("Camera", draw_circle_on_mouse_click)

print("웹캠 스트리밍 시작. 'q'를 눌러 종료하거나, 마우스 왼쪽 버튼을 클릭하여 원을 그리세요.")

# 성공적으로 웹캠이 열렸으면 루프 반복
while True:
    ret, frame = cap.read()
    
    if not ret:
        print("프레임을 수신할 수 없습니다 (스트림 종료?). 종료합니다...")
        break
    
    # --- 도형 및 텍스트 그리기 시작 (기존 코드) ---
    cv2.line(frame, topLeft, bottomRight, (0, 255, 0), 5)
    cv2.rectangle(frame, [pt + 30 for pt in topLeft], [pt - 30 for pt in bottomRight], (0, 0, 255), 5)
    cv2.putText(frame, 'me', [pt + 80 for pt in topLeft], font, 2, (0, 255, 255), 10)
    # --- 도형 및 텍스트 그리기 끝 ---

    # --- 마우스 클릭으로 저장된 모든 원들을 프레임에 그리기 ---
    for center, radius, color, thickness in circles_to_draw:
        cv2.circle(frame, center, radius, color, thickness)
    
    # 화면에 프레임 표시
    cv2.imshow("Camera", frame)
    
    # 1ms 동안 대기하며 키 입력 받고, 'q' 입력 시 종료
    key = cv2.waitKey(1)
    if key & 0xFF == ord('q'):
        print("사용자가 'q'를 눌렀습니다. 종료합니다.")
        break

# 사용이 끝난 카메라 자원 해제
cap.release()
# 열려있는 모든 창 닫기
cv2.destroyAllWindows()