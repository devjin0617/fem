#!/bin/bash

# 5단계: 버전 업데이트 및 배포

echo "🚀 FEM 버전 업데이트 - v1.0.1"
echo ""

# 변경사항 확인
echo "📝 변경된 파일 확인 중..."
git status

echo ""
read -p "변경사항을 커밋하고 배포하시겠습니까? (y/n): " CONFIRM

if [ "$CONFIRM" != "y" ]; then
    echo "❌ 취소되었습니다."
    exit 0
fi

# 버전 업데이트
echo ""
echo "📦 VERSION 파일 업데이트 중..."
echo "1.0.1" > VERSION

# Git 커밋
echo ""
echo "💾 변경사항 커밋 중..."
git add .
git commit -m "Fix: Add --no-edit flag to git merge commands (v1.0.1)

- 머지 시 에디터가 열리지 않도록 --no-edit 플래그 추가
- 자동으로 커밋 메시지 생성
- fem, merge-to-server-dev.sh, merge-to-server-staging.sh 수정"

# 푸시
echo ""
echo "🚀 GitHub에 푸시 중..."
git push origin main

echo ""
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub 사용자명이 필요합니다."
    exit 1
fi

echo ""
echo "=========================================="
echo "✅ 커밋 및 푸시 완료!"
echo "=========================================="
echo ""
echo "다음 단계:"
echo "1. GitHub에서 새 Release를 생성하세요:"
echo "   👉 https://github.com/$GITHUB_USERNAME/fem/releases/new"
echo "   📝 Tag: v1.0.1"
echo "   📝 Title: FEM v1.0.1 - Fix merge editor issue"
echo ""
echo "2. Release 생성 후 SHA256 계산:"
echo "   curl -sL https://github.com/$GITHUB_USERNAME/fem/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256"
echo ""
echo "3. homebrew-fem 저장소의 fem.rb 업데이트:"
echo "   - url을 v1.0.1로 변경"
echo "   - sha256을 새로 계산한 값으로 변경"
echo "   - version을 1.0.1로 변경"
echo ""
echo "4. 사용자 업데이트:"
echo "   brew update"
echo "   brew upgrade fem"
echo ""

