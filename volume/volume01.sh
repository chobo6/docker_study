

# volume 저장 공간 (스토리지)

# DB 기반 컨테이너 -> 컨테이너 사용 종료 -> 삭제?
#           -> 컨테이너 내부 저장소(폴더/파일)에 저장된 데이터가 보존 X

# 컨테이너 내부에 저장되는 데이터 -> 컨테이너 외부에 데이터를 저장하기 위한 개념 -> 도커 볼륨


# 도커 볼륨
# 1) 호스트의 특정 폴더 경로를 이용 (Bind Mount)
# 2) 명시적으로 생성한 볼륨 사용 (Volume)







# 1) 호스트의 특정 폴더 경로를 이용 (Bind Mount)
# -v 호스트 디렉토리 경로:컨테이너 디렉토리 경로

# MySQL DB 사용 기반 확인

### 컨테이너 상태만으로는 데이터가 보존되지 않는다 -> 예시

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 -p 3306:3306 mysql

# -p 포트매핑   호스트포트:컨테이너포트

# 컨테이너 이름 or ID 확인
docker ps

# 5b0bb893fc59
# 내부 명령어 실행 -> 내부 접근
docker exec -it 5b0bb893fc59 bash

# 환경변수 확인
env
export
# 특정 환경변수 값 확인
echo $환경변수명
echo $MYSQL_ROOT_PASSWORD


# 컨테이너 내부에 접속한 상태에서 mysql DB서버 접속
mysql -u root -p
# 비번 입력 pw12341234

# mysql 접속 후, 쿼리로 실행
show databases;
create database testdb;

# 생성 확인 후, 기존 만들어진 컨테이너 삭제 -> 다시 실행
docker rm -f

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 -p 3306:3306 --name mysqldb mysql

# 다시 컨테이너 실행한 상태에서 접속해서 아까 만들어둔 testdb가 유지/존재 확인

docker exec -it mysqldb bash
mysql -u root -p
# 비번 입력 pw12341234
show databases;

docker rm -f mysqldb

###-----------------------------------------------------


### Volume 사용 -> 변경사항 유지 확인 예시

# -v 호스트경로:컨테이너경로

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
    -p 3306:3306 \
    --name mysqldb \
    -v d:/study/docker_study/volume/mysql:/var/lib/mysql \
    mysql

# 내부 접근
docker exec -it mysqldb bash
# 데이터 저장 경로 확인
cd /var/lib/mysql
ls

mysql -u root -p
# 비번 입력 pw12341234
show databases;
create database testdb;

docker rm -f mysqldb
# 컨테이너를 삭제 O
# volume bind mount 폴더 (데이터) 삭제하지 않은 상태

# 컨테이너 삭제후, 다시 동일한 볼륨폴더로 재실행시
# 기존에 만들어둔 testdb가 유지되는지 확인

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
    -p 3306:3306 \
    --name mysqldb \
    -v d:/study/docker_study/volume/mysql:/var/lib/mysql \
    mysql

docker exec -it mysqldb bash
mysql -u root -p
# 비번 입력 pw12341234
show databases;

# testdb 존재여부 확인
docker rm -f mysqldb
