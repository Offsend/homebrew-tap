cask "offsend-cli" do
  version "0.20.0"
  sha256 "da686245185031f85527165cc28c54c75ffa1504ce5e49daf02aceb1d20861b1"

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
