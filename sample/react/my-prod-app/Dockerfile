# node.js 이미지 기반, 리액트 프로젝트 빌드용 사용
FROM node:22-alpine AS build

# 작업 디렉토리 /usr/app 폴더 기준 실행
WORKDIR /usr/app

# package.json 복사 -> npm install
COPY package.json .

# 빌드 과정 명령어 실행
# package.json 의존성 라이브러리 기준으로 설치
RUN npm install

# 현재 경로 리액트 프로젝트 소스파일 복사
COPY . .
# host container (WORKDIR)

# 명령어 실행 -> 리액트 프로젝트 빌드 수행
RUN npm run build
# 프로젝트경로/build 폴더 생성 (파일들...) -> /usr/app/build

# 배포용 기반 이미지 웹서버 nginx
FROM nginx

# 빌드용 컨테이너 생성된 build 폴더 내부 파일들 -> nginx 웹서버 인식 경로로 복사 /usr/share/nginx/html
COPY --from=build /usr/app/build    /usr/share/nginx/html
# nginx 이미지 내부에 폴더 구조 -> /usr/share/nginx/html