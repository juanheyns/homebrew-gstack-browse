class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-darwin-arm64.tar.gz"
      sha256 "9a491193dd84d137f835fb2b4d3b7dca411c23204657b80cc393962768f90a30"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-darwin-x86_64.tar.gz"
      sha256 "802ead3e778e3ee39f07bc848103c678125b182089c454dac9c16328051b1b0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-linux-arm64.tar.gz"
      sha256 "3eebb561f9798bc59c6c3f7eba59d3b8522ca2d0c2c040780e404600d3e96c12"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.16/browse-linux-x86_64.tar.gz"
      sha256 "e20947a2484f73d403c4040b545f68e2aa65ac0c73a675c3309320da442f358e"
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
