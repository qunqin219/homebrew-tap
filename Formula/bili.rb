class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.1/bili-macos-arm64"
      sha256 "8091f2f115097d5db35ce4b600b1373bbf24292e2b9a5e3fb8f0c66eda02597f"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.1/bilicli-0.2.1.tar.gz"
      sha256 "b745e98e12c4c9d8550fb136373d2e10733e12b14d3bd3efcf6fbab6fffc9d36"
    end
  end

  on_linux do
    url "https://github.com/qunqin219/bcli/releases/download/v0.2.1/bili-linux-x64"
    sha256 "5796bd312995c480a22098354388f564e82c429343c61ca84dbfec99d3da6f47"
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
    assert_match "bili 0.2.1", shell_output("#{bin}/bili --version")
  end
end
