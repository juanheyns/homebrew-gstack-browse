class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.14"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-agent-darwin-arm64.tar.gz"
      sha256 "b32d81740bd9476c093a086dc34bd43e5f4afbd735eaf8803f41c8153cb1498d"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-agent-darwin-x86_64.tar.gz"
      sha256 "c55408383fbf4c8395c5673068e5912312e93843eb14d39e4bf4461ace9df34c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-agent-linux-arm64.tar.gz"
      sha256 "0078dd48404a467207325242fac1cb864c667288907e17f8c652f9c6acecca6f"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-agent-linux-x86_64.tar.gz"
      sha256 "ff65c05d000cd6d6bc39f31f47ad5e1e46ea795333689a31900bb8a1bd1ead90"
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
