# 경계 결정 시각화
#from pickle import LIST
from matplotlib.colors import ListedColormap

def plot_decision_boundary(x, y, model):
  cmap_light = ListedColormap(['#FFAAAA', '#AAAAFF'])
  cmap_bold = ListedColormap(['#FF0000', '#0000FF'])

  h = .02 # mesh grid 간격
  x_min, x_max = x[:,0].min() - 1, x[:,0].max() + 1
  y_min, y_max = x[:,1].min() - 1, x[:,1].max() + 1
  xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))

  z = model.predict(np.c_[xx.ravel(), yy.ravel()])
  z = z.reshape(xx.shape)

  plt.figure(figsize=(8,6))
  plt.contourf(xx, yy, z, cmap=cmap_light)

  # 실제 데이터 포인트 표시
  plt.scatter(x[:,0], x[:,1], c=y, cmap=cmap_bold, edgecolor = 'k', s=100, marker='o')
  plt.xlabel('Input 1')
  plt.ylabel('Input 2')
  plt.title('Perceptron Decision Boundary')
  plt.show()

# AND 게이트 결정 경계 시각화
plot_decision_boundary(x_and, y_and, ppn_and) 