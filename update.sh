#!/usr/bin/env bash
# Regenerate Formula/trex.rb from the newest ghandhitechnology/trex release.
set -euo pipefail
cd "$(dirname "$0")"

repo=ghandhitechnology/trex
tag=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | head -1)
[[ -n "$tag" ]] || { echo "no release yet"; exit 0; }

# Prints the url and sha256 lines for one target's tarball.
asset() {
  local url="https://github.com/$repo/releases/download/$tag/trex-$tag-$1.tar.gz"
  local sha
  sha=$(curl -fsSL "$url.sha256" | cut -d' ' -f1)
  printf '      url "%s"\n      sha256 "%s"\n' "$url" "$sha"
}

cat > Formula/trex.rb <<RUBY
class Trex < Formula
  desc "Pixel-art roguelite arena shooter that runs inside a terminal pane"
  homepage "https://ghandhitechnology.github.io/trex/"
  version "${tag#v}"

  on_macos do
    on_arm do
$(asset aarch64-apple-darwin)
    end
    on_intel do
$(asset x86_64-apple-darwin)
    end
  end

  on_linux do
    on_arm do
$(asset aarch64-unknown-linux-gnu)
    end
    on_intel do
$(asset x86_64-unknown-linux-gnu)
    end
  end

  def install
    bin.install "trex"
  end

  test do
    assert_match "usage", shell_output("#{bin}/trex --help")
  end
end
RUBY
echo "Formula/trex.rb -> $tag"
