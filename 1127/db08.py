import oracledb

def getConnection():
    return oracledb.connect(user='ora_user',password='1111',dsn='localhost:1521/xe')

# db연결실행
# conn = getConnection()
# cursor = conn.cursor()
# query = "select salary,to_char(salary*12,'999,999') y_salary,to_char(salary*12*1743,'999,999,999') y_ksalary from employees"
# cursor.execute(query)
# rows = cursor.fetchall()

# 월급 년봉 원화 천단위 표시해서 출력하시오.
# -------------------------------------
# 2000 2000*12 2000*12*1743

# print("-"*50)

# print('{}\t{}\t{}'.format('월급','년봉','연봉'))
# for row in rows:
#     print('{}\t{}\t{}'.format(*row))
    
# conn.close()


########
while(True):
    score = int(input("점수를 입력하세요.>>"))
    # db 연결실행
    conn = getConnection()
    cursor = conn.cursor()
    query = f"select count(total) from stuscore where total>={score} "
    cursor.execute(query)
    rows = cursor.fetchall()
    print(rows)
    # 입력한 점수보다 합계점수가 높은 학생이 몇명인지 출력하시오.
    # stuscore테이블 total컬럼을 비교해서
    # query = ""
    
    print("입력점수 :",score)
    print("입력한 점수보다 높은 학생수 :",rows[0][0])
    
conn,close()