class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.1/bili-macos-arm64"
      sha256 "df34a3041ab8eaf96e6303988d5e4a1ff223aaa49e0fb35e350856871e76008a"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.1/bilicli-0.4.1.tar.gz"
      sha256 "71c50ec75d849ab3546e08a005bef13b101e906910efdd14dbb47deb74fc5bdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.1/bili-linux-arm64"
      sha256 "b89eb36dd89cfff9aff3af3f5d8c8cdd4ea1a3c268dee1c8eb57fee4d6b3238e"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.4.1/bili-linux-x64"
      sha256 "f1ffeb28c697d029a9bbbca684f8bd5a5d20b291c7cd05d94684e59eae8f50b0"
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
    assert_match "bili 0.4.1", shell_output("#{bin}/bili --version")
  end
end
