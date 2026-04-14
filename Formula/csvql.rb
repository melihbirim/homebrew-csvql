class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.1/csvql-macos-aarch64.tar.gz"
      sha256 "1efeb62ee8d1318579771642ef1545420594aa7c28856def6854557f44925eda"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.1/csvql-macos-x86_64.tar.gz"
      sha256 "07f67d01700c766e3fd72b4ae9cecd85ec8678f923459f1982def0ece1827e30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.0.1/csvql-linux-x86_64.tar.gz"
      sha256 "f85711d726cfa70d13e0ff3791eb66f001c15799103706c1e3c45148b5e7ad86"
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
