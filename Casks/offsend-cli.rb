cask "offsend-cli" do
  version "0.30.1"
  sha256 "bf5b676c93b5af438db629efb127a6065af303c3176ffdf718fcce407cfa04da"

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
