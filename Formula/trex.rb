class Trex < Formula
  desc "Pixel-art roguelite arena shooter that runs inside a terminal pane"
  homepage "https://ghandhitechnology.github.io/trex/"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.0/trex-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fe25082cde1c844b73b6077503d7c25568db712b9854bfd12082141b36dfa295"
    end
    on_intel do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.0/trex-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6977f7da0973e2fdf0fb441a76cdec1d0fe469bd3d2f7e01f26c8544aab24720"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.0/trex-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "120c6140755a51539a0d65178c797e62b2cb061ce2803b99efb35320f4fdffd5"
    end
    on_intel do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.0/trex-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6963f68d1b0cb66a3e4cbac115516a38f1653eb3cd4a5da04bb628b27eb81a72"
    end
  end

  def install
    bin.install "trex"
  end

  test do
    assert_match "usage", shell_output("#{bin}/trex --help")
  end
end
