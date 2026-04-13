class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-darwin-arm64.tar.gz"
      sha256 "c357eb056ecce0de4b4ce63c57eb2081f8534940e999d6334703b5808b249314"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-darwin-x86_64.tar.gz"
      sha256 "8481e8d7a67457a4fe8dec25d4d782d234616189329b17a4cb2f7ab691014c49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-linux-arm64.tar.gz"
      sha256 "89609b6db43c0ad39256f70d31589114af7ee3a0c8e7bb86ae70b13e80d16dbb"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.18/browse-linux-x86_64.tar.gz"
      sha256 "62a2e770c4811ad4f07ba723b08a75764d17996a70be6b8b89290b106a24e302"
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
