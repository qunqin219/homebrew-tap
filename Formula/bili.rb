class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.1/bili-macos-arm64"
      sha256 "14f12e4a199d7a43599b14d3e9d1b343f17837fa3fed9647e8d237e23069a7cc"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.1/bilicli-0.6.1.tar.gz"
      sha256 "e39b36574fed2114044f3c101f2b50946182a55fdb77cb8ede5f60a41266de3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.1/bili-linux-arm64"
      sha256 "7dfc6970dbe2abd27c7b008d2bb8530dce25c4d72717c46f62c5055085f904f5"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.1/bili-linux-x64"
      sha256 "f8dd0cd1616d3ac3d4c1d7b1b08dee87b299c31ce1a920d62bdf4dc795664e93"
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
    assert_match "bili 0.6.1", shell_output("#{bin}/bili --version")
  end
end
