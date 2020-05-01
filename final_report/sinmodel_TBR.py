import matplotlib.pyplot as plt
import numpy as np
from tbr_reg import set_plotting_style

set_plotting_style()

wn = 1


def f(x, y):
    return np.sin(wn*2*np.pi*(x-0.5))/2 + np.sin(wn*2*np.pi*(y-0.5))/2 + 1


xs = np.linspace(0, 1, 1000)
ys = np.linspace(0, 1, 1000)

X, Y = np.meshgrid(xs, ys)

z = f(X, Y)
C = plt.contourf(X, Y, z, 9)
cols = ['w' if level < 0.6 else 'k' for level in C.levels]
C = plt.contour(X, Y, z, 9, colors=cols, linewidths=1)
plt.clabel(C, fontsize=18, colors=cols, fmt='%0.1f')
plt.xlabel('Continuous parameter $x_1$')
plt.ylabel('Continuous parameter $x_2$')
plt.xticks([0, 1])
plt.yticks([0, 1])
plt.tight_layout()
plt.show()
