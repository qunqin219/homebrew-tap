class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-macos-arm64"
      sha256 "6bf3fde5195900a553e52ee827402dd1381bf24b7e9984383a198ac355d7d85c"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bilicli-0.2.2.tar.gz"
      sha256 "c944750a3d7e8e6e75c6f863f6774bac894f6e6dafdc8306bf6c9d93bff157fa"
    end
  end

  on_linux do
    url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-linux-x64"
    sha256 "6d681c5ca544c8553668d715394deb40aee3e7b02ad9213e3052cfe8ed995c51"
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
