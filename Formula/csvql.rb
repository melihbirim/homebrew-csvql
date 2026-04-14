class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.2/csvql-macos-aarch64.tar.gz"
      sha256 "4793a9130ac38aa546f1d785b20bc13288efafd206e9e7cf26fcaaf876cac066"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.2/csvql-macos-x86_64.tar.gz"
      sha256 "7e384aa6ae09096fc08a4ea74d8854f18200060832e11aae48395fac89eb888b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.2/csvql-linux-x86_64.tar.gz"
      sha256 "bc9690bc73975283ddbc1a7b6e85aadc3b895d2705416c242b7c99466b50f657"
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
