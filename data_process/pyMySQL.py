#!/usr/bin/python
#coding:utf-8
import MySQLdb
db = MySQLdb.connect("localhost","xxxxxx","xxxxxx","tb_school")
cursor = db.cursor()
table_name = 'traffic_test'

def insert_data(id,time,x,y,speed,cate):
    cursor.execute("insert ignore into "+table_name+" values(%s,%s,%s,%s,%s,%s)",(id,time,x,y,speed,cate))#使用ignore修饰，过滤重复主键的数据
    db.commit()