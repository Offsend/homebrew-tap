class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  version "0.31.0"
  license "Apache-2.0"

  on_linux do
    on_intel do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-x86_64.tar.gz"
      sha256 "253851c8182911d7105e39a5ce04d4844caa76d6e304e9da1ce360d782d5d6e9"
    end
    on_arm do
      url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}-linux-aarch64.tar.gz"
      sha256 "583024962f67957d9aad014f26411cbb00a74debbf24181acb4d7ed229abe91e"
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
