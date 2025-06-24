# import numpy as np
# import cv2

# # Read from the recorded video file
# cap = cv2.VideoCapture("../image_dir/naruto.mp4")

# #동영상 파일이 성공적으로 열리면 while문 반복
# while(cap.isOpened()):
#     #한 프레임을 읽어옴
#     ret, frame = cap.read()
    
#     if ret is False:
#         print("Can't receive frame (stream end?). Exiting ...")
#         break
    
#     # Display
#     cv2.imshow("Frame", frame)
    
#     #1ms 동안 대기하며 키 입력 받고, q입력 시 종료
#     key = cv2.waitKey(15)
#     if key & 0xFF == ord('q'):
#         break
    
# cap.release()
# cv2.destroyAllWindows()

# import numpy as np
# import cv2

# # Read from the recorded video file
# video_path = "/home/clvdrg/Documents/KDT_AI_BTCAMP/AI/openCV/image_dir/naruto.mp4"
# cap = cv2.VideoCapture(video_path)

# # 동영상 파일이 제대로 열렸는지 확인
# if not cap.isOpened():
#     print(f"Error: Could not open video file {video_path}")
#     exit()

# # 동영상의 FPS(초당 프레임 수)를 가져옴
# fps = cap.get(cv2.CAP_PROP_FPS)
# print(f"Video FPS: {fps}")

# # 각 프레임 간의 딜레이 시간 계산 (밀리초)
# # 1000ms (1초) / FPS = 각 프레임이 화면에 머물 시간
# delay = int(1000 / fps)
# print(f"Calculated delay per frame: {delay} ms")

# # 동영상 파일이 성공적으로 열리면 while문 반복
# while(True): # True 대신 cap.isOpened()를 쓰는 경우도 있지만, break 조건으로 충분
#     # 한 프레임을 읽어옴
#     ret, frame = cap.read()
    
#     # 프레임을 성공적으로 읽지 못했거나 동영상 끝이면 종료
#     if not ret: # ret is False 대신 not ret 사용이 일반적
#         print("Can't receive frame (stream end?). Exiting ...")
#         break
    
#     # Display
#     cv2.imshow("Frame", frame)
    
#     # 계산된 delay 시간 동안 대기하며 키 입력 받고, q입력 시 종료
#     key = cv2.waitKey(delay)
#     if key & 0xFF == ord('q'):
#         break
    
# # 작업 완료 후 비디오 캡처 객체 해제
# cap.release()
# # 모든 창 닫기
# cv2.destroyAllWindows()

# 반복 재생 코드
# import numpy as np
# import cv2

# # Read from the recorded video file
# video_path = "../image_dir/naruto.mp4"
# cap = cv2.VideoCapture(video_path)

# # 동영상 파일이 제대로 열렸는지 확인
# if not cap.isOpened():
#     print(f"Error: Could not open video file {video_path}")
#     exit()

# # 동영상의 FPS(초당 프레임 수)를 가져옴 (옵션: 재생 속도 조절용)
# fps = cap.get(cv2.CAP_PROP_FPS)
# # delay = int(1000 / fps) # 정확한 FPS에 맞추려면 이 줄 사용
# delay = 15 # 현재 코드의 waitKey(15)를 유지

# print(f"Video FPS: {fps}, Using delay: {delay} ms")

# # 무한 반복 루프 (사용자가 'q'를 누를 때까지)
# while True:
#     # 한 프레임을 읽어옴
#     ret, frame = cap.read()
    
#     # 프레임을 성공적으로 읽지 못했거나 동영상 끝이면
#     if not ret:
#         print("End of video stream. Looping back to start...")
#         # 동영상 재생 위치를 처음으로 돌림
#         # 이 부분이 핵심! set(cv2.CAP_PROP_POS_FRAMES, 0)
#         cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
#         # 만약 비디오 스트림이 완전히 끊겼을 경우를 대비하여 다시 cap.read() 시도 (선택 사항)
#         ret, frame = cap.read()
#         if not ret: # 그래도 실패하면 진짜 문제
#             print("Failed to loop video, exiting...")
#             break
    
#     # Display
#     cv2.imshow("Frame", frame)
    
#     # delay 시간 동안 대기하며 키 입력 받고, 'q' 입력 시 종료
#     key = cv2.waitKey(delay) # 여기서는 기존 delay 15ms 유지
#     if key & 0xFF == ord('q'):
#         print("User pressed 'q', exiting...")
#         break
    
# # 작업 완료 후 비디오 캡처 객체 해제
# cap.release()
# # 모든 창 닫기
# cv2.destroyAllWindows()

# 반복재생 + resize + 사진 저장
import numpy as np
import cv2
import os # 파일 경로 및 존재 여부 확인용

