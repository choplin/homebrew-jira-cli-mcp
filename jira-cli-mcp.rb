class JiraCliMcp < Formula
  desc "MCP server that wraps jira-cli for AI assistants"
  homepage "https://github.com/choplin/jira-cli-mcp"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.3.0/jira-cli-mcp-darwin-arm64.tar.gz"
      sha256 "735b7e24a569c7bc9f26827fc9b559f82db6947b5706909e330e1732b39d2712" # darwin-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.3.0/jira-cli-mcp-darwin-x64.tar.gz"
      sha256 "c4828c8e776dd9aea7430e36032d67513a3d36fcd72360803d098864d4b971e1" # darwin-x64
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.3.0/jira-cli-mcp-linux-arm64.tar.gz"
      sha256 "b4e37ac43611e93ff3a237ac47f449109260da4b0b82a11c76969de20dc02cec" # linux-arm64
    else
      url "https://github.com/choplin/jira-cli-mcp/releases/download/v0.3.0/jira-cli-mcp-linux-x64.tar.gz"
      sha256 "ac22fcec61803f7556b49227fd08b117c034a1270622a9c3dc09aa48ecab5a05" # linux-x64
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
