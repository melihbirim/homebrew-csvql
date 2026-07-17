class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.1/csvql-macos-aarch64.tar.gz"
      sha256 "9e3e9e14e3733029f27fca082fa80478ba520c535c9bfdb1b712a6589e235299"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.1/csvql-macos-x86_64.tar.gz"
      sha256 "90f6bae4bfdf7303efd5c7893332fe89d41e751ccf504b6c52fcb25419f84b49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.6.1/csvql-linux-x86_64.tar.gz"
      sha256 "f238998c9eaf533788cb1a2cbe07cc97d3a13365cb5c92e947f74ff68e46667c"
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
