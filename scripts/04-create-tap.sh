#!/bin/bash

# 4단계: Homebrew Tap 저장소 생성

echo "🚀 FEM Homebrew 배포 - 4단계: Tap 저장소 생성"
echo ""

# GitHub 사용자명 입력
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub 사용자명이 필요합니다."
    exit 1
fi

TAP_DIR="../../homebrew-fem"

echo ""
echo "📁 Tap 저장소 디렉토리: $TAP_DIR"
echo ""

# 디렉토리가 이미 존재하면 제거
if [ -d "$TAP_DIR" ]; then
    read -p "⚠️  homebrew-fem 디렉토리가 이미 존재합니다. 제거하시겠습니까? (y/n): " CONFIRM
    if [ "$CONFIRM" = "y" ]; then
        rm -rf "$TAP_DIR"
        echo "✅ 기존 디렉토리 제거 완료"
    else
        echo "❌ 작업을 취소합니다."
        exit 1
    fi
fi

echo ""

# 디렉토리 생성
echo "📦 homebrew-fem 디렉토리 생성 중..."
mkdir -p "$TAP_DIR"
cd "$TAP_DIR"

echo "✅ 디렉토리 생성 완료"
echo ""

# fem.rb 복사
echo "📋 fem.rb 파일 복사 중..."
cp ../fe-macro/fem.rb .

echo "✅ fem.rb 복사 완료"
echo ""

# Git 초기화
echo "🔧 Git 저장소 초기화 중..."
git init
git add fem.rb
git commit -m "Add FEM formula"

echo "✅ Git 초기화 완료"
echo ""

# 원격 저장소 설정
REPO_URL="https://github.com/$GITHUB_USERNAME/homebrew-fem.git"
git remote add origin "$REPO_URL"

echo "✅ 원격 저장소 설정 완료"
echo ""

echo "=========================================="
echo "✅ 4단계 완료!"
echo "=========================================="
echo ""
echo "다음 단계:"
echo "1. GitHub에서 'homebrew-fem' 저장소를 생성하세요:"
echo "   👉 https://github.com/new"
echo "   📝 저장소 이름: homebrew-fem (정확히 이 이름으로!)"
echo "   📝 Public으로 설정"
echo ""
echo "2. 저장소 생성 후 다음 명령어를 실행하세요:"
echo "   cd $TAP_DIR"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. 완료되면 설치 테스트:"
echo "   brew tap $GITHUB_USERNAME/fem"
echo "   brew install fem"
echo "   fem --version"
echo ""
echo "=========================================="
echo "🎉 축하합니다! Homebrew 배포 준비 완료!"
echo "=========================================="
echo ""
echo "이제 누구나 다음 명령어로 설치할 수 있습니다:"
echo "  brew install $GITHUB_USERNAME/fem/fem"
echo ""

