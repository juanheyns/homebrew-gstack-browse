class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-darwin-arm64.tar.gz"
      sha256 "ba7cbef2976f4ff82e99ad324d9e49310b5eeb2d2a49c682e735034ab33320ea"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-darwin-x86_64.tar.gz"
      sha256 "41be578e96d196b05319d6b57f40dfd994eddb4b83a179acb136f90689bc4df2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-linux-arm64.tar.gz"
      sha256 "08b58be0778ab75c3da9a7accbbd21d9280d66d5a13bfc12ee3781670827a299"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.5/browse-linux-x86_64.tar.gz"
      sha256 "952f00953dc26fd5c0754ceb8bc48e65ede272e93c5b1da87cfe1cced410af72"
    end
  end

  def install
    bin.install "browse"
    bin.install "browse-server"
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
