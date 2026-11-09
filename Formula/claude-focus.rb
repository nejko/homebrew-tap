class ClaudeFocus < Formula
  include Language::Python::Virtualenv

  desc "One priority queue over all your Claude Code sessions in herdr or iTerm2"
  homepage "https://github.com/nejko/claude-focus"
  url "https://files.pythonhosted.org/packages/22/e2/64459c2421ab6b9984e15d855192d210ad4814022e7186757985fe46b53b/claude_focus-0.1.4.tar.gz"
  sha256 "0ed7d32db7afe5452582623a32446f99a7483a9ce9e2ae9f7673536fbcb5f04d"
  license "MIT"

  depends_on :macos
  depends_on "python@3.15"

  resource "iterm2" do
    url "https://files.pythonhosted.org/packages/36/a8/e88133c8b7418bd0905859a2f9dd0f5388c5a394434790e46e54cf15678c/iterm2-2.30.tar.gz"
    sha256 "eaa814b64f11d58984dfa02e790016983e7c4eb4f41cceae174ba361708200ec"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/d9/89/5b8517baa72f84a67b8a307ba953c91057af618bf40bf676f3c03551f8f0/protobuf-7.36.2.tar.gz"
    sha256 "497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/75/79/590c5f0cc7d1661195aeefccb0e342b79f4c77d368d526d028821a390332/websockets-17.4.tar.gz"
    sha256 "09d3939b70df0c8ad2da145ebd50978bccaee1d565e838b0e7921a34d38571eb"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Finish the setup in iTerm2 (turn on its Python API first: Settings > General >
      Magic > Enable Python API) or in a herdr pane:
        claude-focus setup
      After an upgrade, run claude-focus setup again: it restarts the background
      service on the new code.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-focus --version")
  end
end
