
# DB 실행
# rdbms oracle/mysql/mariaDB/mssql/postgresql


# PostgreSQL DB

# pg-storage 도커 볼륨 생성
docker volume create pg-storage

# 도커 볼륨 조회
docker volume ls

# postgres 이미지 -> 컨테이너 실행
# 볼륨 옵션 설정
# 환경변수 옵션 설정
docker run --name pgdb \
        -v pg-storage:/var/lib/postgresql/data \
        -e POSTGRES_PASSWORD=pgpw \
        postgres

# 포그라운드 실행
docker rm -f pgdb

# 필요한 환경변수 옵션들 추가
docker run --name pgdb -d  \
        -v pg-storage:/var/lib/postgresql \
        -e POSTGRES_PASSWORD=pgpw \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_DB=mypgdb \
        -p 5432:5432 \
        postgres


# pgdb 컨테이너 내부 접속 (터미널 접근)
docker exec -it pgdb bash

# 내부 접속 -> 컨테이너 os 환경 -> 환경변수 확인
env

# vs code PostgreSQL extension 설치 -> 실제 경로 접속

# 컨테이너 삭제
docker rm -f pgdb

# 볼륨 조회
docker volume ls

# 도커 볼륨 삭제
docker volume rm pg-storage