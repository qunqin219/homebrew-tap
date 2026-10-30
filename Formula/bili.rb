class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.3.0/bili-macos-arm64"
      sha256 "3e4c16507919ff34cecd51b7bcae6a2f2860c8b220afa829258d013ad29efdc7"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.3.0/bilicli-0.3.0.tar.gz"
      sha256 "3a891d9e541c30074e4b3b2e0b924938b28383488dfc94eb5a896fce8d8d9407"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.3.0/bili-linux-arm64"
      sha256 "a7ceaddda5b7e047dcd99cb7766f59b2b215082a29438fa27f4e6b2f072f35bf"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.3.0/bili-linux-x64"
      sha256 "03cac98f0c1cbf8a3549ee73cc070415fa604630f2f086276894eacfea260c82"
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
    assert_match "bili 0.3.0", shell_output("#{bin}/bili --version")
  end
end
