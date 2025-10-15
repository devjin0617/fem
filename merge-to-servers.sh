#!/bin/bash

# 현재 브랜치 이름 저장
CURRENT_BRANCH=$(git branch --show-current)

echo "========================================="
echo "현재 브랜치: $CURRENT_BRANCH"
echo "server/dev와 server/staging에 순차적으로 머지합니다."
echo "========================================="
echo ""

# 1. server/dev에 머지
echo "📌 1단계: server/dev에 머지 시작..."
echo "-----------------------------------------"

./merge-to-server-dev.sh

if [ $? -ne 0 ]; then
    echo "❌ server/dev 머지 실패. 작업을 중단합니다."
    exit 1
fi

echo ""
echo "✅ server/dev 머지 완료!"
echo ""

# 2. server/staging에 머지
echo "📌 2단계: server/staging에 머지 시작..."
echo "-----------------------------------------"

./merge-to-server-staging.sh

if [ $? -ne 0 ]; then
    echo "❌ server/staging 머지 실패. 작업을 중단합니다."
    exit 1
fi

echo ""
echo "========================================="
echo "✅ 모든 작업 완료!"
echo "   - server/dev: 머지 완료"
echo "   - server/staging: 머지 완료"
echo "   - 현재 브랜치: $CURRENT_BRANCH"
echo "========================================="

