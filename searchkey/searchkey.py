# coding=utf-8

""" キーボード画像, キーボードエッジ画像から各ボタンの位置、大きさを自動取得 """

import numpy as np
import cv2
from PIL import Image
import matplotlib.pyplot as plt


##################################
########## MAIN METHODS ##########
##################################
def test0():
    # 画像読み込み
    img = cv2.imread('./data/keybord.png')
    img = img[300:650, :1050, 0]


    # ガウシアンブラー
    #img = cv2.GaussianBlur(img, (3, 3), 0)

    # 変化を見る
    line = img[70, 1:] # 1
    line = img[118, 1:] # 2
    line = img[160, 1:] # 3
    line[7] = 223
    #line = img[205, 1:] # 4段目
    line = img[240, 1:] # 5
    #line = img[280, 1:] # 6段目
    #line = img[:, 80] # 縦
    #line[142], line[143] = 0, 0
    # ボタン数 21, +2(端)
    N = 21 * 2 + 2
    # 補正(ノイズ除去的なサムシング) - 手動
    """
    h = [146, 261, 408, 453, 498, 549, 588, 678, 723, 820, 904, 956]
    for i in h:
        line[i-1] = 223
    """
    # 補正(V字をなくす) - 自動？
    for i in range(1, len(line)-1):
        if line[i]==0 and line[i-1]==223 and line[i+1]==223:
            line[i]=223

    # エッジの位置決定(数画素ある白の平均から１画素に決定)
    i = 0
    wCnt = 0
    points = []
    while i < len(line):
        if line[i] > 0:
            wCnt += 1
        else:
            if wCnt > 0:
                p = sum(range(i-wCnt, i)) // wCnt
                points.append(p)
            wCnt = 0
        i += 1
    print(len(points))
    print(points)

    print("キーボードの大きさ : %d" % (points[-1]-points[0]))
    buttonlens = []
    buttonstarts = []
    for i in range(1, len(points)-1, 2):
        buttonlens.append(points[i+1]-points[i])
        buttonstarts.append(points[i]-points[0])
    print("ボタンのスタート : ", buttonstarts)
    print("ボタンの大きさ : ", buttonlens)
    
    # エッジの表示
    val = 0 # initialize
    cnt = 0
    points = []
    for i in range(len(line)):
        #if val != line[i]:
        if val == 0 and val != line[i]:
            points.append("index:%d(val:%d->%d)"%(i, val, line[i]))
            cnt += 1
        val = line[i]
    print(cnt)
    print(np.array(points))

    plt.figure()
    plt.gray()
    plt.imshow(img)
    plt.figure()
    plt.plot(line)
    plt.show()

    return



def test1():
    """ キーボード画像からエッジ検出 """
    # 画像読み込み, gray
    im_gray = cv2.imread('./data/applekey.png', 0)

    # ガウシアンブラー
    im_blur = cv2.GaussianBlur(im_gray, (7, 7), 0)

    # Cannyアルゴリズムでエッジ検出
    canny_edges = cv2.Canny(im_blur, 100, 200)
    canny_edges = cv2.GaussianBlur(canny_edges, (5, 5), 0)

    #th = cv2.threshold(im_blur, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)[1]

    # show
    def pltimshow(imgs):
        for img in imgs:
            plt.figure()
            plt.gray()
            plt.imshow(img)
    pltimshow([
        im_gray, 
        im_blur, 
        canny_edges, 
        #th
    ])
    plt.figure()
    plt.plot(canny_edges[400, :])
    plt.show()



##########################
########## MAIN ##########
##########################
if __name__ == '__main__':
    test0()
    #test1()
