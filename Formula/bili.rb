class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.0/bili-macos-arm64"
      sha256 "73fcc264aa076900bc5bf4c2087add40ef5572bda34837d0aab2c2337ebbf81c"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.0/bilicli-0.7.0.tar.gz"
      sha256 "a03c5a69d0cc8d74ff6dc6aba3d329f64e68dcd62edfe34907b0cf277c9f81f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.0/bili-linux-arm64"
      sha256 "274394bfcd26a3b5bee95cbf5a5d26c9e103f630914a345804032205254d96cf"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.7.0/bili-linux-x64"
      sha256 "e5f7e680725c79fac60e393f0bd6d909f0af794bb7d99237aa5097782a48a588"
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
    assert_match "bili 0.7.0", shell_output("#{bin}/bili --version")
  end
end
