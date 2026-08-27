class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.0/csvql-macos-aarch64.tar.gz"
      sha256 "4e8f56fe9e440429db4300e52dd24a83bb40fa20f4b4af9d501abe873a47a40d"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.0/csvql-macos-x86_64.tar.gz"
      sha256 "88e72764944c1eb87099a57186fcea1d75362256e809307e211bda80b0fac8d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.0/csvql-linux-x86_64.tar.gz"
      sha256 "e5ac8f2aa765fbd5f082512ab066793a220b591ecd2cc9a58a90366f7b7a6afb"
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
