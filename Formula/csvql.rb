class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.1/csvql-macos-aarch64.tar.gz"
      sha256 "407f8117d838b58a6069c941ea6ceb8acee6ad66c2e9ce0a5d0c89aeff96c665"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.1/csvql-macos-x86_64.tar.gz"
      sha256 "ee0fbeb58c2706f9cbbed6a586a8126b6a9efc6d8eaa2a66263f79f2f7bd7441"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.1/csvql-linux-x86_64.tar.gz"
      sha256 "7c1c259b81b66606e1d6069f7c62f0fa34c81f212180a26389e1a3f83fad8cfe"
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
