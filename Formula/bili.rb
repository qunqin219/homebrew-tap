class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.1/bili-macos-arm64"
      sha256 "e3af6690f29ba5a37f0d0c9ba792903b7323b5e8bed8ee59173ead0c8f457df9"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.1/bilicli-0.8.1.tar.gz"
      sha256 "c565dbcf75f0b6bb4372c040c7a8eb849b7939140ae45f9132c78f8942ba8038"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.1/bili-linux-arm64"
      sha256 "d149890484970d38d8f55f5565afb4ccbee3eff60abbd6ff0b6274f239f72821"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.1/bili-linux-x64"
      sha256 "ce6af91f6c6a4513efee54eb62d6d46e6594b217836f60cea98c8e23d5ac32f7"
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
    assert_match "bili 0.8.1", shell_output("#{bin}/bili --version")
  end
end
