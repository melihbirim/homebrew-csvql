class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-aarch64.tar.gz"
      sha256 "24c7516a159c0cff9189aebf5f1ff5ab36760039a1e9c5ca58451f840bfc53a5"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-x86_64.tar.gz"
      sha256 "61f3c2afe212add799b34cce66f1381d06f7529898d1da260d6e04c2c2af3905"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-linux-x86_64.tar.gz"
      sha256 "1914d55dfa4f0aec44f7fcbdefa7178f2a6ce9da5acf7e1e858ae2987020b6ea"
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
