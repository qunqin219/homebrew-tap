class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.0/bili-macos-arm64"
      sha256 "6ccdd072f311cda451f8edbf6c946870ba807268217456088212ef5e737c90a5"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.0/bilicli-0.4.0.tar.gz"
      sha256 "3ba1aee018714b53ee4c3b78b81f3bc1d0193de1343605da90289d25c38239d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.0/bili-linux-arm64"
      sha256 "804bf9dab7081f0cd0e579b59c5c295c2519bf6243638161584fd7f369c88e1b"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.0/bili-linux-x64"
      sha256 "30604b552d2277d1ef71641bbd2b55f1c8f2460432bb9b7abac0ebde8ccc9f2a"
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
    assert_match "bili 0.4.0", shell_output("#{bin}/bili --version")
  end
end
