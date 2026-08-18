class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.3/csvql-macos-aarch64.tar.gz"
      sha256 "0bc4ef5117e3cf19463a9bc54855a68ad7466834c7b53dbbd9ff1f6163896174"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.3/csvql-macos-x86_64.tar.gz"
      sha256 "4448e6e8d8efd465a15c42469b7ce03b9684d82ad22c0db1554da359be811b72"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.3/csvql-linux-x86_64.tar.gz"
      sha256 "1238a014ff82d2474e93b11a473de7bad23603ac7d1e9d16b0e68114d2de61f6"
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
