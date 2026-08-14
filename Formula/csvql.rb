class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.3.0/csvql-macos-aarch64.tar.gz"
      sha256 "c5339f542e76c440165ebacfa2139a943acbf6581006e962340924740e43a1c0"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.3.0/csvql-macos-x86_64.tar.gz"
      sha256 "c3934f5fd509f051697d8372057c937c2c4e995d47742c27b636f47c997049e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.3.0/csvql-linux-x86_64.tar.gz"
      sha256 "377bec821cd2e7505c1edf4f183870e38ea732f7feb8414876702843ffeb3c86"
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
