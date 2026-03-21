class Sole < Formula
  desc "GPU-accelerated macOS terminal with window workflows and search"
  homepage "https://github.com/skepticfx/sole"
  head "https://github.com/skepticfx/sole.git", branch: "master"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "sole", shell_output("#{bin}/sole --list-themes 2>&1")
  end
end
