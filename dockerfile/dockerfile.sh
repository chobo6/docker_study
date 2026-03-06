
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