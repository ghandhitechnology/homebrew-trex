class Trex < Formula
  desc "Pixel-art roguelite arena shooter that runs inside a terminal pane"
  homepage "https://ghandhitechnology.github.io/trex/"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.1/trex-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "3179fee3e3bb36883b5e86cd25efe6c706bfd4e47a9fbd0601dca418c6a6f8ef"
    end
    on_intel do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.1/trex-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "d56935e0c30bec4de03a60c82b9665beeaa16332b009b56b9377e3c37529a8a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.1/trex-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42dd41c0effa3453b997087b9031151b234ad2f9993738b498d23536750bc95f"
    end
    on_intel do
      url "https://github.com/ghandhitechnology/trex/releases/download/v0.1.1/trex-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a10c5ae4856f8a5e342e86c8c5e7043926113adb07df6485a88ffceb27c8ea75"
    end
  end

  def install
    bin.install "trex"
  end

  test do
    assert_match "usage", shell_output("#{bin}/trex --help")
  end
end
