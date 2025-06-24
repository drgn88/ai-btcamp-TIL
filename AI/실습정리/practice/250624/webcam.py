# import cv2
# import numpy as np

# # Read from the first 
# # cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)
# cap = cv2.VideoCapture(4)


# w = 640#1280#1920
# h = 480#720#1080
# cap.set(cv2.CAP_PROP_FRAME_WIDTH, w)
# cap.set(cv2.CAP_PROP_FRAME_HEIGHT, h)

# # 성공적으로 video device가 열렸으면 while문 반복
# while(cap.isOpened()):
#     print("Success")
#     ret, frame = cap.read()
#     if ret is False:
#         print("Can't receive frame (stream end?). Exiting...")
#         break
    
#     # Display
#     cv2.imshow("Camera", frame)
    
#     # 1ms동안 대기하며 키입력 받고 'q' 입력 시 종료
#     key = cv2.waitKey(1)
#     if key & 0xFF == ord('q'):
#         break

# 비디오 저장까지
import cv2
import numpy as np
import sys # 프로그램 종료를 위해

# Read from the first camera (index 0, or try 1, 2, 3, etc. if 0 doesn't work)
# cv2.CAP_DSHOW is often problematic, so it's good you removed it for testing.
# Let's keep the current index (4) or try 0 if 4 is not working.
camera_index = 4 # 현재 코드의 인덱스 유지
# camera_index = 0 # 대부분의 경우 0번이 기본 웹캠입니다.

cap = cv2.VideoCapture(camera_index)

# Check if the camera opened successfully
if not cap.isOpened():
    print(f"오류: 카메라 {camera_index}번을 열 수 없습니다.")
    print("다음 사항을 확인하세요:")
    print("  1. 다른 프로그램이 카메라를 사용 중인지 확인하고 종료하세요.")
    print("  2. 카메라 드라이버가 제대로 설치되었는지 확인하세요.")
    print("  3. 운영 체제 (예: Windows 개인 정보 설정)에서 Python 앱이 카메라에 접근할 수 있도록 허용했는지 확인하세요.")
    print("  4. 카메라 인덱스(0, 1, 2...)를 바꿔보세요.")
    sys.exit(1) # Exit if camera fails to open

# Set desired frame width and height
w = 640
h = 480
cap.set(cv2.CAP_PROP_FRAME_WIDTH, w)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, h)

# Get the actual frame dimensions and FPS from the camera
# This is important because the camera might not support the exact w, h you set.
# We'll use these actual values for VideoWriter.
actual_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
actual_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = cap.get(cv2.CAP_PROP_FPS)

# If FPS is 0 (can happen with some cameras or virtual cameras), set a default
if fps == 0:
    fps = 30.0 # Default to 30 FPS if camera doesn't report it

print(f"카메라 해상도 설정 시도: {w}x{h}")
print(f"실제 설정된 카메라 해상도: {actual_width}x{actual_height}")
print(f"실제 카메라 FPS: {fps}")

# --- VideoWriter 설정 ---
# 1. 출력 파일 이름
output_filename = 'output.mp4'

# 2. FourCC 코덱 (압축 방식)
# FourCC는 4바이트 코드로 비디오 코덱을 나타냅니다.
# MP4 파일의 경우 일반적으로 'mp4v' 또는 'XVID', 'DIVX'를 많이 사용합니다.
# 'mp4v' (MPEG-4)는 대부분의 시스템에서 잘 작동합니다.
# MacOS: 'avc1'
# Windows: 'XVID', 'DIVX', 'mp4v'
# H.264 코덱을 사용하려면 'X264' (때로는 작동하지 않을 수도 있음)
fourcc = cv2.VideoWriter_fourcc(*'mp4v') # *'mp4v'는 'm', 'p', '4', 'v'를 의미합니다.

# 3. FPS (프레임 레이트)
# 카메라의 실제 FPS를 사용하는 것이 가장 좋습니다.
output_fps = fps

# 4. 프레임 크기 (너비, 높이)
# 카메라에서 실제로 받아오는 프레임의 크기를 사용해야 합니다.
output_size = (actual_width, actual_height)

# VideoWriter 객체 생성
out = cv2.VideoWriter(output_filename, fourcc, output_fps, output_size)

# VideoWriter 객체가 성공적으로 생성되었는지 확인
if not out.isOpened():
    print(f"오류: 비디오 파일 '{output_filename}'을(를) 열 수 없습니다.")
    print("코덱(fourcc)이 올바른지, 파일 경로에 쓰기 권한이 있는지 확인하세요.")
    sys.exit(1)
# --- VideoWriter 설정 끝 ---

print("웹캠 스트리밍 및 output.mp4에 저장 시작...")
print("'q'를 눌러 종료하세요. 'Success' 메시지가 반복되는지 확인하세요.")

# 성공적으로 video device가 열렸으면 while문 반복
while(True): # cap.isOpened() 대신 True 사용 (위에서 이미 확인했으므로)
    # print("Success") # 이 메시지는 루프가 잘 돌아가는지 확인용, 너무 많으면 주석 처리
    ret, frame = cap.read()
    
    if not ret:
        print("프레임을 수신할 수 없습니다 (스트림 종료?). 종료합니다...")
        break # 루프 종료
    
    # 받은 프레임을 화면에 표시
    cv2.imshow("Camera", frame)
    
    # 받은 프레임을 output.mp4 파일에 쓰기
    out.write(frame)
    
    # 1ms동안 대기하며 키입력 받고 'q' 입력 시 종료
    key = cv2.waitKey(1)
    if key & 0xFF == ord('q'):
        print("사용자가 'q'를 눌러 종료합니다. 영상 저장을 완료합니다.")
        break

# 사용이 끝난 카메라 자원 해제
cap.release()
# VideoWriter 객체 해제 (이것이 파일을 최종적으로 완성하고 닫습니다)
out.release()
# 열려있는 모든 창 닫기
cv2.destroyAllWindows()

print(f"영상 저장 완료: {output_filename}")