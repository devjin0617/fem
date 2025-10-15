#!/bin/bash

# 1단계: Git 저장소 초기화 및 푸시

echo "🚀 FEM Homebrew 배포 - 1단계: Git 저장소 초기화"
echo ""

# 사용자에게 GitHub 사용자명 입력 받기
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub 사용자명이 필요합니다."
    exit 1
fi

echo ""
echo "📝 사용자명: $GITHUB_USERNAME"
echo ""

# 현재 디렉토리 확인
CURRENT_DIR=$(pwd)
echo "📁 현재 디렉토리: $CURRENT_DIR"
echo ""

# Git 초기화
if [ ! -d .git ]; then
    echo "🔧 Git 저장소 초기화 중..."
    git init
    echo "✅ Git 초기화 완료"
else
    echo "✅ Git 저장소가 이미 존재합니다."
fi

echo ""

# 파일 추가
echo "📦 파일 추가 중..."
git add .
git commit -m "Initial commit: FEM v1.0.0" 2>/dev/null || echo "✅ 이미 커밋됨"

echo ""

# 원격 저장소 설정
REPO_URL="https://github.com/$GITHUB_USERNAME/fem.git"

if git remote | grep -q "origin"; then
    echo "🔄 기존 origin 제거 중..."
    git remote remove origin
fi

echo "🔗 원격 저장소 추가 중..."
git remote add origin $REPO_URL

echo ""
echo "=========================================="
echo "✅ 1단계 완료!"
echo "=========================================="
echo ""
echo "다음 단계:"
echo "1. GitHub에서 저장소를 생성하세요:"
echo "   👉 https://github.com/new"
echo "   📝 저장소 이름: fem"
echo "   📝 Public으로 설정"
echo ""
echo "2. 저장소 생성 후 다음 명령어를 실행하세요:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. 완료되면 다음 스크립트를 실행하세요:"
echo "   ./scripts/02-create-release.sh"
echo ""

