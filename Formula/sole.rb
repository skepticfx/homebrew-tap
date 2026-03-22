class Sole < Formula
  desc "GPU-accelerated macOS terminal with window workflows and search"
  homepage "https://github.com/skepticfx/sole"
  url "https://github.com/skepticfx/sole/archive/bb11d2727c9e8fe5c46c2532691aa4b2de481bf0.tar.gz"
  version "0.1.0"
  sha256 "4bd18599fc0eeed0cd8b00c631ee28edaebfac00f7eaeb281ba804ef35df8373"
  head "https://github.com/skepticfx/sole.git", branch: "master"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  def post_install
    system "#{bin}/sole", "--install-app", "--app-binary", "#{bin}/sole"
  end

  def caveats
    <<~EOS
      Sole.app is installed automatically after Homebrew install.

      The installer prefers /Applications/Sole.app and falls back to ~/Applications/Sole.app.
      If it does not appear in Launchpad immediately, open it once manually:

        open /Applications/Sole.app
        open ~/Applications/Sole.app
    EOS
  end

  test do
    assert_match "sole", shell_output("#{bin}/sole --list-themes 2>&1")
  end
end
