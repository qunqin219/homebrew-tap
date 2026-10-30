class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.3/bili-macos-arm64"
      sha256 "2ee8f34ecbbbc46a11678c156169471ede576ce45a4a9f13f03bdd6f553a69c5"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.3/bilicli-0.2.3.tar.gz"
      sha256 "e5213d428ba534ab332886bd6835b203e00c6fbfc33a37ec7fabb7f20eb588b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.3/bili-linux-arm64"
      sha256 "874a9bd9349b9232fba407b0f39122cddbdef69fdf9150ff33d6a837c75db69b"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.2.3/bili-linux-x64"
      sha256 "43346c6898b2fd808114ff0f457c38208691fa71e9fea688184cfd0d12c61e25"
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
    assert_match "bili 0.2.3", shell_output("#{bin}/bili --version")
  end
end
