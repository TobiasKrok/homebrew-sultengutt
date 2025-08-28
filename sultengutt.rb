class Sultengutt < Formula
  desc "Cross-platform desktop reminder for ordering surprise dinners"
  homepage "https://github.com/TobiasKrok/sultengutt"
  version "v0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.3/sultengutt-darwin-amd64.tar.gz"
      sha256 "7759fb71a79312d7cef748d88468a63f73531035338cf3db5686537c21fc43a9"
    else
      url "https://github.com/TobiasKrok/sultengutt/releases/download/v0.1.3/sultengutt-darwin-arm64.tar.gz"
      sha256 "4bbd4a91f9f8aa469feb0a1f97ccaea369e3f066258b5d868ea32688595b18e6"
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
