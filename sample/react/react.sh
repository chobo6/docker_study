# 리액트 프로젝트 생성

npx create-react-app my-dev-app

# 리액트 프로젝트 -> Docker Imagae
# 생성된 Image 기반 -> 컨테이너 실행

리액트 프로젝트 /my-dev-app 최상단 경로에서 Dockerfile 생성 -> 작성
.dockerignore 파일도 생성하여 제외할 파일 목록 작성

# 해당 프로젝트 경로 이동
# 도커 이미지 빌드
docker build -t docker-my-dev-app .

# 생성된 이미지 확인
docker images

# 컨테이너 실행
docker run -d --name docker-my-dev-app -p 3333:3000 docker-my-dev-app
docker ps -a

# 컨테이너 내부 접근해서 프로젝트 파일들 존재 확인
docker exec -it docker-my-dev-app bash
docker exec -it docker-my-dev-app sh

/app 경로에 리액트 프로젝트 파일들 조회

docker rm -f docker-my-dev-app