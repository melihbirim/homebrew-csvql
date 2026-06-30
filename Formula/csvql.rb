class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.9/csvql-macos-aarch64.tar.gz"
      sha256 "8786b6fbfb0062101c25d972fbcd8992d00461c90396cdbe5449d2c138655a2c"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.9/csvql-macos-x86_64.tar.gz"
      sha256 "6a27a3fbebaabaa883f7355dfc0cd364bfdeeb6f039e117693da08011cbf75dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.9/csvql-linux-x86_64.tar.gz"
      sha256 "75a4b4c0118591d8ccc7ab394e3c5ff3c2f432f0a7bfefae7bfc29bb0826d86b"
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
