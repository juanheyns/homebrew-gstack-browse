class Design < Formula
  desc "AI-powered UI mockup CLI — generate, iterate, diff, and QA design mockups"
  homepage "https://github.com/juanheyns/gstack-design"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.1/design-darwin-arm64.tar.gz"
      sha256 "a86031792fd0d3e4b13da44d91f130346ab905ab6c37a9ba7184442961bfc22e"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.0/design-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.1/design-linux-arm64.tar.gz"
      sha256 "4e4000dfac31dd623a725b1b9cc9e4838bb69119ba9b6ce66b934344bf29adca"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-design/releases/download/v1.0.0/design-linux-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "design"
  end

  test do
    assert_match "design", shell_output("#{bin}/design --version 2>&1")
  end
end
