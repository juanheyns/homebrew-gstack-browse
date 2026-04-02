class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-darwin-arm64.tar.gz"
      sha256 "a22ca000f93e88731cca601947b6c1e547aea07ad68a19ed0b25ab9bdae3fbc7"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-darwin-x86_64.tar.gz"
      sha256 "561169301ed426621904c79d1bc563b3d10cf01df9fcbcc37d44f160c93fb5ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-linux-arm64.tar.gz"
      sha256 "adaeada9fb4b016661c4a5aee58f190598c07678c82bfca0a87ae3ce84545610"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.8/browse-linux-x86_64.tar.gz"
      sha256 "14f184bf8bf38702c1f2e6744642deaa60c82f9186c9c0e62e67d09fe0a67fab"
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
