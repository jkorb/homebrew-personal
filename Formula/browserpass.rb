class Browserpass < Formula
  desc "Native messaging host for the Browserpass extension"
  homepage "https://github.com/browserpass/browserpass-native"
  url "https://github.com/browserpass/browserpass-native/releases/download/v3.1.2/browserpass-native-3.1.2-src.tar.gz"
  sha256 "f48e973e2b53874e691dd671dd0726a97a2b68109577ad3803fcf8cabd28fa0d"
  license "ISC"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "coreutils" => :build
  depends_on "gnu-sed" => :build
  depends_on "go" => :build
  depends_on "gnupg"
  depends_on "pinentry"

  on_macos do
    depends_on "pinentry-mac"
  end

  def install
    ENV["DESTDIR"] = ""
    ENV["PREFIX"] = prefix.to_s

    system "make", "configure"
    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOF
      To configure your browser, run:

        PREFIX='#{opt_prefix}' make hosts-BROWSER-user -f '#{opt_prefix}/lib/browserpass/Makefile'

      Where BROWSER is one of:
        chromium chrome vivaldi brave firefox librewolf edge arc
    EOF
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/browserpass -version").strip
  end
end
