cask "offsend" do
  version "0.30.0"
  sha256 "d48074c06f80b2373624857b951c675cdc4e75f030bf96c1b95f6cec021f5243"

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
