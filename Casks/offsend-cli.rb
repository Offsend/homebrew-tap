cask "offsend-cli" do
  version "0.15.0"
  sha256 "53d7a308e3cc846b080d0290ccd293cfcae8657e1c3770e1627a5f335ad307ff"

  url "https://github.com/Offsend/Offsend/releases/download/v#{version}/offsend-cli-#{version}.zip"
  name "Offsend CLI"
  desc "Local sensitive data checks for developers (Offsend CLI)"
  homepage "https://offsend.io"

  livecheck do
    url "https://github.com/Offsend/Offsend/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :ventura

  binary "offsend"

  zap trash: [
    "~/Library/Application Support/Offsend",
    "~/Library/Preferences/io.offsend.plist",
    "~/Library/Caches/io.offsend",
  ]
end
