class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-macos-arm64"
      sha256 "2f7864de33c989e8378e08bc27b7cacaf7e154549945ddd58f85518e6d598d79"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bilicli-0.2.2.tar.gz"
      sha256 "bc94e7f3288cf352476b9a292901c59958c4ebebeefa693009be21d7d91faa2a"
    end
  end

  on_linux do
    url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-linux-x64"
    sha256 "c9dc37672276ce019c6d59c7e28aa04019356cc4026d98ed36f84b5ae9c41e93"
  end

  def install
    if File.exist?("bili-macos-arm64")
      bin.install "bili-macos-arm64" => "bili"
    elsif File.exist?("bili-linux-x64")
      bin.install "bili-linux-x64" => "bili"
    else
      system "python3", "-m", "pip", "install", "--prefix=#{prefix}", "."
      bin.install_symlink prefix/"bin/bili"
    end
  end

  test do
    assert_match "bili 0.2.2", shell_output("#{bin}/bili --version")
  end
end
