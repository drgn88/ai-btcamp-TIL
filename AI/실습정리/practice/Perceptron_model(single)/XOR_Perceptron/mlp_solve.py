import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

# 기존 Perceptron 클래스를 기반으로, Hidden Layer와 Output Layer를 포함한 MLP 클래스 정의
class MLP_XOR_with_StepActivation:
  def __init__(self):
    # Hidden Layer (은닉층)의 가중치와 바이어스 - NAND와 OR 게이트 역할
    # 이 값들은 XOR 문제를 해결하도록 사람이 직접 설정합니다 (학습을 통한 것이 아님)

    # NAND 게이트 역할을 하는 뉴런 (첫 번째 은닉 노드)
    # (0,0)->1, (0,1)->1, (1,0)->1, (1,1)->0
    self.hidden_weights_nand = np.array([-1, -1]) # w1, w2
    self.hidden_bias_nand = 1.5                   # bias

    # OR 게이트 역할을 하는 뉴런 (두 번째 은닉 노드)
    # (0,0)->0, (0,1)->1, (1,0)->1, (1,1)->1
    self.hidden_weights_or = np.array([1, 1])     # w1, w2
    self.hidden_bias_or = -0.5                    # bias

    # Output Layer (출력층)의 가중치와 바이어스 - AND 게이트 역할
    # 은닉층 출력 (NAND_output, OR_output)을 입력으로 받아 XOR 최종 출력
    # (1,0) -> 0, (1,1) -> 1, (1,1) -> 1, (0,1) -> 0
    # (새로운 공간에서 (1,1)만 1, 나머지는 0이 되도록)
    self.output_weights = np.array([1, 1]) # NAND_output에 대한 w, OR_output에 대한 w
    self.output_bias = -1.5                # bias


  # 활성화 함수 (계단 함수)
  def activation(self, x):
    return np.where(x > 0, 1, 0)

  # 예측 함수 (MLP의 순전파)
  def predict(self, x_input): # x_input은 [x1, x2] 형태의 단일 샘플
    # 1. Hidden Layer 계산
    # NAND 노드
    linear_output_nand = np.dot(x_input, self.hidden_weights_nand) + self.hidden_bias_nand
    z1 = self.activation(linear_output_nand) # NAND 결과 (0 또는 1)

    # OR 노드
    linear_output_or = np.dot(x_input, self.hidden_weights_or) + self.hidden_bias_or
    z2 = self.activation(linear_output_or)   # OR 결과 (0 또는 1)

    # 2. Output Layer 계산
    # 출력층의 입력은 은닉층의 출력 (z1, z2)이 됩니다.
    hidden_layer_output = np.array([z1, z2]) # [NAND 결과, OR 결과]

    # AND 노드
    final_linear_output = np.dot(hidden_layer_output, self.output_weights) + self.output_bias
    final_prediction = self.activation(final_linear_output) # 최종 XOR 결과 (0 또는 1)

    return final_prediction

  # 이 모델은 수동으로 가중치를 설정하므로 train 메서드가 필요 없습니다.
  # 만약 학습 알고리즘을 사용하려면, 활성화 함수를 시그모이드 등으로 변경하고 역전파를 구현해야 합니다.
  def train(self, x, y):
    print("이 MLP 모델은 계단 함수를 사용하므로, 가중치가 수동으로 설정되었습니다. 훈련 과정이 필요하지 않습니다.")
    print("만약 학습을 원하신다면, 활성화 함수를 미분 가능한 함수로 변경하고 역전파 알고리즘을 구현해야 합니다.")


# --- XOR 게이트 데이터 ---
x_xor = np.array([[0,0],[0,1],[1,0],[1,1]])
y_xor = np.array([0,1,1,0])
#y_xor = np.array([0,0,0,1])

# --- MLP 모델 생성 ---
mlp_xor = MLP_XOR_with_StepActivation()

# --- 훈련 (여기서는 실제 훈련이 아님, 메시지 출력) ---
mlp_xor.train(x_xor, y_xor) # 형식적으로 train 호출

# --- 예측 결과 확인 ---
print("\nXOR Gate Test (MLP with Step Activation):")

for x_val, y_true in zip(x_xor, y_xor):
  predicted_output = mlp_xor.predict(x_val)
  # 은닉층의 중간 결과도 확인 (디버깅용)
  linear_output_nand = np.dot(x_val, mlp_xor.hidden_weights_nand) + mlp_xor.hidden_bias_nand
  z1_val = mlp_xor.activation(linear_output_nand)

  linear_output_or = np.dot(x_val, mlp_xor.hidden_weights_or) + mlp_xor.hidden_bias_or
  z2_val = mlp_xor.activation(linear_output_or)

  print(f"Input: {x_val}, (Hidden Layer Outputs: NAND={z1_val}, OR={z2_val}), Predicted: {predicted_output}, True: {y_true}")
  assert predicted_output == y_true, f"Error: Input {x_val} predicted {predicted_output}, but true was {y_true}"


print("\nAll XOR predictions are correct!")


# --- 경계 결정 시각화 함수 (이전 코드에서 수정) ---
def plot_decision_boundary(x, y, model, title="MLP Decision Boundary"):
  cmap_light = ListedColormap(['#FFAAAA', '#AAAAFF']) # 0은 빨강, 1은 파랑 영역
  cmap_bold = ListedColormap(['#FF0000', '#0000FF'])   # 0은 빨강, 1은 파랑 데이터 포인트

  h = .02 # mesh grid 간격
  x_min, x_max = x[:,0].min() - 0.5, x[:,0].max() + 0.5
  y_min, y_max = x[:,1].min() - 0.5, x[:,1].max() + 0.5
  xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))

  # 모델의 predict 함수는 단일 샘플을 받으므로, meshgrid 전체에 대해 예측을 수행해야 함
  # np.c_는 두 1D 배열을 2D 배열로 병합합니다.
  mesh_inputs = np.c_[xx.ravel(), yy.ravel()]
  z = np.array([model.predict(xi) for xi in mesh_inputs]) # 각 점에 대해 predict 호출
  z = z.reshape(xx.shape)

  plt.figure(figsize=(8,6))
  plt.contourf(xx, yy, z, cmap=cmap_light, alpha=0.8)

  # 실제 데이터 포인트 표시
  plt.scatter(x[:,0], x[:,1], c=y.ravel(), cmap=cmap_bold, edgecolor = 'k', s=100, marker='o')
  plt.xlabel('Input 1')
  plt.ylabel('Input 2')
  plt.title(title)
  plt.xlim(xx.min(), xx.max())
  plt.ylim(yy.min(), yy.max())
  plt.grid(True, linestyle=':', alpha=0.0) # 그리드 라인 제거
  plt.show()

# --- XOR 게이트 결정 경계 시각화 ---
plot_decision_boundary(x_xor, y_xor, mlp_xor, title="XOR MLP Decision Boundary (with Step Activation)")