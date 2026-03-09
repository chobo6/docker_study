
#Dockerfile <-- 파일 생성
# 이미지 생성하는데 관련된 명령어가 모여있는 파일 (도커 명령어들...)
# 새롭게 이미지를 빌드하기위한 설정들...  설계도 역할 파일


이미지 생성 할때 그 기반이 되는 기본 이미지 설정
FROM 이미지

도커파일을 기반으로 -> "빌드" -> 새로운 이미지 생성 

도커파일 기반 빌드

# 현재 경로에 있는 Dockerfile 에 작성된 내용을 기준으로 새로운 이미지를 빌드한다
docker build -t 이미지이름 .

# 어떤 별도의 특정 경로에 있는 Dockerfile 로 참조해서 빌드하겠다  -f 옵션
docker build -t 이미지이름 -f MyDockerfile .
docker build -t 이미지이름 -f ./df/MyDockerfile .



###-----------------------------------------------------

# dockerfile01 폴더 기준 이미지 빌드

# 해당경로의 터미널 실행
# 이미지 빌드
docker build -t myimage01 .

# 빌드 완료 후 생성된 이미지 확인
docker images

# 새로만든 이미지로 컨테이너 실행
docker run -d --name mynew01 myimage01

# 내부에 명령어 접근
docker exec -it mynew01 bash

# bash 쉘에서 명령어 실행 jdk17
java -version

# 컨테이너 삭제
docker rm -f mynew01

###-----------------------------------------------------

COPY : 파일 또는 디렉토리 복사
COPY <Source> <Destination>
COPY <Host> <Container>

COPY . .
COPY *.jpg  .


###-----------------------------------------------------

# dockerfile02 폴더 기준 이미지 빌드
# dockerfile02 폴더 내부에 임의의 파일 생성
# test.txt, abc.txt

# dockerfile02 폴더 경로의 터미널창
#이미지 빌드
docker build -t df02 .

#이미지 조회
docker images

#도커 컨테이너 실행
docker run -d --name df02 df02

docker ps
docker exec -it df02 bash

#내부 접속 후 파일목록 확인
ls


# 이미지 삭제후 재빌드 하면서 확인
docker rm -f df02

# 변경사항이 생긴 파일로 다시 적용하고 싶으면?
# 변경상태로 이미지 재빌드 -> 이미지 -> 컨테이너 실행

docker build -t df02 .
docker run -d --name df02 df02
docker ps
docker exec -it df02 bash
ls

# 파일 내용 확인
cat test.txt
cat abcabc.txt

# .dockerignore -> 도커 빌드 처리시 제외할 대상
# .gitignore 와 유사함 -> git 관리 추적 제외

.dockerignore 파일 내부에 작성
Dockerfile


###---------------------------------------------------

ENTRYPOINT : 컨테이너가 시작했을 때 실행할 명령어 설정
ENTRYPOINT : ["/bin/bash", "-c", "sleep 500"]

bash# /bin/bash -c sleep 500

###---------------------------------------------------

# dockerfile03 폴더 기준 이미지 빌드

해당 경로로 터미널 이동
# 이미지 빌드
docker build -t df03 .
# 이미지 생성 확인
docker images
# 컨테이너로 실행
docker run df03
# -> 이미지 기반 컨테이너 실행 -> ENTRYPOINT 수행 -> hellomsg 출력 -> 출력끝
# -> 수행중인 프로세스가 없음 -> 컨테이너 종료
docker ps -a

# 컨테이너 삭제후, 백그라운드로 다시 실행
docker rm -f c1c0b1236621

docker run -d --name df03 df03
docker ps -a
# 수행된 내역을 로그로 확인
docker logs df03

###---------------------------------------------------

RUN : 빌드 시 (이미지 생성 과정) 컨테이너 내부에서 실행할 명령어 설정
# RUN 이미지 빌드하는 과정 실행
# ENTRYPOINT 이미지 생성 후 -> 컨테이너 실행할 때 수행할 명령어

###---------------------------------------------------

# dockerfile04 폴더 기준 이미지 빌드

# 터미널 창 해당 경로로 이동

# 이미지 빌드
docker build -t df04 .
docker images

docker run -d --name df04 df04
docker ps
# 내부 접근 명령어 실행 (bash 창 커맨드|터미널 창)
docker exec -it df04 bash

# 내부 bash 접근
# 이미지 빌드 과정에서 해당 리눅스 환경에 git 정상적으로 설치가 됐다? 확인
# git 버전 체크
git -v

###---------------------------------------------------

WORKDIR 작업 디렉토리 설정 (폴더)
작업을 진행하는 특정 기준이 되는 폴더 경로

###---------------------------------------------------

# dockerfile05 폴더 기준 이미지 빌드

# 이미지 빌드
docker build -t df05 .
docker run -d --name df05 df05
docker exec -it df05 bash

# /myworkdir
# /

# 접근된 시작 작업 경로 확인 -> /myworkdir
# COPY 복사된 파일 -> /myworkdir 파일들...


ls      # 파일 폴더 목록
pwd     # 현재 경로 확인
cd      # 경로 이동

###---------------------------------------------------

EXPOSE 컨테이너가 사용하는(외부 접근을 위해 오픈) 포트번호를 외부에 공지
* 단순 공지역할 (존재 유무에 따라서 작동이 달라지지 않음)

EXPOSE 9000


# 단순 공지일뿐, 실제 실행시에 포트 맵핑을 설정해야한다
docker run -d -p 9000:9000 image
docker run -d -p 8000:8000 image
docker run -d -p 9991:9000 image
        #   호스트포트:컨테이너포트


###-----------------------------------------------------

ENV 환경변수세팅    

#명령어 기준

docker run -d -e MYSQL_ROOT_PASSWORD=pw12341234 \
    -p 3306:3306 \
    --name mysqldb \
    -v d:/study/docker-study/volume/mysql:/var/lib/mysql \
    mysql

###-----------------------------------------------------    

# dockerfile06 폴더 기준 이미지 빌드

# 이미지 빌드
docker build -t df06 .
docker run -d -p 3306:3306 --name df06 df06
#Dockerfile 에 ENV 설정이 있으니, 따로 password 값을 -e 옵션으로 실행하지 않아도 된다
#비밀번호같은 내역은 ENV 설정으로 고정하기보다 -> 별도로 관리하여 실행시점에 -e 옵션으로 지정하는걸 권장

#내부 접근
docker exec -it df06 bash

env   #설정된 환경변수 확인
echo $MYSQL_ROOT_PASSWORD

#컨테이너 삭제
docker rm -f df06
