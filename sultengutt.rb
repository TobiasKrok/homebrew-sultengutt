class Sultengutt < Formula
  desc "Cross-platform desktop reminder for ordering surprise dinners"
  homepage "https://github.com/TobiasKrok/sultengutt"
  version "v0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.4/sultengutt-darwin-amd64.tar.gz"
      sha256 "b12fcc3a5a92c1c1d952ce0bd764e6911687edb481359ffd784f78bfd07599b0"
    else
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.4/sultengutt-darwin-arm64.tar.gz"
      sha256 "84af8d47c1bc0eb80ad311d76aaf0db4ca7ae6d1ba940ebcd9b51d9c1d81dd55"
    end
  end

  def install
    bin.install "sultengutt"
  end

  def caveats
    <<~EOS
      To set up Sultengutt, run:
        sultengutt install
      
      To check status:
        sultengutt status
      
      ⚠️  IMPORTANT: Before uninstalling with Homebrew:
        Run 'sultengutt uninstall' first to remove scheduled tasks and config files.
        Then run 'brew uninstall sultengutt' to remove the application.
    EOS
  end

  test do
    assert_match "Sultengutt", shell_output("#{bin}/sultengutt --help")
  end
end
