class Fem < Formula
  desc "FEM (Frontend Macro) - Git merge helper for server branches"
  homepage "https://github.com/devjin0617/fem"
  url "https://github.com/devjin0617/fem/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "58f688030437120da712050f865c54a49281707e88a7abc80b0c344b4e2db894"
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