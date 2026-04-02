class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.8"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-agent-darwin-arm64.tar.gz"
      sha256 "eb906ab8e5230e99644b047fda1b6fb4f33ab6e6904b0db111f57bfc5c8b1046"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-agent-darwin-x86_64.tar.gz"
      sha256 "ebbe78713b2fa5d18228a7dc0b4a50b0997256d9591cbd7cafda40d11575b7bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-agent-linux-arm64.tar.gz"
      sha256 "95fcedecb05038eca0fc0646f862694daf3f1725086d98eff71385d8e1b3ca1e"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-agent-linux-x86_64.tar.gz"
      sha256 "822e0c305242b9cd78a5f8e4f2afc5fa2fbaf983a099c12a394be2ebb5632e4a"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
