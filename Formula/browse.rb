class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-darwin-arm64.tar.gz"
      sha256 "c06aa4c0c9273ef5a9e0f41e56c15608bd0f9d4d95760a6aa627f25a6db1f59d"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-darwin-x86_64.tar.gz"
      sha256 "549abd88edb9ff930b81c37a34ed86790317e81c17f17a24a99aac157287a82d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-linux-arm64.tar.gz"
      sha256 "71aa08613de5e9cf9843fa42e74a415300cae571367360b183a32836d94800bd"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.3/browse-linux-x86_64.tar.gz"
      sha256 "117e795fe81704b1b5af89aa405c4aeccb401b1ae26397000dad3dbb29cd225f"
    end
  end

  def install
    bin.install "browse"
  end

  def post_install
    if which("bun")
      system bin/"browse", "setup-chromium"
    else
      opoo "bun not found — run `browse setup-chromium` manually after installing bun"
    end
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version 2>&1 || #{bin}/browse --help 2>&1")
  end
end
