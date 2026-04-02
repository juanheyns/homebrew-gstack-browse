class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-darwin-arm64.tar.gz"
      sha256 "091bafe231c18965ec89265ef17690ed56daeb9143802d218e032fa9cbc5c8fb"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-darwin-x86_64.tar.gz"
      sha256 "31089e162a5c9ea64c6c5b4037fec13353451d2a543f6118b94c2b6d96aa8294"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-linux-arm64.tar.gz"
      sha256 "2ce7524a73708992c3519ec254bea820e4b550f00ce226fabb8b86a705a7826e"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.15/browse-linux-x86_64.tar.gz"
      sha256 "6bbbab99874a8bccb2efa336d2182915d0b96e68ce869bcca2ccff991fe3ece8"
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
