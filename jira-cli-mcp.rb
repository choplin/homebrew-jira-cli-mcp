class JiraCliMcp < Formula
  desc "MCP server that wraps jira-cli for AI assistants"
  homepage "https://github.com/choplin/jira-cli-mcp"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.1/jira-cli-mcp-darwin-arm64.tar.gz"
      sha256 "52b2ebf73f76b6a2da07b5accf3a35e0fceb017502501674f2904fdcdadfa66d" # darwin-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.1/jira-cli-mcp-darwin-x64.tar.gz"
      sha256 "a1ab1ba34c129b165d44ca7420769822de74ca4324e06e8975cfc8b2cccc62fd" # darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.1/jira-cli-mcp-linux-arm64.tar.gz"
      sha256 "d0fc2086bea5c4ca10a742480522e2d439fc4008e197abbf2324b85e0b3d25b9" # linux-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.2.1/jira-cli-mcp-linux-x64.tar.gz"
      sha256 "ded7732308a7b1d0b6e2e2ff9870eb087be85afe8be9a26fa21b19d27bc71dd4" # linux-x64
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
