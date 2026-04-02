class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.3"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-agent-darwin-arm64.tar.gz"
      sha256 "b2278933569dfe02aabaa256c276badda065bb8088545bde60e33f86ec47dcb2"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-agent-darwin-x86_64.tar.gz"
      sha256 "c7a61dcd114c9925345d02fe948e4ecee587e732f59c6d37e3b1495551ab0467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-agent-linux-arm64.tar.gz"
      sha256 "9cd67b6c006f38677e08ded123ce69099e8b5d2b1f97b26599f495b1ea896f4d"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-agent-linux-x86_64.tar.gz"
      sha256 "f07009ee0f285dd19579440424546c498813537130352eaa11e7ce1537e3c46d"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
