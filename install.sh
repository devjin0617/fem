#!/bin/bash

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 현재 스크립트 디렉토리
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 설치 함수
install_scripts() {
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${CYAN}  FEM (Frontend Macro) 전역 설치${NC}"
    echo -e "${BLUE}=========================================${NC}"
    echo ""

    source_path="$SCRIPT_DIR/fem"
    target_path="/usr/local/bin/fem"

    if [ ! -f "$source_path" ]; then
        echo -e "${RED}❌ fem 파일을 찾을 수 없습니다.${NC}"
        exit 1
    fi

    # 이미 존재하는 경우 백업
    if [ -L "$target_path" ] || [ -f "$target_path" ]; then
        echo -e "${YELLOW}⚠️  fem이 이미 존재합니다. 덮어씁니다.${NC}"
        sudo rm "$target_path"
    fi

    # 심볼릭 링크 생성
    sudo ln -s "$source_path" "$target_path"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ fem 설치 완료${NC}"
    else
        echo -e "${RED}❌ fem 설치 실패${NC}"
        exit 1
    fi

    echo ""
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${GREEN}✅ 설치 완료!${NC}"
    echo -e "${BLUE}=========================================${NC}"
    echo ""
    echo -e "다음 명령어로 사용할 수 있습니다:"
    echo -e "  ${CYAN}fem${NC}  - 대화형 메뉴로 Git 머지 작업"
    echo ""
    echo -e "${YELLOW}사용 예시:${NC}"
    echo -e "  $ fem"
    echo ""
}

# 제거 함수
uninstall_scripts() {
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${BLUE}  FEM 제거${NC}"
    echo -e "${BLUE}=========================================${NC}"
    echo ""

    target_path="/usr/local/bin/fem"

    if [ -L "$target_path" ] || [ -f "$target_path" ]; then
        sudo rm "$target_path"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ fem 제거 완료${NC}"
        else
            echo -e "${RED}❌ fem 제거 실패${NC}"
            exit 1
        fi
    else
        echo -e "${YELLOW}⚠️  fem이 설치되어 있지 않습니다.${NC}"
    fi

    echo ""
    echo -e "${GREEN}✅ 제거 완료!${NC}"
    echo ""
}

# 상태 확인 함수
check_status() {
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${BLUE}  설치 상태 확인${NC}"
    echo -e "${BLUE}=========================================${NC}"
    echo ""

    target_path="/usr/local/bin/fem"

    if [ -L "$target_path" ]; then
        link_target=$(readlink "$target_path")
        echo -e "${GREEN}✅ fem (설치됨)${NC}"
        echo -e "   → $link_target"
    elif [ -f "$target_path" ]; then
        echo -e "${YELLOW}⚠️  fem (심볼릭 링크 아님)${NC}"
        echo -e "   → $target_path"
    else
        echo -e "${RED}❌ fem (설치되지 않음)${NC}"
    fi

    echo ""
    
    # 버전 확인
    if command -v fem &> /dev/null; then
        echo -e "${CYAN}실행 테스트:${NC}"
        echo -e "  $(which fem)"
        echo ""
    fi
}

# 도움말
show_help() {
    echo -e "${CYAN}FEM (Frontend Macro) - 설치 스크립트${NC}"
    echo ""
    echo "사용법: ./install.sh [옵션]"
    echo ""
    echo "옵션:"
    echo "  install     - fem을 전역으로 설치 (기본값)"
    echo "  uninstall   - 설치된 fem 제거"
    echo "  status      - 설치 상태 확인"
    echo "  help        - 도움말 표시"
    echo ""
    echo "설치 후:"
    echo "  $ fem       - 대화형 메뉴 실행"
    echo ""
}

# 메인 로직
case "${1:-install}" in
    install)
        install_scripts
        ;;
    uninstall)
        uninstall_scripts
        ;;
    status)
        check_status
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}❌ 알 수 없는 옵션: $1${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac
