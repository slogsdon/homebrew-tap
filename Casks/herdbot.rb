cask "herdbot" do
  version "0.1.1"
  sha256 "6079e877d54ba6b4d1521a6855d3e4719bb5a48ce3a906ea8bf362061c477a99"

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
