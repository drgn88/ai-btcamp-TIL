# OR perceptron

import numpy as np
import matplotlib.pyplot as plt

class Perceptron:
  def __init__(self, input_size, lr=0.1, epochs=10):
    self.weights = np.zeros(input_size)
    self.bias = 0
    self.lr = lr
    self.epochs = epochs
    self.errors = []

  def activation(self, x):
    return np.where(x > 0, 1, 0)

  def predict (self, x):
    linear_output = np.dot(x, self.weights) + self.bias
    return self.activation(linear_output)

  def train(self, x, y):
    for epoch in range(self.epochs):
      total_error = 0
      for xi, target in zip(x, y):
        prediction = self.predict(xi)
        update = self.lr * (target - prediction)
        self.weights += update * xi
        self.bias += update
        total_error += int(update != 0.0)
      self.errors.append(total_error)
      print(f"Epoch {epoch+1}/{self.epochs}, Errors: {total_error}")

# OR 게이트 데이터
x_or = np.array([[0,0],[0,1],[1,0],[1,1]])
y_or = np.array([0,1,1,1])

# 퍼셉트론 모델 훈련
ppn_or = Perceptron(input_size=2)
ppn_or.train(x_or, y_or)

# 예측 결과 확인
print("\nOR Gate Test: ")

for x in x_and:
  print(f"Input: {x}, predicted Output: {ppn_or.predict(x)}")