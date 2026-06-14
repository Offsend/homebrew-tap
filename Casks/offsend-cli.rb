cask "offsend-cli" do
  version "0.6.0"
  sha256 "05d6cf26f952d4aab2dc13fa0b0c4f5e5d9469efa4bc4dca71c14228c1228e5d"

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
