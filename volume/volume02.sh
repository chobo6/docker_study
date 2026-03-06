
# 2) 명시적으로 생성한 볼륨 사용 (Volume)

# 도커 볼륨 조회
docker volume ls

# 모든 볼륨 삭제
docker volume rm -f $(docker volume ls -q)

# postgres

docker volume create pg-storage

docker run --name pgdb -d \
    -v pg-storage:/var/lib/postgresql \
    -e POSTGRES_PASSWORD=pgpw \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB=mypgdb \
    -p 5432:5432 \
    postgres


# vs code PostgreSQL extension 설치 -> 실제 경로 접속

# select * from pg_tables;

CREATE TABLE TEST_TB (
    id INT,
    name VARCHAR(20)
);

select * from pg_tables
where tablename = 'test_tb';

# 테이블 생성 -> 기존 컨테이너 삭제
# -> 새로운 컨테이너로 실행 (기존 생성된 pg-storage 볼륨으로 연결)

# 새로운 컨테이너 DB 접속 조히 -> test_tb 만들어둔 테이블이 존재

# 컨테이너 삭제
docker rm -f pgdb

# 컨테이너 다시 실행
docker run --name pgdb -d \
    -v pg-storage:/var/lib/postgresql \
    -e POSTGRES_PASSWORD=pgpw \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB=mypgdb \
    -p 5432:5432 \
    postgres


# 컨테이너 삭제
docker rm -f pgdb
# 볼륨 조회
docker volume ls
# 볼륨 삭제
docker volume rm pg-storage


##-------------------------------

# MySQL 명시적인 볼륨사용

docker volume create mysql-storage

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
    -p 3306:3306 \
    --name mysqldb \
    -v mysql-storage:/var/lib/mysql \
    mysql