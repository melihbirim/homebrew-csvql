class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.0/csvql-macos-aarch64.tar.gz"
      sha256 "f0634e73dde1f98ac5b7b4b8e3a1471e65305c524c84116fc5de1d9d21f740f4"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.0/csvql-macos-x86_64.tar.gz"
      sha256 "8b86c3dbf8131b2b84688c7052f9e4948066234b058f778b998080ead33b2578"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.0/csvql-linux-x86_64.tar.gz"
      sha256 "5cc7b1220411a03ffe38953547dfcebb953fd57b0b8b4fd62182dd060f80fefb"
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
