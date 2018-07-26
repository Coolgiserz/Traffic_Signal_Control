#!usr/bin/python
#coding:utf-8
#轨迹点处理成LinsString,WKT type
import MySQLdb
db = MySQLdb.connect("localhost","xxx","xxx","tb_school")
count_cursor = db.cursor()
cursor = db.cursor()
cursor.execute("SELECT vehicle_id,x_coord,y_coord FROM traffic_test")
count_cursor.execute("select vehicle_id,count(*) from traffic_test group by vehicle_id having count(*)>0")
count_lst = count_cursor.fetchall()
f = open('trace_wkt.txt','w+')
print 'the num of record:%s'%len(count_lst)#5415
print 'count_lst sample:',count_lst[0]
#data sample:('000898a7623ce29142a7daeaa7ab0612', 521410.46875, 54781.13671875)
for i in range(len(count_lst)):
    line_id = count_lst[i]#轨迹id
    flag = 0
    count = count_lst[i][1]
    count = int(count)
    print '第',i,'条轨迹'
    for j in range(count):
        data = cursor.fetchone()
        if flag==0:
            f.write('LINESTRING')#WKT type
            f.write(' ')
            f.write(str(count))
            f.write(' ')
            flag=1
        f.write(str(data[1]))
        f.write(' ')
        f.write(str(data[2]))
        f.write(' ')

        if j==count-1:
            f.write('\n')
