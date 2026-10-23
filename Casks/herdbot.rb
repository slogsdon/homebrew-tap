cask "herdbot" do
  version "0.1.2"
  sha256 "d5463bed1ff31a39df20ec5f2626165abdd91c549f2b1a05ba50961d11fc7467"

  url "https://github.com/slogsdon/herdbot/releases/download/v#{version}/Herdbot-#{version}.zip"
  name "Herdbot"
  desc "Bots on herdr: registry, routing, subagent panes and messaging"
  homepage "https://github.com/slogsdon/herdbot"

  depends_on macos: :sequoia

  app "Herdbot.app"
  binary "#{appdir}/Herdbot.app/Contents/Helpers/herdbot"

  uninstall launchctl: "dev.herdbot.daemon",
            quit:      "dev.herdbot.menu"

  zap trash: [
    "~/Library/LaunchAgents/dev.herdbot.daemon.plist",
    "~/Library/Preferences/dev.herdbot.menu.plist",
  ]
end