# Read from the recorded video file
video_path = "../image_dir/boyoung.mp4" # 동영상 파일 경로를 정확히 지정하세요.
cap = cv2.VideoCapture(video_path)

# 동영상 파일이 제대로 열렸는지 확인
if not cap.isOpened():
    print(f"오류: 동영상 파일 '{video_path}'을(를) 열 수 없습니다.")
    print("파일 경로, 형식, 코덱 지원 여부를 확인해주세요.")
    exit()

# 동영상의 FPS(초당 프레임 수)를 가져옴
fps = cap.get(cv2.CAP_PROP_FPS)
print(f"원본 동영상 FPS: {fps}")

# 각 프레임 간의 딜레이 시간 계산 (밀리초)
delay = int(1000 / fps)
if delay < 1: # 최소 1ms 딜레이 보장
    delay = 1
print(f"계산된 프레임 간 딜레이: {delay} ms")

# --- 리사이즈 비율 설정 ---
scale_percent = 50 # 원본 크기의 50%로 축소 (50%를 50으로 입력)
print(f"리사이즈 비율: {scale_percent}%")
# --- 리사이즈 비율 설정 끝 ---

# --- 이미지 저장 관련 설정 ---
save_dir = "saved_frames" # 이미지를 저장할 폴더 이름
os.makedirs(save_dir, exist_ok=True) # 폴더가 없으면 생성

# 저장할 이미지 파일 번호 초기화
# 기존 파일이 있다면 가장 큰 번호 + 1부터 시작하도록 설정 (선택 사항)
# 간단하게는 1부터 시작해도 무방합니다.
image_count = 1
existing_files = os.listdir(save_dir)
for f_name in existing_files:
    if f_name.endswith(".jpg") and len(f_name) == 7 and f_name[:3].isdigit(): # 예: 001.jpg
        try:
            num = int(f_name[:3])
            if num >= image_count:
                image_count = num + 1
        except ValueError:
            pass # 숫자가 아닌 파일명은 무시

print(f"이미지 저장 시작 번호: {image_count:03d}")
# --- 이미지 저장 관련 설정 끝 ---


# 무한 반복 루프 (사용자가 'q'를 누를 때까지)
while True:
    # 한 프레임을 읽어옴
    ret, frame = cap.read()
    
    # 프레임을 성공적으로 읽지 못했거나 동영상 끝이면
    if not ret:
        print("동영상 스트림 끝. 처음으로 돌아갑니다...")
        # 동영상 재생 위치를 처음으로 돌림
        cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
        # 다시 첫 프레임을 읽어옴 (루프 시작 시 끊김 방지)
        ret, frame = cap.read()
        if not ret: # 그래도 실패하면 진짜 문제
            print("동영상 루프 실패, 종료합니다...")
            break
    
    # --- 프레임 리사이즈 적용 ---
    display_frame = None # 화면에 표시할 프레임 변수
    if frame is not None: # 프레임이 제대로 읽혔는지 확인
        original_width = frame.shape[1]
        original_height = frame.shape[0]

        new_width = int(original_width * scale_percent / 100)
        new_height = int(original_height * scale_percent / 100)
        
        dim = (new_width, new_height)
        
        display_frame = cv2.resize(frame, dim, interpolation=cv2.INTER_AREA)
        cv2.imshow("Resized Video Frame", display_frame)
    else:
        print("경고: 빈 프레임을 받았습니다. 표시를 건너뜁니다.")
        continue # 빈 프레임이면 다음 루프로 건너김
    # --- 리사이즈 적용 끝 ---
    
    # 계산된 delay 시간 동안 대기하며 키 입력 받고, 'q' 또는 'c' 입력 시 동작
    key = cv2.waitKey(delay)
    
    # 'q' 키를 눌렀을 때 종료
    if key & 0xFF == ord('q'):
        print("사용자가 'q'를 눌렀습니다. 종료합니다...")
        break
    
    # 'c' 키를 눌렀을 때 현재 프레임 저장
    elif key & 0xFF == ord('c'):
        if display_frame is not None: # 리사이즈된 프레임이 존재할 때만 저장
            # 파일 이름 생성: 001.jpg, 002.jpg 형식
            filename = os.path.join(save_dir, f"{image_count:03d}.jpg")
            cv2.imwrite(filename, display_frame)
            print(f"프레임 저장됨: {filename}")
            image_count += 1 # 다음 저장을 위해 카운트 증가
        else:
            print("경고: 저장할 프레임이 없습니다.")

# 작업 완료 후 비디오 캡처 객체 해제
cap.release()
# 모든 창 닫기
cv2.destroyAllWindows()