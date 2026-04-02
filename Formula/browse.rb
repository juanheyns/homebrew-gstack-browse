class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-darwin-arm64.tar.gz"
      sha256 "593f19f27a37590cb156c2a2a07c6d50003a175e84821986120a071c1b7ba66f"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-darwin-x86_64.tar.gz"
      sha256 "9ad3a604c1c6d91e7af7cd6a7911ece28126bafeb7269c2d7bdebc2ccad6442d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-linux-arm64.tar.gz"
      sha256 "21d17e6d04e20b7e26860567fa0769a4a69bb29ab5aa72e333363a69c46f4353"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-linux-x86_64.tar.gz"
      sha256 "49f4df56ec9861224635d1da00436e8a9777138951dae5640b421ee92901f86b"
    end
  end

  def install
    bin.install "browse"
    bin.install "server.mjs"
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
