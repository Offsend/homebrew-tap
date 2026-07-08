class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    odie "Install the macOS CLI with: brew install --cask offsend/tap/offsend-cli"
  end

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "e20efab04db78b9b0629a00188c143a0565e0dee190d721b4522a43cbe270ed3"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "b8b61eac37f84df4ad005e7df693594063583acddc3d6e8cba18add04518ee2e"
    end
  end

  def install
    bin.install "offsend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offsend --version")
  end
end
