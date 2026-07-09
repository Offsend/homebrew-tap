class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    odie "Install the macOS CLI with: brew install --cask offsend/tap/offsend-cli"
  end

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "3acc1555610eea8b1cdf8dfc8a5f541575f9852469bd01c13b173d1947a839df"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "2dbd493b10183bbaac2a673f0d4c20855629a23edaecd5c2f82bdd4c165dc285"
    end
  end

  def install
    bin.install "offsend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offsend --version")
  end
end
