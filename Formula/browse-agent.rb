class BrowseAgent < Formula
  desc "Claude AI add-on for browse — enables the sidebar agent"
  homepage "https://juanheyns.github.io/gstack-browse/"
  version "1.0.7"
  license "MIT"

  depends_on "juanheyns/gstack-browse/browse"

  on_macos do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-agent-darwin-arm64.tar.gz"
      sha256 "0ad7a0159ee48cd87732834972c5fe56201c5e5ebf221714125ad1a1ca845a03"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-agent-darwin-x86_64.tar.gz"
      sha256 "0092364b72552fe07292696f22a1a48856c2d9099fbd7cd9a44a3d2cab785042"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-agent-linux-arm64.tar.gz"
      sha256 "08292b2ba22a526df506c12d72ab88aaab6798eed45bf9be865188dabb940c91"
    end
    on_intel do
      url "https://github.com/juanheyns/gstack-browse/releases/download/v1.0.7/browse-agent-linux-x86_64.tar.gz"
      sha256 "744d1456fe37cafd2dc54d38bb73a2d09646c0942f8e2c10521b1f4e2cb27739"
    end
  end

  def install
    bin.install "browse-agent"
  end

  test do
    assert_match "browse-agent", shell_output("#{bin}/browse-agent --help 2>&1 || true")
  end
end
