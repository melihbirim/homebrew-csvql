class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.0/csvql-macos-aarch64.tar.gz"
      sha256 "221b06ff96c33747be82cdc35eec5381b4b4aa200e635065df6c7eb7fa91a480"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.0/csvql-macos-x86_64.tar.gz"
      sha256 "bfb1e0b5e269c059db8e2d573d0c0dc1d1aba8ea41759e1c0aaa937f56987d0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.0/csvql-linux-x86_64.tar.gz"
      sha256 "f2b0958aa8848853e7866cdfd6f3253ac5762098e182e279c37d058dbe305723"
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
