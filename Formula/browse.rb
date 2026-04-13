class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-darwin-arm64.tar.gz"
      sha256 "fd1d0943814f5c5043e821af5f8c407d488ea86211e9338634233aed9f5a0bd3"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-darwin-x86_64.tar.gz"
      sha256 "6f8b81d98f5049284c4af532421ab71d49680186fe921fde95551e7582b6ded8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-linux-arm64.tar.gz"
      sha256 "9eac54c7359e63c5d537b53b77d2c67eb3f26c69c874616e4e839184df81bebf"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.21/browse-linux-x86_64.tar.gz"
      sha256 "6f0a2502ec1a67e0b3abc5f3c083e380cb72a7db7a232001b5785f322f70e190"
    end
  end

  def install
    bin.install "browse"
    bin.install "server.mjs"
    bin.install ".version" if File.exist?(".version")
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
