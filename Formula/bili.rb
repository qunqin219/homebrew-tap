class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.1/bili-macos-arm64"
      sha256 "4d82db207a4ad49bbd01f4e3c9c364fec52b50893a1d846297346426a34935b0"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.1/bilicli-0.7.1.tar.gz"
      sha256 "e690f2117e167411d19abd9ff97c56957d25707a6956a1a4e9cb7f04a4046555"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.1/bili-linux-arm64"
      sha256 "6708e336980e726d57ce842065358c66c9e10eb62e3b5a230213e83bd4095a3d"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.1/bili-linux-x64"
      sha256 "3513338f2f458ad85fbe4f24b08b31242a4d6319e27ba9329575a3be1b674352"
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
    assert_match "bili 0.7.1", shell_output("#{bin}/bili --version")
  end
end
