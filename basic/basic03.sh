# 컨테이너 내부 명령어 실행
# 내부 접근

# busybox 이미지 -> 컨테이너 실행
docker run -d --name busybox busybox
# 가벼운 초경량 리눅스  단순 리눅스 명령어 몇가지
docker rm -f busybox

# 도커 컨테이너는 어떤 실행중인 프로세스가 존재해야 컨테이너가 계속 실행상태로 유지됨
# 실행중인 프로세스가 없으면 컨테이너 바로 종료됨

# busybox 이미지 -> 무한 sleep 상태로 실행
docker run -d --name busybox busybox sleep infinite
# 테스트 리눅스
# sleep 무한으로 돌려라~ -> 프로세스가 실행중 -> 컨테이너가 바로 종료되지 않고 유지

# 실행중인 컨테이너 확인
docker ps

# busybox 리눅스 내부 접근
# execute 실행하다
docker exec -it busybox sh
# busybox 이름의 컨테이너에게 sh(cmd 커맨드창) 명령어를 수행하도록 실행하겠다
# -it 실시간 대화형 (현재 터미널창에 컨테이너 sh이 연결된 상태로 사용)

# 리눅스 os 환경 sh (커맨드창) 접속 된 상태
# 리눅스 os 사용 -> 리눅스 명령어
ls          # 현재 경로 파일목록
hostname    # 리눅스 입장에서 본인 hostname
whoami      # 접속중인 계정
pwd         # 현재 위치한 경로 표시
cd          # 경로(폴더) 이동
ifconfig    # 아이피 주소 확인 (도커 컨테이너 입장 linux 주소)


# 실행중인 컨테이너 삭제
docker rm -f busybox


# nginx 컨테이너 실행
docker run -d nginx

# nginx 컨테이너 내부 접속 (bash 커맨드 창)
docker exec -it 8fa6fff689a5 bash
docker exec -it 8fa6fff689a5 sh

# 내부 확인
ls
cd /etc/nginx
cat nginx.conf  # cat 화면에 출력

# nginx 컨테이너 os 관련 정보 출력
cat /etc/os-release