class NnnNerd < Formula
  desc "Nnn file manager with Nerd Font icon support"
  homepage "https://github.com/jarun/nnn"
  url "https://github.com/jarun/nnn/archive/refs/tags/v5.1.tar.gz"
  sha256 "9faaff1e3f5a2fd3ed570a83f6fb3baf0bfc6ebd6a9abac16203d057ac3fffe3"
  license "BSD-2-Clause"
  head "https://github.com/jarun/nnn.git", branch: "master"

  depends_on "gnu-sed"
  depends_on "ncurses"
  depends_on "readline"

  def install
    system "make", "install", "PREFIX=#{prefix}", "O_NERD=1"

    bash_completion.install "misc/auto-completion/bash/nnn-completion.bash" => "nnn"
    zsh_completion.install "misc/auto-completion/zsh/_nnn"
    fish_completion.install "misc/auto-completion/fish/nnn.fish"

    pkgshare.install "misc/quitcd"
  end

  def caveats
    <<~EOF
      Nerd Font icons require a Nerd Font in your terminal.
      See: https://github.com/jarun/nnn/wiki/Advanced-use-cases
    EOF
  end

  test do
    # Testing this curses app requires a pty
    require "pty"

    (testpath/"testdir").mkdir
    PTY.spawn(bin/"nnn", testpath/"testdir") do |r, w, pid|
      w.write "q"
      output = if OS.mac?
        r.read
      else
        Process.wait(pid)
        r.read_nonblock(4096)
      end
      assert_match "~/testdir", output
    end
  end
end
