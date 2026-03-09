# 리액트 프로젝트를 웹서버 nginx 환경에 배포하는 형태

# prod  production
# dev   develop

# 프로젝트 생성

npx create-react-app my-prod-app

# my-prod-app 경로로 이동
# Dockerfile 생성
# .dockerignore 생성

# React 코드 -> 빌드 -> (html,css,js) -> nginx(webserver)

# my-prod-app 경로 터미널
# 이미지 빌드
docker build -t docker-my-prod-app .

docker images

# 컨테이너 실행
docker run -d -p 9988:80 --name docker-my-prod-app docker-my-prod-app
docker ps -a

# 내부접근 파일 존재 확인
docker exec -it docker-my-prod-app bash

# 파일 복사된 경로 이동해서 확인
cd /usr/share/nginx/html
ls

# 컨테이너 삭제
docker rm -f docker-my-prod-app