class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.5.0/csvql-macos-aarch64.tar.gz"
      sha256 "238739488d85b2421b8a6e48908f97f90f3deb6494d363066ad1bb903b954815"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.5.0/csvql-macos-x86_64.tar.gz"
      sha256 "27a76e2a5b4388982eb229d6330222b44916a0c91fc9b67b02f60dcc34ce02d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.5.0/csvql-linux-x86_64.tar.gz"
      sha256 "0638960935c03c8408e4e40b9749f2dbe7ec329e838ff4ab019d3cb3bd2ac993"
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
