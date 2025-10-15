# FEM 빠른 시작 가이드

FEM을 5분 안에 설치하고 사용해보세요!

## 🚀 빠른 설치

```bash
cd /path/to/fe-macro
./install.sh
```

설치 완료! 이제 `fem` 명령어를 사용할 수 있습니다.

## 💡 첫 사용

### 1. Git 저장소로 이동
```bash
cd your-git-project
```

### 2. Feature 브랜치에서 fem 실행
```bash
# feature 브랜치에 있는지 확인
git branch

# fem 실행
fem
```

### 3. 메뉴에서 원하는 작업 선택
```
╔═══════════════════════════════════════╗
║                                       ║
║   FEM - Frontend Macro                ║
║   Git Merge Helper v1.0.0            ║
║                                       ║
╚═══════════════════════════════════════╝

📍 현재 브랜치: feature/your-feature

원하는 작업을 선택하세요:

  1) server/dev에 머지
  2) server/staging에 머지
  3) 두 서버 모두에 순차적으로 머지
  4) 종료

선택 (1-4): 
```

### 4. 숫자를 입력하고 엔터
```
선택 (1-4): 3
```

자동으로 머지가 진행되고, 완료 후 원래 브랜치로 돌아옵니다!

## 📖 기본 명령어

```bash
# 대화형 메뉴 실행
fem

# 버전 확인
fem --version

# 도움말
fem --help
```

## ⚡ 실전 예제

### 예제 1: 개발 서버에만 머지
```bash
$ cd my-project
$ git checkout feature/new-button
$ fem

# 메뉴에서 1번 선택
선택 (1-4): 1

✅ server/dev에 머지 완료!
현재 브랜치: feature/new-button
```

### 예제 2: 모든 서버에 머지
```bash
$ fem

# 메뉴에서 3번 선택
선택 (1-4): 3

📦 server/dev에 머지 완료!
📦 server/staging에 머지 완료!
✅ 모든 작업 완료!
```

## 🔧 설치 확인

설치가 제대로 되었는지 확인:

```bash
# fem이 설치되었는지 확인
which fem
# 출력: /usr/local/bin/fem

# 버전 확인
fem --version
# 출력: FEM (Frontend Macro) v1.0.0

# 설치 상태 확인
cd /path/to/fe-macro
./install.sh status
```

## 🗑️ 제거

FEM이 필요 없어졌다면:

```bash
cd /path/to/fe-macro
./install.sh uninstall
```

## ❓ 문제 해결

### "command not found: fem"
- 설치 스크립트를 실행했는지 확인
- `/usr/local/bin`이 PATH에 있는지 확인:
  ```bash
  echo $PATH | grep "/usr/local/bin"
  ```

### "git 저장소가 아니거나..."
- Git 저장소 내에서 실행해야 합니다
- `git status`로 확인

### "server/dev 브랜치로 체크아웃 실패"
- `server/dev` 브랜치가 존재하는지 확인:
  ```bash
  git branch -a
  ```
- 브랜치 이름이 다르다면 스크립트를 수정해야 합니다

### 충돌 발생 시
- 스크립트가 자동으로 중단됩니다
- 수동으로 충돌을 해결:
  ```bash
  git status
  # 충돌 파일 수정
  git add .
  git commit
  git checkout your-feature-branch
  ```

## 🎯 다음 단계

- ⭐ GitHub에 star 주기
- 📝 이슈나 개선사항 제안하기
- 🔄 동료들에게 공유하기

---

**즐거운 머지 되세요!** 🚀

