class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.8.0/csvql-macos-aarch64.tar.gz"
      sha256 "915558f6c15a805361d62bdb7db9a08c2014356e69e37e496a8aa3d80bd61e65"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.8.0/csvql-macos-x86_64.tar.gz"
      sha256 "5586b75223667781427dbfd7c8bf6af693c27f7d57d2f5c78dcee8662a35111b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.8.0/csvql-linux-x86_64.tar.gz"
      sha256 "a679a2e387bf60d100d33dfd7931f81b360cbe7bcf96565bafa08444a5109aa9"
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
