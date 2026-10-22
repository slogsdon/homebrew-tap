cask "herdbot" do
  version "0.1.0"
  sha256 "b1163beb21b133923e119a54bdd5d65802c553da52601b9524f67a23368c2efd"

  url "https://github.com/slogsdon/herdbot/releases/download/v#{version}/Herdbot-#{version}.zip"
  name "Herdbot"
  desc "Bots on herdr: registry, routing, subagent panes and messaging"
  homepage "https://github.com/slogsdon/herdbot"

  depends_on macos: ">= :sequoia"

  app "Herdbot.app"
  binary "#{appdir}/Herdbot.app/Contents/Helpers/herdbot"

  uninstall launchctl: "dev.herdbot.daemon",
            quit:      "dev.herdbot.menu"

  zap trash: [
    "~/Library/LaunchAgents/dev.herdbot.daemon.plist",
    "~/Library/Preferences/dev.herdbot.menu.plist",
  ]
end
