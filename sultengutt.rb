class Sultengutt < Formula
  desc "Remember to buy Suprise Dinner"
  homepage "https://github.com/TobiasKrok/sultengutt"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.0/sultengutt-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_AMD64"
    else
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.0/sultengutt-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    end
  end

  def install
    bin.install "sultengutt"
  end

  def caveats
    <<~EOS
      To set up Sultengutt or reconfigure, run:
        sultengutt install
      
      To check status:
        sultengutt status
      
      To pause/resume reminders:
        sultengutt pause
        sultengutt resume
      
      ⚠️  IMPORTANT: Before uninstalling with Homebrew:
        Run 'sultengutt uninstall' first to remove scheduled tasks and config files.
        Then run 'brew uninstall sultengutt' to remove the application.
    EOS
  end

  test do
    assert_match "Sultengutt", shell_output("#{bin}/sultengutt --help")
  end
end
