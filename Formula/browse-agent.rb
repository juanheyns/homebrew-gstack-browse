class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.22"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-agent-darwin-arm64.tar.gz"
      sha256 "8826a92c3545e2533c97b2e098d8d89a81b857c34ad2cfc2ca128fc6ab58851a"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-agent-darwin-x86_64.tar.gz"
      sha256 "057defa95dcab7694afe7909a01e979858b9673838da376da0754edba0f323e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-agent-linux-arm64.tar.gz"
      sha256 "d7c03edeab707ae508cbc26747bbb6e3967cabbf00e7ea9a62100a0f83007699"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-agent-linux-x86_64.tar.gz"
      sha256 "990c647f4ca19991caca8d7987ff50c0648963e974a7b2f14ef961e937864e5b"
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
