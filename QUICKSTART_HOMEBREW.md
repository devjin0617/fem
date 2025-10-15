# 🚀 Homebrew 배포 빠른 시작

저장소 이름을 `fem`으로 이미 생성하셨다면, 다음 단계를 따라주세요!

## ✅ 사전 준비

- [x] GitHub에 `fem` 저장소 생성 완료
- [ ] 코드 푸시
- [ ] Release 생성
- [ ] Homebrew Tap 설정

## 🎯 바로 시작하기

### 1️⃣ 코드 푸시 (이미 저장소가 있으면)

```bash
cd /Users/jin/Documents/git/fe-macro

# 기존 origin이 있다면 제거
git remote remove origin 2>/dev/null

# 새 origin 추가 (yourusername을 실제 GitHub 사용자명으로 변경)
git remote add origin https://github.com/yourusername/fem.git

# 브랜치 이름 확인 및 변경
git branch -M main

# 푸시
git push -u origin main
```

### 2️⃣ GitHub Release 생성

1. 저장소로 이동: `https://github.com/yourusername/fem`
2. **Releases** 탭 클릭
3. **Create a new release** 클릭
4. 다음 정보 입력:
   - **Tag**: `v1.0.0` (새 태그 생성)
   - **Title**: `FEM v1.0.0`
   - **Description**:
     ```
     # FEM v1.0.0 - 첫 번째 릴리즈 🎉
     
     현재 feature branch를 server/dev 및 server/staging에 자동으로 머지하는 대화형 Git 헬퍼입니다.
     
     ## 주요 기능
     - 대화형 메뉴
     - 자동 브랜치 복귀
     - 컬러풀한 출력
     - 에러 처리
     ```
5. **Publish release** 클릭

### 3️⃣ SHA256 계산 및 Formula 업데이트

```bash
cd /Users/jin/Documents/git/fe-macro

# GitHub 사용자명 입력 후 자동으로 처리
./scripts/03-calculate-sha.sh
```

**이 스크립트가 자동으로:**
- Release의 SHA256 계산
- `fem.rb` 파일 업데이트 (URL, SHA256, homepage)

### 4️⃣ Homebrew Tap 저장소 생성

```bash
./scripts/04-create-tap.sh
```

**그 다음:**

1. GitHub에서 `homebrew-fem` 저장소 생성:
   - 👉 https://github.com/new
   - 저장소 이름: **정확히** `homebrew-fem`
   - Public으로 설정

2. 코드 푸시:
   ```bash
   cd ../homebrew-fem
   git branch -M main
   git push -u origin main
   ```

## 🎉 완료! 테스트하기

```bash
# Tap 추가
brew tap yourusername/fem

# 설치
brew install fem

# 테스트
fem --version
```

## 📝 한 눈에 보는 전체 과정

```bash
# 1. 코드 푸시
git remote add origin https://github.com/yourusername/fem.git
git push -u origin main

# 2. GitHub에서 Release 생성 (v1.0.0)

# 3. SHA256 계산 및 Formula 업데이트
./scripts/03-calculate-sha.sh

# 4. Tap 저장소 생성
./scripts/04-create-tap.sh

# 5. GitHub에서 homebrew-fem 저장소 생성

# 6. Tap 저장소 푸시
cd ../homebrew-fem
git push -u origin main

# 7. 설치 테스트
brew tap yourusername/fem
brew install fem
fem --version
```

## 💡 중요 포인트

1. **저장소 이름:** `fem` (이미 생성 완료 ✅)
2. **Tap 저장소:** 반드시 `homebrew-fem`이어야 함
3. **Release Tag:** `v1.0.0` 형식
4. **Public:** 두 저장소 모두 Public

## 🆘 문제 해결

### Release 생성 후 "404 Not Found"
```bash
# Release가 제대로 생성되었는지 확인
curl -I https://github.com/yourusername/fem/archive/refs/tags/v1.0.0.tar.gz
```

### SHA256 계산 실패
- Release가 생성되었는지 확인
- Tag가 정확히 `v1.0.0`인지 확인
- 몇 분 기다린 후 다시 시도

### brew install 실패
```bash
# Tap 상태 확인
brew tap

# Formula 확인
brew info yourusername/fem/fem

# 로컬에서 직접 테스트
brew install --build-from-source fem.rb
```

---

**준비되셨나요? 1단계부터 시작하세요!** 🚀

