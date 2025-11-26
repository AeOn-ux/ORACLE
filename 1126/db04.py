import oracledb
# db연결
def getConnection():
    return oracledb.connect(user="ora_user",password="1111",dsn="localhost:1521/xe")

title = ['학번','이름','국어','영어','수학','합계','평균']

while(True):
    print("[ 학생 성적 프로그램 ]")
    print("-"*30)
    print("1. 학생 성적 입력")
    print("2. 학생 성적 출력")
    print("3. 학생 성적 수정")
    print("4. 학생 성적 삭제")
    print("0. 프로그램 종료")
    print(""*30)
    choice = int(input('원하는 번호를 입력하세요.>>'))
    if choice==1:
        print("[ 학생 성적 입력]")
        name = input("학생 이름을 입력하세요>> ")
        kor = int(input("국어 점수를 입력하세요>> ")) # 문자로 변경
        eng = int(input("영어 점수를 입력하세요>> "))
        math = int(input("수학 점수를 입력하세요>> "))
        total = kor+eng+math
        avg = total/3
        # db저장
        conn = getConnection() # ora_user 사용자 생성
        cursor = conn.cursor() # sql developer 실생
        query = f"insert into stuscore values(\
                    stuscore_seq.nextval,'{name}','{kor}','{eng}','{math}',\
                        '{total}','{avg}',sysdate)"
        cursor.execute(query) # 쿼리문을 실행
        conn.commit() # insert,update,delete commit
        
        print("학생 성적을 저장합니다.")
        print()
        conn.close()
        
    elif choice==2:
        conn = getConnection() # db 연결
        cursor = conn.cursor()
        query = "select * from stuscore"
        cursor.execute(query) # 실행
        
        rows=cursor.fetchall() # 검색 내용 출력
        print("[ 학생 성적 출력]")
        print(""*70)
        print("{}\t{:13s}{}\t{}\t{}\t{}\t{}".format(*title))
        print(""*70)
        for row in rows:
            print("{}\t{:15s}{}\t{}\t{}\t{}\t{}".format(*row))
        
        print()
        conn.close() #db 연결종료
    else:
        print("[ 프로그램 종료 ]")
        break
print("프로그램을 종료합니다.")
