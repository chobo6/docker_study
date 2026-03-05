# 도커 이미지

# 도커 허브 (이미지 관리 온라인 사이트) ex:github, mvn-repository
# https://hub.docker.com/


# 이미지 도커 허브에서 다운로드
docker pull nginx

# docker run 실행 이미지가 없으면 알아서 다운로드

# 보유하고 있는 이미지 목록 조회
docker images
docker image ls

# 이미지 삭제하기
docker image rm 이미지명 or 이미지ID
docker rmi 이미지명 or 이미지ID

# 다운로드 받은 nginx 이미지 컨테이너 실행
docker run -d --rm -p 9911:80 --name ngx-srv nginx

# 실행중인 도커 컨테이너 종료(삭제)
docker rm -f ngx-srv

docker run : 포그라운드 실행
docker run -d : 백그라운드 실행

docker run -d --rm -p 9911:80 --name ngx-srv nginx
docker run --rm -p 9911:80 --name ngx-srv nginx

# 동일 이미지 -> 여러개 컨테이너 실행
# --name : 컨테이너의 이름(별칭) 세팅

docker run -d --rm -p 9911:80 --name ngx-srv1 nginx
docker run -d --rm -p 9922:80 --name ngx-srv2 nginx

# 컨테이너 삭제
docker rm -f ngx-srv1
docker rm -f ngx-srv2

# 컨테이너 종료
docker stop 컨테이너 이름 or ID # 윈도우->시작->전원->시스템종료
docker kill 컨테이너 이름 or ID # 강제종료

# 중지된 컨테이너 재실행
docker start 컨테이너 이름 or ID

# 컨테이너 삭제
docker rm       #삭제
docker rm -f    #강제삭제