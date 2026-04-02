class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.15"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-agent-darwin-arm64.tar.gz"
      sha256 "09e39fe54555845f45d93141cfe0cc76a85755b9f3e21f4007457441d5de2cbd"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-agent-darwin-x86_64.tar.gz"
      sha256 "77517959ed109ede597d1f6a1f34a780dc77e1cccbba9dcd4f7eb4e247a71be9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-agent-linux-arm64.tar.gz"
      sha256 "2dfc5cbd08d0bef0ddbbb30f7cd739078bba9a6c1fa8581c1a1f5aa60977704f"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-agent-linux-x86_64.tar.gz"
      sha256 "7d88db07da231e6321684d843b9eea25bce82ae2aec47189f19c61de5853bddd"
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
