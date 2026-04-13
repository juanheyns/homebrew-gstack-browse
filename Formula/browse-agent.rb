class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.21"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-darwin-arm64.tar.gz"
      sha256 "5a026eeba08f23144128c6c9c2b6c40cf10babc4f2e48084196a5a5a0bb732d4"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-darwin-x86_64.tar.gz"
      sha256 "4fefa723a023811bd5e6e235e4d9e247f91ec6fca6530c84e9bf7e0b821fff63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-linux-arm64.tar.gz"
      sha256 "926580a44d59e81786bdf823a90bef80c41cd5b0eae70ca53dda3169704c38e8"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-agent-linux-x86_64.tar.gz"
      sha256 "30d1795d902c903d7adf75533ca42d97e55bf0659e791e3efd3bca364f64d4b9"
    end
  end

  def install
    bin.install "browse-agent"
    bin.install "sidebar-agent.mjs"
  end

  def caveats
    <<~EOS
      Requires the claude CLI (Claude Code) in PATH.
      Install from: https://claude.ai/download
    EOS
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
