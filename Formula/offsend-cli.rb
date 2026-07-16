class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.14.2"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "568a12f203df77717482cc0ce6ab1249dfa18590743579b1a9d23c19ad7c3bbb"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "93a49a021d6a319e3489db3b206ebee17ac24263db347e6755133e8ad1eb2de1"
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
