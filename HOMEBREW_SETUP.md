# Homebrew 설치 가이드

FEM을 Homebrew에 등록하고 배포하는 방법을 안내합니다.

## 🎯 목표

사용자가 다음 명령어로 간편하게 설치할 수 있도록 합니다:

```bash
brew install yourusername/fem/fem
```

## 📝 단계별 가이드

### 1단계: GitHub 저장소 생성 및 코드 푸시

```bash
# Git 초기화 (아직 안했다면)
cd /Users/jin/Documents/git/fe-macro
git init

# 파일 추가
git add .
git commit -m "Initial commit: FEM v1.0.0"

# GitHub 저장소 연결 (저장소를 먼저 생성해야 함)
git remote add origin https://github.com/yourusername/fem.git
git branch -M main
git push -u origin main
```

### 2단계: GitHub Release 생성

1. GitHub 저장소로 이동
2. **Releases** → **Create a new release** 클릭
3. 다음 정보 입력:
   - **Tag version**: `v1.0.0`
   - **Release title**: `FEM v1.0.0`
   - **Description**: 주요 기능 설명
4. **Publish release** 클릭

GitHub가 자동으로 소스 코드 아카이브를 생성합니다:
```
https://github.com/yourusername/fem/archive/refs/tags/v1.0.0.tar.gz
```

### 3단계: SHA256 해시 계산

릴리즈 후 tar.gz 파일의 SHA256 해시를 계산합니다:

```bash
curl -sL https://github.com/yourusername/fem/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
```

출력 예시:
```
abc123def456...  -
```

### 4단계: fem.rb Formula 업데이트

`fem.rb` 파일을 실제 정보로 업데이트합니다:

```ruby
class Fem < Formula
  desc "FEM (Frontend Macro) - Git merge helper for server branches"
  homepage "https://github.com/yourusername/fem"
  url "https://github.com/yourusername/fem/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3단계에서 계산한 SHA256 해시값"
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
```

### 5단계: Homebrew Tap 저장소 생성

Tap 저장소를 만들면 사용자가 간편하게 설치할 수 있습니다.

```bash
# 새 디렉토리 생성
cd ..
mkdir homebrew-fem
cd homebrew-fem

# fem.rb 복사
cp ../fem/fem.rb .

# Git 저장소 초기화
git init
git add fem.rb
git commit -m "Add FEM formula"

# GitHub에 homebrew-fem 저장소 생성 후 푸시
git remote add origin https://github.com/yourusername/homebrew-fem.git
git branch -M main
git push -u origin main
```

**중요**: Homebrew Tap 저장소 이름은 반드시 `homebrew-`로 시작해야 합니다!

### 6단계: 설치 테스트

이제 사용자는 다음과 같이 설치할 수 있습니다:

```bash
# Tap 추가
brew tap yourusername/fem

# 설치
brew install fem

# 또는 한 번에
brew install yourusername/fem/fem
```

## 🧪 로컬 테스트

배포 전에 로컬에서 테스트:

```bash
# Formula 직접 설치
brew install --build-from-source /path/to/fem.rb

# 실행 테스트
fem

# 제거
brew uninstall fem
```

## 🔄 업데이트 배포

새 버전을 배포할 때:

1. **코드 수정 및 커밋**
   ```bash
   git add .
   git commit -m "Update to v1.1.0"
   git push
   ```

2. **새 릴리즈 생성** (GitHub에서)
   - Tag: `v1.1.0`

3. **SHA256 재계산**
   ```bash
   curl -sL https://github.com/yourusername/fem/archive/refs/tags/v1.1.0.tar.gz | shasum -a 256
   ```

4. **Formula 업데이트** (homebrew-fem 저장소)
   ```ruby
   url "https://github.com/yourusername/fem/archive/refs/tags/v1.1.0.tar.gz"
   sha256 "새로운_SHA256_해시"
   version "1.1.0"
   ```

5. **Formula 푸시**
   ```bash
   cd homebrew-fem
   git add fem.rb
   git commit -m "Update FEM to v1.1.0"
   git push
   ```

6. **사용자 업데이트**
   ```bash
   brew update
   brew upgrade fem
   ```

## 📦 대안: Core Formula로 등록

더 많은 사용자에게 배포하려면 공식 Homebrew Core에 등록할 수 있습니다:

1. [Homebrew Core](https://github.com/Homebrew/homebrew-core) fork
2. Formula 추가
3. PR 생성
4. 리뷰 및 승인 대기

하지만 이는 엄격한 기준이 있으므로, 개인 Tap으로 시작하는 것을 권장합니다.

## ✅ 체크리스트

- [ ] GitHub 저장소 생성 및 코드 푸시
- [ ] v1.0.0 릴리즈 생성
- [ ] SHA256 해시 계산
- [ ] fem.rb 업데이트 (url, sha256)
- [ ] homebrew-fem Tap 저장소 생성
- [ ] fem.rb를 Tap 저장소에 푸시
- [ ] 로컬 테스트 완료
- [ ] README의 URL 업데이트

## 🎉 완료!

이제 사용자들이 `brew install yourusername/fem/fem` 명령어로 FEM을 설치할 수 있습니다!

## 📚 참고 자료

- [Homebrew Formula 작성법](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Tap 만들기](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [GitHub Releases](https://docs.github.com/en/repositories/releasing-projects-on-github)

