import sys, os
import d5
import numpy as np
import cv2
import time
import math
import  random
import re
import getopt
from glob import glob
from threading import Thread
from scipy import ndimage
from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QMainWindow, QPushButton
from PyQt5.QtGui import QIcon, QPixmap, QImage, QMovie
from PyQt5.QtCore import Qt, QTimer, QSize, QRect, QPoint, QThread, pyqtSignal

class ExampleApp(QMainWindow, d5.Ui_MainWindow):

    def __init__(self):
      np.set_printoptions(linewidth=100000)
      super().__init__()
      self.setupUi(self)       
      
      self.pushButton.clicked.connect(self.captur)
      self.pushButton_2.clicked.connect(self.obr)
      self.pushButton_3.clicked.connect(self.comandos)
      self.pushButton_4.clicked.connect(self.next_com)

           

      self.lfl = True
      self.flag_z = False
      self.nocam = False
      self.debug = True
      self.gray = None
      self.gradus = 0   
      self.img = None
      self.imgb = None
      self.iter = 0
      self.img_h = None
      

    def next_com(self):
        if self.debug: print('# com',self.iter)
        if self.iter > 2:
            self.iter=0
        if self.iter == 0:
            self.captur()
        if self.iter == 1:
            self.obr()            
        if self.iter == 2:
            self.comandos()        
        self.iter += 1
        
    def reset_grad (self):
        self.gradus = 0     

    def captur(self):
        if self.debug: print('Captur')
        if self.nocam:
            crop_img = cv2.imread("und.png",0)
            crop_img = self.rotator(crop_img,self.gradus)
            if self.debug: print(crop_img.shape)            
        else:
            hostname = self.lineEdit.text()
            # if self.debug: print(hostname)
            # response = os.system("ping -n 1 " + hostname)
            # if self.debug: print(response)
            # if response == 0:
            cap = cv2.VideoCapture('rtsp://'+ hostname +':554/user=admin&password=&channel=1&stream=0?.sdp')        
            # if(cap.isOpened()):
            ret, frame = cap.read()
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            if self.debug: print(gray.shape)
            gray = self.rotator(gray,self.gradus) 
            gray = self.radial(gray)            
            if self.debug: print(gray.shape)
            crop_img = gray[120:520, 500:900]
            if self.debug: print(crop_img.shape)
            cv2.imwrite("und.png", crop_img)
            crop_img = np.array(crop_img [:,:,0], dtype=np.uint8)
            if self.debug: print(crop_img.shape)

        qimage = QImage(crop_img, crop_img.shape[0],crop_img.shape[1],QImage.Format_Indexed8)          
        pixmap = QPixmap(qimage) #QPixmap('und.png')
        pixmap = pixmap.scaledToHeight(256)        
        self.label.setPixmap(pixmap)        

    def obr(self):
        if self.debug: print('Binaryse')
        img = cv2.imread('und.png',0)        
        tr1, tr2, tr3 = self.horizontalSlider.value(), self.horizontalSlider_2.value(), self.horizontalSlider_3.value()
        ret,th1 = cv2.threshold(img,tr1,tr2,cv2.THRESH_BINARY)   
        self.imgb =  th1.copy()     
        cv2.imwrite("tr.png", th1)
        pixmap = QPixmap('tr.png')
        pixmap = pixmap.scaledToHeight(256)
        self.label_2.setPixmap(pixmap)
        
        very_resized_image = cv2.resize(th1, (int(self.lineEdit_2.text(),10), int(self.lineEdit_2.text(),10)))
        img = very_resized_image.copy()
        cv2.imwrite("img.png", img)
        img[img<tr3+1] = 1
        img[img>tr3] = 0        
        self.img = img.copy()
        self.img_h = img.shape[0]
        if self.debug: print(img)
        self.textEdit.setText(str(img))
                      
    def radial(self,gray):
        camera_matrix = np.array([[1.26125746e+03, 0.00000000e+00, 9.40592038e+02],
                                  [0.00000000e+00, 1.21705719e+03, 5.96848905e+02],
                                  [0.00000000e+00, 0.00000000e+00, 1.00000000e+00]]);
        dist_coefs = np.array([-0.49181345,  0.25848255, -0.01067125, -0.00127517, -0.01900726]);        
        img = cv2.cvtColor(gray, cv2.COLOR_BGR2RGB)
        h,  w = img.shape[:2]
        newcameramtx, roi = cv2.getOptimalNewCameraMatrix(camera_matrix, dist_coefs, (w, h), 1, (w, h))
        dst = cv2.undistort(img, camera_matrix, dist_coefs, None, newcameramtx)
        dst = cv2.cvtColor(dst, cv2.COLOR_BGR2RGB)
        # crop and save the image
        x, y, w, h = roi
        dst = dst[y:y+h-50, x+70:x+w-20]

        return dst
                          
    def comandos(self):    
        self.img_h = int(self.lineEdit_2.text())# 20
        zx_h = int(self.lineEdit_3.text())#2
        zx_c = int(self.lineEdit_4.text())#9
        pr_h = int(self.lineEdit_5.text())#4
        pr_c = int(self.lineEdit_6.text())#9
        pogr = int(self.lineEdit_9.text())# 20%
        dop = int(self.lineEdit_10.text())# 1    
        
        imgz = self.lay0(self.imgb,pr_h-1,zx_h-1,pr_c-1,zx_c-1,pogr)
        if self.debug: print(imgz)
        c1, c2 = self.lay3(imgz,pr_h,pr_c,zx_h,zx_c,dop)
        
        pixmap = QPixmap('s.png')
        pixmap = pixmap.scaledToHeight(64)
        self.label_3.setPixmap(pixmap)
        self.label_4.setPixmap(pixmap)
        self.label_5.setPixmap(pixmap)
        self.label_6.setPixmap(pixmap)
        self.label_7.setPixmap(pixmap)
        
        if self.debug: print('')
        if c1 == 'nul':
            if self.debug: print('image rotate')
            self.gradus = self.gradus + 7
         
        if c2 == 'nul':
            if self.debug: print('zahwat poworot')
            pixmap = QPixmap('rot.png')
            pixmap = pixmap.scaledToHeight(64)
            self.label_7.setPixmap(pixmap)                  
        elif c1 == '01': #vv
            pixmap = QPixmap('vv.png')
            pixmap = pixmap.scaledToHeight(64)
            self.label_5.setPixmap(pixmap)       
        elif c1 == '10': #vn
            pixmap = QPixmap('vn.png')
            pixmap = pixmap.scaledToHeight(64)
            self.label_6.setPixmap(pixmap)            
        elif c2 == '10': #vl
            pixmap = QPixmap('vl.png')
            pixmap = pixmap.scaledToHeight(64)
            self.label_3.setPixmap(pixmap)        
        elif c2 == '01': #vp
            pixmap = QPixmap('vp.png')
            pixmap = pixmap.scaledToHeight(64)
            self.label_4.setPixmap(pixmap)              
        elif c1 == '00' and c2 == '00': #vs
            pixmap = QPixmap('z.png')
            pixmap = pixmap.scaledToHeight(256)
            self.label_7.setPixmap(pixmap)           

    def rotator(self,img, angle):
      '''повернет картинку на заданный угол заполнив углы белым фоном'''
      rows = img.shape[0]
      cols = img.shape[1]
      img_center = (cols / 2, rows / 2)
      M = cv2.getRotationMatrix2D(img_center, angle, 1)
      rotated_image = cv2.warpAffine(img, M, (cols, rows), borderMode=cv2.BORDER_CONSTANT, borderValue=(255,255,255))
      return rotated_image

    def get_centr_angle_rect(self,img, sq, proc ):
      '''возвращает центр, ширину, высоту и угол найденного по площади прямоугольника с допуском в процентах'''
      cnts, hierarchy = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
      if self.debug: print(sq)
      if self.debug: print(img.shape)
      for c in cnts:
        area = int(cv2.contourArea(c))
        minar = int(sq-10-sq*proc/100)
        maxar = int(sq+10+sq*proc/100)
        if self.debug: print(minar,maxar) 
        if self.debug: print('square',area)
        bul1 = (maxar > area) 
        bul2 = (area > minar)
        bul3 = bul1 and bul2
        if self.debug: print(bul1,bul2, bul3)
        if bul3:
          rect = cv2.minAreaRect(c)
          if self.debug: print('rect', rect)
          centrx = int(rect[0][0])
          centry = int(rect[0][1])
          x = int(rect[1][0])
          y = int(rect[1][1])
          box = cv2.boxPoints(rect)
          box = np.int0(box)
          edge1 = np.int0((box[1][0] - box[0][0],box[1][1] - box[0][1]))
          edge2 = np.int0((box[2][0] - box[1][0], box[2][1] - box[1][1]))  
          if self.debug: print('edge',cv2.norm(edge1),cv2.norm(edge2))    
          dl = cv2.norm(edge2)
          usedEdge = edge1
          if cv2.norm(edge2) > cv2.norm(edge1):
              usedEdge = edge2
              dl = cv2.norm(edge1)
          reference = (1,0)
          angle = 180.0/math.pi * math.acos((reference[0]*usedEdge[0] + reference[1]*usedEdge[1]) / (cv2.norm(reference) *cv2.norm(usedEdge)))
          angle = int(angle)
          if self.debug: print('angle edge',angle)
          # angle = rect[-1]

          # if angle < -45:
          #     angle = -(90 + angle)
          # else:
          #     angle = -angle

          if self.debug: print(angle,"deg")
          if self.debug: print (centrx,centry,x,y,angle)
          return centrx,centry,x,y,angle
      return -1,-1,-1,-1,-1

    def draw_rot_rect(self,img,centrx,centry,x,y,angle):
      '''рисует прямоугольник заданных размеров, угла поворота, относительно центральной точки'''
      x1=centrx-y/2
      x2=centrx+y/2
      y1=centry-x/2
      y2=centry+x/2
      h = img.shape[0]
      # angle = abs(270-angle)
      if self.debug: print('draw',angle)
      rm = cv2.getRotationMatrix2D((centrx,centry),angle,1)
      box = np.array([[[x1,y1],[x1,y2],[x2,y2],[x2,y1]]],dtype=np.uint8)
      rbox = np.int0(cv2.transform(box, rm))[0]
      cv2.drawContours(img,[rbox],0,(1, 1, 1), -1)

    def lay0 (self,img,predmetx,zahvatx,predmety,zahvaty,proc):
      '''улучшайзер и уменьшайзер зашумленных изображений ака идеализатор'''
      imgz = np.zeros((self.img_h,self.img_h), dtype=np.uint8)
      pcentrx,pcentry,px,py,pangle = self.get_centr_angle_rect(img, int(self.lineEdit_7.text()), proc)
      pcentrx,pcentry = round(pcentrx/self.img_h),round(pcentry/self.img_h)
      if px == -1:
        if self.debug: print('no predmeto')
      else:self.draw_rot_rect(imgz,pcentrx,pcentry,predmetx,predmety,pangle)

      zcentrx,zcentry,zx,zy,zangle = self.get_centr_angle_rect(img, int(self.lineEdit_8.text()), proc)
      zcentrx,zcentry = round(zcentrx/self.img_h),round(zcentry/self.img_h)
      if zx == -1:
        if self.debug: print('no zahvato')
      else:self.draw_rot_rect(imgz,zcentrx,zcentry,zahvatx,zahvaty,zangle)

      return imgz#,imgp

    def lay1(self,img,dist,dop):
      arr_h = img.shape[0] - dist - 1
      arr = np.zeros((arr_h, img.shape[0]), dtype=np.int8)
      ones = np.ones(dist, dtype=np.int8)
      for i in range(arr.shape[0]):
        for j in range(arr.shape[1]):
          if(img[i,j]==0 and img[i+dist+1,j]==0 and np.sum(ones-img[i+1:i+dist+1,j])<=dop):
            arr[i,j]=1
      return arr

    def lay2(self,img,dist,dop):  
      ones = np.ones(dist, dtype=np.int8)
      x = np.zeros((img.shape[0]), dtype=np.int8)
      y = np.zeros((img.shape[1]), dtype=np.int8)
      for i in range(img.shape[0]):
        for j in range(img.shape[1]-dist):
          if(np.sum(img[i,:])<=dist+dop and np.sum(ones-img[i,j:j+dist])<=dop):
            x = img[:,j+dist//2].copy()
            y = img[i,:].copy()
            return x,y
      return x,y

    def lay3 (self,img,pr_h,pr_c,zx_h,zx_c,dop):
      oupr1 = self.lay1(img,pr_h,dop)
      if self.debug: print(oupr1)
      uopr21,uopr22 = self.lay2(oupr1,pr_c,dop)
      if self.debug: print(uopr21)
      
      if self.debug: print(uopr22)
      ouzx1 = self.lay1(np.rot90(img),zx_h,dop)
      if self.debug: print(np.rot90(ouzx1, k=-1))
      uozx21,uozx22 = self.lay2(ouzx1,zx_c,dop)
      uozx21 = uozx21[::-1]
      uozx22 = uozx22#[::-1]
      if self.debug: print(uozx21)
      if self.debug: print(uozx22)
      com_h = self.vv(uopr21,uozx22,pr_h)
      com_v = self.vv(uozx21,uopr22,zx_h)
      if self.debug: print(com_h)
      if self.debug: print(com_v)
      return com_h, com_v

    def vv(self,arr1,arr2,dest):
      com='nul'
      if(np.flatnonzero(arr1).shape[0]>0 and np.flatnonzero(arr2).shape[0]>0):
        arr3 = np.zeros(self.img_h, dtype=np.int8)
        arr3[1+np.flatnonzero(arr1)[0]:1+np.flatnonzero(arr1)[0]+dest]=1
        arr4 = arr2[np.flatnonzero(arr3)]
        if self.debug: print(arr4)
        if self.debug: print(arr3)
        if self.debug: print(arr1)
        if self.debug: print(arr1)
        if(abs(np.flatnonzero(arr2)[0] - np.flatnonzero(arr1)[0]) < abs(np.flatnonzero(arr2)[-1] - np.flatnonzero(arr1)[0]) and abs(np.flatnonzero(arr2)[0] - np.flatnonzero(arr1)[0]+dest) < abs(np.flatnonzero(arr2)[-1] - np.flatnonzero(arr1)[0]+dest)):
          com='01' #vv_vp
        else:
          com='10' #vn_vl
        if np.sum(arr2[np.flatnonzero(arr3)])>dest-1:
          com='00' #s_s
      return com
      
    

def main():
  np.set_printoptions(linewidth=100000)
  app = QApplication(sys.argv)
  form = ExampleApp()
  form.show()
  app.exec()


if __name__ == '__main__':
    main()
    
    
