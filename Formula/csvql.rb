class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.5/csvql-macos-aarch64.tar.gz"
      sha256 "9495b5bcd4e2d4246e57203b7ad14fcaae3c7915d293b7ea6a5cf3c10c362851"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.5/csvql-macos-x86_64.tar.gz"
      sha256 "762d19a4d62b6a5c2a0e153ab199a05e427adf6e1dafb1831fcbc3cb480434d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.5/csvql-linux-x86_64.tar.gz"
      sha256 "f845d9e3ce5aa942d472778f1513c5e22b53cc256b6d2a92d2531ba1907ca981"
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
