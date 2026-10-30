class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.0/bili-macos-arm64"
      sha256 "d03180d1ba61de4255736ec12b24fa58ab9209fadd1065b322e8332193eb0144"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.0/bilicli-0.2.0.tar.gz"
      sha256 "3f7ce2a07cb0e7b6aaaf4a7633dc0024ab67bab56022524aa03951738a291bb9"
    end
  end

  on_linux do
    url "https://github.com/qunqin219/bcli/releases/download/v0.2.0/bili-linux-x64"
    sha256 "1f8c9b6aa9b6032cd8959f14bb3092d88f94d4146c7d9e351cfa45f5bbe1d158"
  end

  def install
    if File.exist?("bili-macos-arm64")
      bin.install "bili-macos-arm64" => "bili"
    elsif File.exist?("bili-linux-x64")
      bin.install "bili-linux-x64" => "bili"
    else
      # Intel macOS: build from the source tarball with a local Python 3.11+
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
      bin.install_symlink prefix/"bin/bili"
    end
  end

  test do
    assert_match "bili 0.2.0", shell_output("#{bin}/bili --version")
  end
end
