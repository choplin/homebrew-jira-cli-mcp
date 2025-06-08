class JiraCliMcp < Formula
  desc "MCP server that wraps jira-cli for AI assistants"
  homepage "https://github.com/choplin/jira-cli-mcp"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.4.0/jira-cli-mcp-darwin-arm64.tar.gz"
      sha256 "f271edf4bddb0887139f7da786d731310ab2f342ad94ad1c2ffef34e5d52484a" # darwin-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.4.0/jira-cli-mcp-darwin-x64.tar.gz"
      sha256 "e8db668137cad1b6bc842f667a7f8ef77db35b1892a3f2365b9dceb24064aadd" # darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.4.0/jira-cli-mcp-linux-arm64.tar.gz"
      sha256 "9d90149539fcd61a24a8fe834beddb218a58a417e64f480b8b2729d8ceea54e2" # linux-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.4.0/jira-cli-mcp-linux-x64.tar.gz"
      sha256 "9419535462bdd338bce245f9a8dfb8298120aedc8bde659ce507a1be2872ec9c" # linux-x64
    end
  end

  depends_on "jira-cli"

  def install
    binary_name = "jira-cli-mcp-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch}"
    bin.install binary_name => "jira-cli-mcp"
  end

  test do
    # Test that the binary runs
    assert_match "MCP Server running", shell_output("#{bin}/jira-cli-mcp 2>&1", 1)
  end
end
