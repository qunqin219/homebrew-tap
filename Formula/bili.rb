class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.0/bili-macos-arm64"
      sha256 "ad315e822c9580e1da95d0e3b6f61c42b0e601c07e7d133bb92d4fd4400a9b77"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.0/bilicli-0.5.0.tar.gz"
      sha256 "7e0db91bd22af4e5b59d3382865a31b4b56e381879dd72b4643f65690d04ea8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.0/bili-linux-arm64"
      sha256 "ceec6eb65fe7863d2637199c629add3a378da1358df13d2931e268aeb4293ce2"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.5.0/bili-linux-x64"
      sha256 "11e944b77f96be80d4009cacdef5a0ce1d215602609433ac839ddfb3c893fe32"
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
    assert_match "bili 0.5.0", shell_output("#{bin}/bili --version")
  end
end
