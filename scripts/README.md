# Homebrew 배포 자동화 스크립트

FEM을 Homebrew에 배포하기 위한 단계별 스크립트입니다.

## 🚀 전체 흐름

```
01-init-git.sh
    ↓
GitHub에서 fe-macro 저장소 생성
    ↓
02-create-release.sh (안내)
    ↓
GitHub에서 v1.0.0 Release 생성
    ↓
03-calculate-sha.sh
    ↓
04-create-tap.sh
    ↓
GitHub에서 homebrew-fem 저장소 생성
    ↓
완료! 🎉
```

## 📝 단계별 실행

### 1단계: Git 저장소 초기화

```bash
cd /Users/jin/Documents/git/fe-macro
chmod +x scripts/*.sh
./scripts/01-init-git.sh
```

**입력 필요:**
- GitHub 사용자명

**수동 작업:**
1. GitHub에서 `fe-macro` 저장소 생성 (Public)
2. 다음 명령어 실행:
   ```bash
   git branch -M main
   git push -u origin main
   ```

### 2단계: GitHub Release 생성

```bash
./scripts/02-create-release.sh
```

**수동 작업:**
1. 안내된 URL로 이동
2. Tag: `v1.0.0`, Title: `FEM v1.0.0` 입력
3. Description 복사/붙여넣기
4. "Publish release" 클릭

### 3단계: SHA256 계산 및 Formula 업데이트

```bash
./scripts/03-calculate-sha.sh
```

**자동 작업:**
- Release tarball SHA256 계산
- `fem.rb` 파일 자동 업데이트 (url, sha256, homepage)

### 4단계: Tap 저장소 생성

```bash
./scripts/04-create-tap.sh
```

**입력 필요:**
- GitHub 사용자명

**수동 작업:**
1. GitHub에서 `homebrew-fem` 저장소 생성 (Public)
   - **중요:** 저장소 이름은 정확히 `homebrew-fem`이어야 합니다!
2. 다음 명령어 실행:
   ```bash
   cd ../homebrew-fem
   git branch -M main
   git push -u origin main
   ```

## ✅ 완료 후 테스트

```bash
# Tap 추가 및 설치
brew tap yourusername/fem
brew install fem

# 실행 테스트
fem --version

# 제거
brew uninstall fem
brew untap yourusername/fem
```

## 🔄 업데이트 배포 시

새 버전(예: v1.1.0)을 배포할 때:

```bash
# 1. 코드 수정 후 커밋
git add .
git commit -m "Update to v1.1.0"
git push

# 2. GitHub에서 새 Release 생성 (v1.1.0)

# 3. SHA256 재계산 (스크립트 수정 필요)
curl -sL https://github.com/yourusername/fe-macro/archive/refs/tags/v1.1.0.tar.gz | shasum -a 256

# 4. homebrew-fem 저장소의 fem.rb 업데이트
cd ../homebrew-fem
# url, sha256, version 수정
git add fem.rb
git commit -m "Update FEM to v1.1.0"
git push

# 5. 사용자가 업데이트
brew update
brew upgrade fem
```

## 💡 팁

- **저장소 이름 주의:** `homebrew-fem`은 정확히 이 이름이어야 합니다
- **Public 저장소:** 두 저장소 모두 Public이어야 합니다
- **Release Tag:** `v`로 시작해야 합니다 (예: v1.0.0)
- **테스트:** 배포 전 로컬에서 `brew install --build-from-source ./fem.rb`로 테스트

## 🆘 문제 해결

### "Failed to download resource"
- Release가 제대로 생성되었는지 확인
- Tag가 v1.0.0인지 확인
- URL이 올바른지 확인

### "SHA256 mismatch"
- 03-calculate-sha.sh를 다시 실행
- fem.rb의 SHA256이 올바르게 업데이트되었는지 확인

### "No available formula with the name"
- Tap 저장소 이름이 `homebrew-fem`인지 확인
- fem.rb 파일이 Tap 저장소의 루트에 있는지 확인
- `brew tap yourusername/fem` 실행했는지 확인

