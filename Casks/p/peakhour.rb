cask "peakhour" do
  version "4.1.15"
  sha256 "f17cc9713678ec6ce0a097a17f9abc8cc46b637da7f5bffd076da942569c312e"

  url "https://updates.peakhourapp.com/releases/PeakHour%20#{version}.zip"
  name "PeakHour"
  desc "Network bandwidth and network quality visualiser"
  homepage "https://www.peakhourapp.com/"

  livecheck do
    url "https://updates.peakhourapp.com/PeakHour#{version.major}Appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true

  app "PeakHour #{version.major}.app"

  uninstall launchctl: "com.digitician.peakhour#{version.major}.launchAtLoginHelper",
            quit:      "com.digitician.peakhour#{version.major}"

  zap trash: [
    "~/Library/Application Scripts/com.digitician.peakhour#{version.major}.launchAtLoginHelper",
    "~/Library/Application Support/com.digitician.peakhour#{version.major}",
    "~/Library/Application Support/PeakHour*",
    "~/Library/Caches/com.digitician.peakhour#{version.major}",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.digitician.peakhour#{version.major}",
    "~/Library/Containers/com.digitician.peakhour#{version.major}.launchAtLoginHelper",
    "~/Library/Cookies/com.digitician.peakhour#{version.major}.binarycookies",
    "~/Library/Preferences/com.digitician.peakhour#{version.major}.plist",
  ]
end
