#!/bin/bash

# 2단계: GitHub Release 생성 안내

echo "🚀 FEM Homebrew 배포 - 2단계: GitHub Release 생성"
echo ""

# GitHub 사용자명 입력
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub 사용자명이 필요합니다."
    exit 1
fi

REPO_URL="https://github.com/$GITHUB_USERNAME/fe-macro"
RELEASE_URL="$REPO_URL/releases/new"

echo ""
echo "=========================================="
echo "📦 GitHub Release 생성 방법"
echo "=========================================="
echo ""
echo "1. 브라우저에서 다음 URL을 열어주세요:"
echo "   👉 $RELEASE_URL"
echo ""
echo "2. 다음 정보를 입력하세요:"
echo "   📝 Tag version: v1.0.0"
echo "   📝 Release title: FEM v1.0.0"
echo "   📝 Target: main"
echo ""
echo "3. Description (설명):"
echo "----------------------------------------"
cat << 'EOF'
# FEM v1.0.0

현재 feature branch를 server/dev 및 server/staging에 자동으로 머지하는 대화형 Git 헬퍼입니다.

## ✨ 주요 기능
- 🎯 대화형 메뉴로 간편한 브랜치 머지
- 🔄 자동으로 원래 브랜치로 복귀
- 🎨 컬러풀한 출력
- 🛡️ 에러 처리 및 충돌 감지

## 📦 설치 방법
```bash
brew install GITHUB_USERNAME/fem/fem
```

## 사용 방법
```bash
fem
```
EOF
echo "----------------------------------------"
echo ""
echo "4. 'Publish release' 버튼을 클릭하세요."
echo ""
echo "5. Release가 생성되면 다음 스크립트를 실행하세요:"
echo "   ./scripts/03-calculate-sha.sh"
echo ""

