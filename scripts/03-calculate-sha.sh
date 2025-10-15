#!/bin/bash

# 3단계: SHA256 계산 및 Formula 업데이트

echo "🚀 FEM Homebrew 배포 - 3단계: SHA256 계산"
echo ""

# GitHub 사용자명 입력
read -p "GitHub 사용자명을 입력하세요: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub 사용자명이 필요합니다."
    exit 1
fi

TARBALL_URL="https://github.com/$GITHUB_USERNAME/fe-macro/archive/refs/tags/v1.0.0.tar.gz"

echo ""
echo "📥 tar.gz 파일 다운로드 및 SHA256 계산 중..."
echo "URL: $TARBALL_URL"
echo ""

SHA256=$(curl -sL "$TARBALL_URL" | shasum -a 256 | awk '{print $1}')

if [ -z "$SHA256" ]; then
    echo "❌ SHA256 계산 실패!"
    echo ""
    echo "다음을 확인해주세요:"
    echo "1. GitHub Release가 생성되었는지"
    echo "2. Tag가 v1.0.0으로 설정되었는지"
    echo "3. 인터넷 연결이 정상인지"
    exit 1
fi

echo "✅ SHA256 계산 완료!"
echo ""
echo "=========================================="
echo "SHA256: $SHA256"
echo "=========================================="
echo ""

# fem.rb 파일 업데이트
FEM_RB="../fem.rb"

if [ -f "$FEM_RB" ]; then
    echo "📝 fem.rb 파일 업데이트 중..."
    
    # 백업 생성
    cp "$FEM_RB" "${FEM_RB}.backup"
    
    # URL 업데이트
    sed -i.tmp "s|url \".*\"|url \"$TARBALL_URL\"|" "$FEM_RB"
    
    # SHA256 업데이트
    sed -i.tmp "s|sha256 \".*\"|sha256 \"$SHA256\"|" "$FEM_RB"
    
    # homepage 업데이트
    sed -i.tmp "s|homepage \".*\"|homepage \"https://github.com/$GITHUB_USERNAME/fe-macro\"|" "$FEM_RB"
    
    # 임시 파일 제거
    rm -f "${FEM_RB}.tmp"
    
    echo "✅ fem.rb 업데이트 완료!"
    echo ""
    
    # 변경사항 표시
    echo "📄 fem.rb 내용:"
    echo "----------------------------------------"
    cat "$FEM_RB"
    echo "----------------------------------------"
else
    echo "⚠️  fem.rb 파일을 찾을 수 없습니다."
    echo ""
    echo "수동으로 다음 내용을 fem.rb에 추가해주세요:"
    echo "----------------------------------------"
    cat << EOF
class Fem < Formula
  desc "FEM (Frontend Macro) - Git merge helper for server branches"
  homepage "https://github.com/$GITHUB_USERNAME/fe-macro"
  url "$TARBALL_URL"
  sha256 "$SHA256"
  version "1.0.0"
  license "MIT"

  def install
    bin.install "fem"
    bin.install "merge-to-server-dev.sh"
    bin.install "merge-to-server-staging.sh"
    bin.install "merge-to-servers.sh"
  end

  test do
    system "#{bin}/fem", "--version"
  end
end
EOF
    echo "----------------------------------------"
fi

echo ""
echo "=========================================="
echo "✅ 3단계 완료!"
echo "=========================================="
echo ""
echo "다음 단계:"
echo "  ./scripts/04-create-tap.sh"
echo ""

