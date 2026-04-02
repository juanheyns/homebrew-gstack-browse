class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-darwin-arm64.tar.gz"
      sha256 "b723f2cfe00bce4daf06e8e394b054e5defa30bffa2f0eafe9520e34ca61c206"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-darwin-x86_64.tar.gz"
      sha256 "c781d7b8e403d20c9580fe5ce2fa14f6f75ed09098c72c14ad0e3f26a7a3cbf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-linux-arm64.tar.gz"
      sha256 "782379b417fec13bfdd2b349f972d500cfcd94bb77831e94b59273457c296656"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.9/browse-linux-x86_64.tar.gz"
      sha256 "d76ef41be21ba9292c2f99a172e487d8b4ff371c8204604391023f5ef812711f"
    end
  end

  def install
    bin.install "browse"
    bin.install "server.mjs"
    (share/"browse").install "extension"
  end

  def caveats
    <<~EOS
      To finish setup, install Chromium:
        browse setup-chromium

      Requires bun (https://bun.sh). Install it first if you haven't:
        curl -fsSL https://bun.sh/install | bash
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version 2>&1 || #{bin}/browse --help 2>&1")
  end
end
