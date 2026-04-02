class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-darwin-arm64.tar.gz"
      sha256 "8142f9243c81fe4651069411a114542bf5c4864052635bde02655af8a3d51949"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-darwin-x86_64.tar.gz"
      sha256 "63e53c46150937724fd7fe030029571cd82986dd3642d6ea9b401c9d30054ebd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-linux-arm64.tar.gz"
      sha256 "cf859e6a728d9d302722b6d59bb786bd44d9669527865778cbc7b1955b40a606"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.14/browse-linux-x86_64.tar.gz"
      sha256 "3253c0698f60035231bc99ef73b76ab970e8e6434a2fa9aa6f41efc0a2c44cb3"
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
