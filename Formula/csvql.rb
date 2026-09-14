class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.7.0/csvql-macos-aarch64.tar.gz"
      sha256 "40a9f1db9ae65b22a33f8c9856a3910a692612d9035a0e265250aca6f962310c"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.7.0/csvql-macos-x86_64.tar.gz"
      sha256 "ba9c2458f80aed3be67c8fb5d562818c7ee979c7b5369740cef715d5869f0a46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.7.0/csvql-linux-x86_64.tar.gz"
      sha256 "7929ce39f5324488134ede1db1afb8c53f22c837708c985969a82686593cd4a8"
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
