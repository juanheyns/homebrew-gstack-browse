class Design < Formula
  desc "AI-powered UI mockup CLI — generate, iterate, diff, and QA design mockups"
  homepage "https://github.com/juanheyns/gstack-design"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.2/design-darwin-arm64.tar.gz"
      sha256 "72c5e886a9a0ba2300b0c7269df04048f99d622d7d01fa2b0f03aa65cef25c25"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.2/design-darwin-x86_64.tar.gz"
      sha256 "e5205fff4c014c3c2cfa84cdb808824be9b4bb1f5223630dd0decfb940387352"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.2/design-linux-arm64.tar.gz"
      sha256 "0985548984d62da41e48af124cc9b2b5c58575fa7248c84d769da2af58700c77"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.2/design-linux-x86_64.tar.gz"
      sha256 "c609c0ebd04d18c46b7cfea0c8361df2b9b4859f8b7460fc6e6c14e7202ccdd9"
    end
  end

  def install
    bin.install "design"
  end

  test do
    assert_match "design", shell_output("#{bin}/design --version 2>&1")
  end
end
