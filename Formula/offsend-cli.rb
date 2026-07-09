class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.10.1"
  license "Apache-2.0"

  on_macos do
    odie "Install the macOS CLI with: brew install --cask offsend/tap/offsend-cli"
  end

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "50391f85a6307f1bb92e8f30b5d01d59cee525caadcc6fb0e40d81aa0bc1c02f"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "9f02777d2342148e4806467d7f53b4ee37883c85d74e6f79b8cca5fd44009a5e"
    end
  end

  def install
    bin.install "offsend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offsend --version")
  end
end
