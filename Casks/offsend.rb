cask "offsend" do
  version "0.16.0"
  sha256 "3af65a04d6026f49ae0b7ef61b75c3d2b9c89939bec921a353eb87a6b7822248"

  url "https://github.com/Offsend/Offsend/releases/download/v#{version}/Offsend-#{version}.dmg"
  name "Offsend"
  desc "Prepare projects, files, and clipboard text before sharing with AI tools"
  homepage "https://offsend.io"

  livecheck do
    url "https://github.com/Offsend/Offsend/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Offsend.app"

  zap trash: [
    "~/Library/Application Support/Offsend",
    "~/Library/Preferences/io.offsend.plist",
    "~/Library/Caches/io.offsend",
  ]
end
