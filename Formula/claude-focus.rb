class ClaudeFocus < Formula
  include Language::Python::Virtualenv

  desc "One priority queue over all your Claude Code sessions in herdr or iTerm2"
  homepage "https://github.com/nejko/claude-focus"
  url "https://files.pythonhosted.org/packages/07/73/c8990b5c2c541e4bf9b4cfc3764fd23aea5c2774b55bef80bbf2845d9d41/claude_focus-0.1.1.tar.gz"
  sha256 "30e9878ca71b26f0b462d348a4ade21d39f38b66707acf96771850ff4472c1ab"
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
    url "https://files.pythonhosted.org/packages/30/4b/4692be6d5bf739ed049b3813901c42091f8c054df89d5c089343823dea0d/websockets-17.3.tar.gz"
    sha256 "1c7dd93a1c9f89297471493674b1fc1d9467cafd45374f2172213046bdb3a329"
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
