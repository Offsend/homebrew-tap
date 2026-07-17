class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.16.0"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "c4939002bdc6fc0e77401fa10e9fea01b3ba2d5640981a1ac1fc4d068cbf7c42"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "7bef8e834344cd0b80830784785df517f74d6b723f2d9cdb5d641f4b977de59b"
    end
  end

  def install
    # Keep odie out of a top-level on_macos block: that runs on formula load
    # (brew tap / brew info on macOS), not only during install.
    odie "Install the macOS CLI with: brew install --cask offsend/tap/offsend-cli" if OS.mac?

    bin.install "offsend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offsend --version")
  end
end
