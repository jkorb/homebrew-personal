class LuaAT51 < Formula
  desc "Powerful, efficient, lightweight, embeddable scripting language"
  homepage "https://www.lua.org/"
  url "https://www.lua.org/ftp/lua-5.1.5.tar.gz"
  sha256 "2640fc56a795f29d28ef15e13c34a47e223960b0240e8cb0a82d9b0738695333"
  license "MIT"

  keg_only :versioned_formula

  def install
    system "make", "macosx"
    system "make", "install", "INSTALL_TOP=#{libexec}"

    bin.install_symlink libexec/"bin/lua" => "lua5.1"
    bin.install_symlink libexec/"bin/luac" => "luac5.1"
  end

  test do
    assert_match "Lua 5.1.5", shell_output("#{bin}/lua -v 2>&1")
  end
end
