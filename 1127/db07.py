    
# 공백제거    
choice = input("숫자를 입력하세요.>>").strip()
if choice == "1":
    print("정답입니다.")
else:
    print("오답입니다.")
    


import oracledb

def getConnection():
    return oracledb.connect(user='ora_user',password='1111',dsn='localhost:1521/xe')

# db연결실행
conn = getConnection()
cursor = conn.cursor()
query = "select phone, substr(phone,0,3), substr(phone,5,3), substr(phone,9,3) from member"
cursor.execute(query)
rows = cursor.fetchall()

# 1. member테이블에서 phone컬럼을 분리해서 가져와서 출력
print(f"국번\t전번\t전번2")
print("-"*50)
for row in rows:
    print("{}\t{}\t{}".format(*row))
# 국번  전화번호1  전화번호2
#------------------------------
# 527   250      1397



# 2. member테이블에서 phone컬럼을 가져와서 파이썬에서 분리해서 출력
query = "select phone from member"
cursor.execute(query)
rows = cursor.fetchall()
print(f"국번\t전번\t전번2")
print("-"*50)
for row in rows:
    print(row)
    r = row[0].split("-")
    print("{}\t{}\t{}".format(*r))
# 국번  전화번호1  전화번호2
#------------------------------
# 527   250      1397



print("연결 : ",conn)
conn.close()