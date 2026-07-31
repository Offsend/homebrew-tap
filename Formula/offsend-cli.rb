class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.30.0"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "841706ee200fb8ff276942d527d1050b57332d5f159624787ca0c4f140097834"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "40f7f3f38891ff2b150b2902f090c5d3704951dc79dd1e0b5409b0e9df6b2cb5"
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
