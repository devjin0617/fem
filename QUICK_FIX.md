# 🔧 빠른 수정 가이드

머지 시 에디터가 열리는 문제를 수정했습니다!

## ✅ 수정 내용

모든 `git merge` 명령어에 `--no-edit` 플래그를 추가하여 에디터가 자동으로 열리지 않도록 했습니다.

**수정된 파일:**
- `fem`
- `merge-to-server-dev.sh`
- `merge-to-server-staging.sh`

## 🚀 즉시 적용 (로컬)

Homebrew로 설치된 버전을 즉시 업데이트하려면:

```bash
# 수정된 fem 파일을 Homebrew 위치에 복사
sudo cp /Users/jin/Documents/git/fe-macro/fem /opt/homebrew/bin/fem

# 비밀번호 입력 후 완료
```

## 📦 정식 업데이트 (선택사항)

나중에 정식으로 v1.0.1 버전을 배포하려면:

### 1단계: Git 커밋 및 푸시

```bash
cd /Users/jin/Documents/git/fe-macro

# 변경사항 커밋
git add .
git commit -m "Fix: Add --no-edit flag to git merge commands (v1.0.1)"
git push origin main
```

### 2단계: GitHub Release 생성

1. https://github.com/devjin0617/fem/releases/new
2. Tag: `v1.0.1`
3. Title: `FEM v1.0.1 - Fix merge editor issue`
4. Description:
   ```
   ## 🐛 Bug Fix
   
   - 머지 시 에디터가 열리는 문제 수정
   - `git merge` 명령어에 `--no-edit` 플래그 추가
   - 자동으로 커밋 메시지 생성
   
   ## 변경된 파일
   - fem
   - merge-to-server-dev.sh
   - merge-to-server-staging.sh
   ```

### 3단계: SHA256 계산

```bash
curl -sL https://github.com/devjin0617/fem/archive/refs/tags/v1.0.1.tar.gz | shasum -a 256
```

### 4단계: Homebrew Formula 업데이트

```bash
cd /Users/jin/Documents/git/homebrew-fem/homebrew-fem

# fem.rb 수정
# - url: v1.0.1로 변경
# - sha256: 3단계에서 계산한 값으로 변경
# - version: 1.0.1로 변경

git add fem.rb
git commit -m "Update FEM to v1.0.1 - Fix merge editor issue"
git push origin main
```

### 5단계: 사용자 업데이트

```bash
brew update
brew upgrade fem
```

## 🧪 테스트

```bash
# 버전 확인
fem --version

# Git 저장소에서 테스트
cd your-git-project
fem

# 메뉴에서 옵션 선택 시 에디터가 열리지 않고 자동으로 머지됨!
```

## 💡 자동 업데이트 스크립트

간편하게 업데이트하려면:

```bash
./scripts/05-update-version.sh
```

---

**수정 완료!** 이제 `fem`을 실행할 때 에디터가 열리지 않고 바로 머지됩니다! 🎉

