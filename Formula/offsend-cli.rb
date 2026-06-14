class OffsendCli < Formula
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"
  url "https://github.com/Offsend/Offsend/releases/download/v0.5.0/offsend-cli-0.5.0.zip"
  sha256 "65499b49375220d0ed1dd204ff74f01ed91c2e613116242d097618db882f5c8a"
  version "0.5.0"

  def install
    libexec.install Dir["*"]
    (bin/"offsend").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/offsend" "$@"
    EOS
    chmod 0755, bin/"offsend"
  end

  test do
    assert_match "offsend", shell_output("#{bin}/offsend --version")
  end
end
