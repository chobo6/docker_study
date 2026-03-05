
# 로그 확인


# 포그라운드 실행
docker run -p 9922:80 --name ngx1 nginx

# 포그라운드 실행 중 Ctrl + C 종료

# 기존 중지된 컨테이너 삭제
docker rm -f ngx1

# 백그라운드 실행
docker run -d -p 9922:80 --name ngx1 nginx


# 로그 출력
docker logs 컨테이너명 or ID

# 끝부분 몇 라인만 출력
docker logs --tail 출력할 라인 수 컨테이너명 or ID

docker logs --tail 10 ngx1
docker logs --tail 5 ngx1

# 로그를 계속 추적하면서 출력 follow
docker logs -f ngx1

# --since Xs ~부터
# --until Xs ~까지
# 명렁어실행 시점 기준

docker logs --since 20s ngx1
docker logs --until 20s ngx1

# 최근 60초
docker logs --since 60s ngx1


# s : second 초단위
# m : minute 분단위
docker logs --since 120s --until 60s ngx1
docker logs --since 5m --until 1m ngx1


# 최근 로그 몇 라인 확인 + 계속 실시간 추적 확인
docker logs --tail 5 -f ngx1

# 로그 추적중 Ctrl + C 종료 -> 로그 추적만 종료

# docker run 포그라운드 상태 -> Ctrl + C 종료 -> 컨테이너 종료