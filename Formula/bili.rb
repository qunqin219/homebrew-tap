class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.1/bili-macos-arm64"
      sha256 "826d49fc5dfb67daace977188f2aa0b27a76f006ed6d3c044615c3f870ef1162"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.1/bilicli-0.5.1.tar.gz"
      sha256 "c1ebb2bebf30c92d5800b12f0fd0d8a074ff81e3c52442361312d145b320db08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.1/bili-linux-arm64"
      sha256 "10e37b9d1e247d0bb66017e9ec31b4a67ae8e888b6ff1934e97afbaf7f4e1569"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.1/bili-linux-x64"
      sha256 "6aac3e02110dc8f5895fdad2b89c9683d2cd8fe7625cd1255c8b23cdc961dc64"
    end
  end

  def install
    if File.exist?("bili-macos-arm64")
      bin.install "bili-macos-arm64" => "bili"
    elsif File.exist?("bili-linux-x64")
      bin.install "bili-linux-x64" => "bili"
    elsif File.exist?("bili-linux-arm64")
      bin.install "bili-linux-arm64" => "bili"
    else
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
      bin.install_symlink prefix/"bin/bili"
    end
  end

  test do
    assert_match "bili 0.5.1", shell_output("#{bin}/bili --version")
  end
end
