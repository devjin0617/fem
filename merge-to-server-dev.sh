#!/bin/bash

# 현재 브랜치 이름 저장
CURRENT_BRANCH=$(git branch --show-current)

echo "현재 브랜치: $CURRENT_BRANCH"

# server/dev 브랜치로 체크아웃
echo "server/dev 브랜치로 이동 중..."
git checkout server/dev

if [ $? -ne 0 ]; then
    echo "❌ server/dev 브랜치로 체크아웃 실패"
    exit 1
fi

# server/dev 브랜치 최신화 (선택사항)
echo "server/dev 브랜치 pull 중..."
git pull origin server/dev

# 이전 브랜치를 server/dev에 머지
echo "$CURRENT_BRANCH 브랜치를 server/dev에 머지 중..."
git merge $CURRENT_BRANCH

if [ $? -ne 0 ]; then
    echo "❌ 머지 실패. 충돌을 해결해주세요."
    exit 1
fi

echo "✅ 머지 성공!"

# 원래 브랜치로 돌아가기
echo "$CURRENT_BRANCH 브랜치로 복귀 중..."
git checkout $CURRENT_BRANCH

if [ $? -ne 0 ]; then
    echo "❌ $CURRENT_BRANCH 브랜치로 체크아웃 실패"
    exit 1
fi

echo "✅ 작업 완료! $CURRENT_BRANCH 브랜치로 돌아왔습니다."

