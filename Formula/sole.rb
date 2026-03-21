class Sole < Formula
  desc "GPU-accelerated macOS terminal with window workflows and search"
  homepage "https://github.com/skepticfx/sole"
  url "https://github.com/skepticfx/sole/archive/97067f34ae3e4b99935ba95029c3aeef8db99a1d.tar.gz"
  version "0.1.0"
  sha256 "076f029d852fa7dcd9370d5ff992b96a0f1e789440830b8696ff7e258d2fd19e"
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
