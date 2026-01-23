class Feedr < Formula
  desc "Terminal RSS/Atom feed reader"
  homepage "https://github.com/bahdotsh/feedr"
  url "https://github.com/bahdotsh/feedr/releases/download/v0.3.0/feedr-v0.3.0-source.tar.gz"
  sha256 "6f0da013b12215d7d5ebeaa05f283f25d69a94cd7649793c74b778ba4e7a9902"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    ENV["OPENSSL_DIR"] = Formula["openssl@3"].opt_prefix
    ENV["OPENSSL_NO_VENDOR"] = "1"

    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "feedr", shell_output("#{bin}/feedr --help")
  end
end
