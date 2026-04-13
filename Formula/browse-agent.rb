class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.18"
  license "MIT"

  depends_on "juanheyns/gstack/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-agent-darwin-arm64.tar.gz"
      sha256 "9bdf9c7a03224a9b51a1d8e1b93fa15fe865d01e13535c5e9077f0195001c8c3"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-agent-darwin-x86_64.tar.gz"
      sha256 "d63b6016d2d7ba091f8941da8652bb97fa242cbafa4edd3fe4fd0bd917952145"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-agent-linux-arm64.tar.gz"
      sha256 "45663afd1bf83c0989a19f49d23792fdac54473ecf8a52f7f9ba0d63820182be"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-agent-linux-x86_64.tar.gz"
      sha256 "defd64b3bc3122b8f8ad9ff00defcde3b38d7273b649254dbc2814b5883e88dc"
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
