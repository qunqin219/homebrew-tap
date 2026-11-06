class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.0/bili-macos-arm64"
      sha256 "2d795c32c5fc1baebac20bceef2f2bb7d36086e7588d7866db1d09622c39232a"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.0/bilicli-0.8.0.tar.gz"
      sha256 "dedf30a7d43b4d4cf7f4261938b2e2d28af2481ca4130488cfc13896a750b89e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.0/bili-linux-arm64"
      sha256 "b9875c9580cc4fed34a51811c6aced082ce03cf05414a9c47936d8f378eebae6"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.8.0/bili-linux-x64"
      sha256 "341e01fe95826aebb3131db11ac3414870e7ac8a6648cbec93b5807dd17614dc"
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
    assert_match "bili 0.8.0", shell_output("#{bin}/bili --version")
  end
end
