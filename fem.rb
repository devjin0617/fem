class Fem < Formula
  desc "FEM (Frontend Macro) - Git merge helper for server branches"
  homepage "https://github.com/yourusername/fe-macro"
  url "https://github.com/yourusername/fe-macro/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "YOUR_SHA256_HERE"
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

