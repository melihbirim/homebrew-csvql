class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.4/csvql-macos-aarch64.tar.gz"
      sha256 "5a26a9da846fdaaa82e00cedccb298f748e02a2cdfb8a5d246a861ec8e82bf42"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.4/csvql-macos-x86_64.tar.gz"
      sha256 "dfffa42f43dbf42b3e4473081497c38c62763b1e6ee8797d0420401e653cd93d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.4/csvql-linux-x86_64.tar.gz"
      sha256 "dc977023989e9da17941d17b68d4bf1921b6b990f56a41cd320b41b22ba1bbfd"
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
