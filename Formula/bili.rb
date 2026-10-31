class Bili < Formula
  desc "Zero-dependency Bilibili CLI with JSON envelope, QR login and ASR"
  homepage "https://github.com/qunqin219/bcli"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.0/bili-macos-arm64"
      sha256 "f132eb79cde367cb88bd9db206bf491bc26a3a50c2750d3e8dbe46766fb93e4a"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.0/bilicli-0.6.0.tar.gz"
      sha256 "1a02d6f441a008c2d14c756714c6c8d2b679e10857a17f12f58120362e9f5b50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.0/bili-linux-arm64"
      sha256 "c2c0f182a749b56975739c3f7820fd74306739db4420c9720f2b70fd19fc48fb"
    end

    on_intel do
      url "https://github.com/qunqin219/bcli/releases/download/v0.6.0/bili-linux-x64"
      sha256 "187bf6e65744e021f7acdafd97341b95e742f2f73ee1a00d4f327b894a2285ba"
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
    assert_match "bili 0.6.0", shell_output("#{bin}/bili --version")
  end
end
