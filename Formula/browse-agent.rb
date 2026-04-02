class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.16"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-agent-darwin-arm64.tar.gz"
      sha256 "d7a8ac3af12ff4081757e2c4556ab21f8fd1b781ddf9a79066dd356f73cf2edd"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-agent-darwin-x86_64.tar.gz"
      sha256 "692c9cd8ff3140f8d7d13f136033730d4e20ee8594e8cce7be94ff7548d6b63b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-agent-linux-arm64.tar.gz"
      sha256 "378dda6e48c645ee9849dc599601efdc6c6d7b14cde98749722af396e4abc0f1"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-agent-linux-x86_64.tar.gz"
      sha256 "422df0d34f93f4af0f2a81a98e4986806dc9b237bfb0601303cb3d21d8353695"
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
