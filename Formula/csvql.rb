class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-aarch64.tar.gz"
      sha256 "4afbfa8b79a43065497b237cd7aaf5e0e9770a35b5e7d1a3a83437e5d398c26f"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-x86_64.tar.gz"
      sha256 "9b5a8c22126c25b92e70256b3c6885b0494ccb16f69bf11fa2ccc201f612137f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-linux-x86_64.tar.gz"
      sha256 "38e4463c20d6f8dbb3c68e798d67e03ef34731bb899190d2f85aef20552e7e37"
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
