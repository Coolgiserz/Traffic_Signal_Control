#!/usr/bin/python
#coding:utf-8
#将轨迹数据读入mysql
import pyMySQL
f = open('track_data.txt','r')
data = f.read()
line = data.split("\n")
for row in line:
#    print row
    meta = row.split(",")
    id = meta[0]
    time = meta[1]
    x = meta[2]
    y = meta[3]
    speed = meta[4]
    cate = meta[5]
    pyMySQL.insert_data(id,time,x,y,speed,cate)

    
# for line in f.readlines():
#     print line
f.close()
