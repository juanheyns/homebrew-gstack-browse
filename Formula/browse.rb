class Browse < Formula
  desc "Persistent headless browser CLI for AI agents"
  homepage "https://github.com/juanheyns/gstack-browse"
  version "1.0.22"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-darwin-arm64.tar.gz"
      sha256 "2b70152c288bc3e9cfaf290d16da738ac14c10fb5563f023adef745c09db7143"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-darwin-x86_64.tar.gz"
      sha256 "112563f9a9c4024fc7764f713935f8cc17482e43ab17e8dfd7b6e5c89ec048e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-linux-arm64.tar.gz"
      sha256 "ed55f70207e52fc85bcd78dd8fe194c4b0c0be1d0672030a8e22704405fdbb02"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.22/browse-linux-x86_64.tar.gz"
      sha256 "f012fb2f31efd3a8d66e24895b4f64f224573022dd78e494a362fbb531767564"
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
