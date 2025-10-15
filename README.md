# FEM (Frontend Macro)

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

현재 feature branch를 `server/dev` 및 `server/staging`에 자동으로 머지하고 다시 원래 브랜치로 돌아오는 대화형 Git 머지 헬퍼입니다.

## ✨ 주요 기능

- 🎯 대화형 메뉴로 간편한 브랜치 머지
- 🔄 자동으로 원래 브랜치로 복귀
- 🎨 컬러풀한 출력으로 가독성 향상
- 🛡️ 에러 처리 및 충돌 감지
- 📦 Homebrew로 간편 설치

## 🚀 설치 방법

### 방법 1: Homebrew로 설치 (권장)

```bash
# Tap 추가 (GitHub 저장소 공개 후)
brew tap yourusername/fem

# 설치
brew install fem

# 또는 한 번에
brew install yourusername/fem/fem
```

### 방법 2: 로컬 설치

```bash
# 저장소 클론
git clone https://github.com/yourusername/fe-macro.git
cd fe-macro

# 설치 스크립트 실행
./install.sh
```

## 📖 사용 방법

터미널에서 `fem` 명령어를 실행하면 대화형 메뉴가 나타납니다:

```bash
$ fem
```

### 메뉴 옵션

```
╔═══════════════════════════════════════╗
║                                       ║
║   FEM - Frontend Macro                ║
║   Git Merge Helper v1.0.0            ║
║                                       ║
╚═══════════════════════════════════════╝

📍 현재 브랜치: feature/new-feature

원하는 작업을 선택하세요:

  1) server/dev에 머지
  2) server/staging에 머지
  3) 두 서버 모두에 순차적으로 머지
  4) 종료

선택 (1-4):
```

## 🔧 동작 과정

각 머지 작업은 다음 순서로 진행됩니다:

1. **현재 브랜치 저장** - 작업 중인 feature branch 이름 저장
2. **타겟 브랜치로 이동** - `git checkout server/dev` (또는 server/staging)
3. **최신화** - `git pull origin <branch>`로 타겟 브랜치 업데이트
4. **머지** - feature branch를 타겟 브랜치에 머지
5. **복귀** - 다시 원래 feature branch로 체크아웃

## 💡 사용 예시

```bash
# feature/new-feature 브랜치에서 작업 중
$ git branch
* feature/new-feature
  server/dev
  server/staging

# fem 실행
$ fem

# 메뉴에서 옵션 3 선택 (두 서버 모두에 머지)
선택 (1-4): 3

# 자동으로 server/dev와 server/staging에 순차 머지
# 완료 후 feature/new-feature로 자동 복귀

$ git branch
* feature/new-feature
  server/dev
  server/staging
```

## 📋 관리 명령어

### 설치 상태 확인
```bash
./install.sh status
```

### 제거
```bash
./install.sh uninstall
```

### 도움말
```bash
./install.sh help
```

## ⚠️ 주의사항

- ✅ Git 저장소 내에서만 실행 가능
- ⚠️ 머지 충돌 발생 시 스크립트가 중단되며, 수동으로 충돌 해결 필요
- 🔄 옵션 3 사용 시, server/dev 머지 실패하면 server/staging 머지는 실행되지 않음
- 🔑 로컬 설치 시 `sudo` 권한 필요 (`/usr/local/bin`에 심볼릭 링크 생성)

## 📁 프로젝트 구조

```
fe-macro/
├── fem                          # 메인 실행 파일 (대화형 메뉴)
├── fem.rb                       # Homebrew Formula
├── install.sh                   # 로컬 설치/제거 스크립트
├── merge-to-server-dev.sh      # server/dev 머지 스크립트
├── merge-to-server-staging.sh  # server/staging 머지 스크립트
├── merge-to-servers.sh         # 통합 머지 스크립트
└── README.md                   # 문서
```

## 🍺 Homebrew Formula 로컬 테스트

로컬에서 Formula를 테스트하려면:

```bash
# Formula 설치 테스트
brew install --build-from-source ./fem.rb

# 제거
brew uninstall fem
```

## 🌐 GitHub 저장소에 공개하기

1. **GitHub에 저장소 생성**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/fe-macro.git
   git push -u origin main
   ```

2. **릴리즈 생성**
   - GitHub에서 Releases → Create a new release
   - Tag: `v1.0.0`
   - Release title: `FEM v1.0.0`
   - tar.gz 파일이 자동 생성됨

3. **SHA256 계산**
   ```bash
   curl -sL https://github.com/yourusername/fe-macro/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
   ```

4. **fem.rb 업데이트**
   - `url`을 실제 GitHub URL로 변경
   - `sha256`을 계산된 값으로 변경
   - `homepage`를 실제 저장소 URL로 변경

5. **Tap 저장소 생성** (선택사항)
   ```bash
   # homebrew-fem 저장소 생성
   mkdir homebrew-fem
   cd homebrew-fem
   cp ../fe-macro/fem.rb .
   git init
   git add fem.rb
   git commit -m "Add FEM formula"
   git remote add origin https://github.com/yourusername/homebrew-fem.git
   git push -u origin main
   ```

## 🤝 기여하기

이슈나 PR은 언제나 환영합니다!

## 📄 라이선스

MIT License

## 👨‍💻 작성자

Jin

---

**FEM**으로 Git 브랜치 머지를 더 쉽고 빠르게! 🚀
