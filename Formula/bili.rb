class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-macos-arm64"
      sha256 "94aab2f976a7d384dd4815b46fdf4bc10c56027f0ef8dc4c6bdf7049aafedde4"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bilicli-0.2.2.tar.gz"
      sha256 "ec22020c35eca676adf39069ea58a3bdfdb577bf82cd6a2b78b3e8df06ca6fac"
    end
  end

  on_linux do
    url "https://github.com/qunqin219/bcli/releases/download/v0.2.2/bili-linux-x64"
    sha256 "9107295691ed8cb06468f0d790d517dbded1bfb940399384f8f88f06d2bc9156"
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
