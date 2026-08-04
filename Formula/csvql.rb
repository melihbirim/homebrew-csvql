class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.3/csvql-macos-aarch64.tar.gz"
      sha256 "bcdb52cca58cd6e6a5a9507220eee897f7210387ac3ed2cd61f605a7d192e596"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.3/csvql-macos-x86_64.tar.gz"
      sha256 "55bfa8195ad0a315d6065373f1356b81405edd673c9a554a76e2ceb469957cc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.3/csvql-linux-x86_64.tar.gz"
      sha256 "e08f1fb0f56848adae54b77498aef3ce42ba4c846e5d0816ea4a9ab45c487f8f"
    end
  end

  def install
    bin.install Dir["csvql-*"].first => "csvql"
  end

  test do
    (testpath/"test.csv").write("name,age\nAlice,30\nBob,25\n")
    output = shell_output("#{bin}/csvql \"SELECT name FROM 'test.csv' WHERE age > 26\"")
    assert_match "Alice", output
  end
end
