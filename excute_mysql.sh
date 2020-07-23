
#!/bin/bash
# Define log 
TIMESTAMP=`date +%Y%m%d%H%M%S` #日期
LOG=execute_sql_${TIMESTAMP}.log  #日志名称
echo "Start execute sql statement at `date`." >>${LOG}
# execute sql start 
HOSTNAME="127.0.0.1"     #数据库信息
PORT="3306"                 #端口号
USERNAME="root"             #数据库账户
PASSWORD="root"             #数据库密码
DBNAME="ceshi_data"  #数据库名称
TABLENAME1="u_order"        #数据库中表的名称
TABLENAME2="u_order_item" #数据库中表的名称
#执行的sql语句
delete_sql="DELETE o,d
FROM ${TABLENAME1}  o
LEFT JOIN ${TABLENAME2}  d ON d.order_id = o.id
WHERE 1=1
AND o.state = 0
AND DATE(o.expire_date) < DATE(NOW())"
 
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${delete_sql}"
