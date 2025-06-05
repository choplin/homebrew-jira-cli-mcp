class JiraCliMcp < Formula
  desc "MCP server that wraps jira-cli for AI assistants"
  homepage "https://github.com/choplin/jira-cli-mcp"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.0/jira-cli-mcp-darwin-arm64.tar.gz"
      sha256 "fee51857a8e69e9aa5e111e33862f6018d7ff37e4ae89c39ef576167491c9376" # darwin-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.0/jira-cli-mcp-darwin-x64.tar.gz"
      sha256 "28416ba57dca4f1126d5a3e994e18d368f97c215b02cb7a6bd3fedd4af7fd940" # darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.0/jira-cli-mcp-linux-arm64.tar.gz"
      sha256 "1311142a6af08a52261dcde86acd0b8d26d5ed70fbc62d418523c30fb232988e" # linux-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.0/jira-cli-mcp-linux-x64.tar.gz"
      sha256 "155622a0357448680beb0904bbd758969e4962ec44a1ed95ce3b17d5f9566477" # linux-x64
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
