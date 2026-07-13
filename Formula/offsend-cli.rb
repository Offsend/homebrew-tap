class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.12.0"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "a882486a65dfe46e94027656354d53f86f71792bd46279f81e8343cae53a05b0"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "ab43166b5150758889e5735d78ec3e1b8fa5d3359c96252c6d2e140874c4d180"
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
