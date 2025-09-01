class Sultengutt < Formula
  desc "Cross-platform desktop reminder for ordering surprise dinners"
  homepage "https://github.com/TobiasKrok/sultengutt"
  version "v0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.4/sultengutt-darwin-amd64.tar.gz"
      sha256 "09cf4b05b3c218165be8b9c1096b40b9aaf037c360ce35914175c6601e50c8cc"
    else
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.4/sultengutt-darwin-arm64.tar.gz"
      sha256 "dbabd72b39519452969b90fd178b81b63baf8119ae40ac07f2641fa9553adbbd"
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
