class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.1/csvql-macos-aarch64.tar.gz"
      sha256 "a10618fccff3c37f8d2db0b2101c528240e1aaa024224620d135e390a0f4592b"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.1/csvql-macos-x86_64.tar.gz"
      sha256 "2e89685d658a8a59e079f13b1cd89b2b4c4cce67097e7e877e9714ce9ec7bc51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.1/csvql-linux-x86_64.tar.gz"
      sha256 "af4df5c725da57e97fc1a9b499d4804d54014cc45422c5aa1e0e8bc7b80b58e3"
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
