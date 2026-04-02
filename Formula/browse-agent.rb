class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.9"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-agent-darwin-arm64.tar.gz"
      sha256 "c0e08d945640f5f4e744568223cdf00e1e764a30820069e7c87a217b9dae6e0c"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-agent-darwin-x86_64.tar.gz"
      sha256 "9796c897fd6217a346f9ef3cddeeff9e7b49721584c318ab65cd28a3d04045cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-agent-linux-arm64.tar.gz"
      sha256 "df8c42673eb46dc6eadf6e499ccaaeaf79207f32bb5c41183a6837e886786c46"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-agent-linux-x86_64.tar.gz"
      sha256 "da98343608c93a7ac0b49e83ed069cab67336603cc6a91530c05bd7e31bcb9f9"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
