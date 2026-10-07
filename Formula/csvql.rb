class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.9.0/csvql-macos-aarch64.tar.gz"
      sha256 "df517bb2acb5234b96725880d8cb5598f0f0decc1f6a1cb7d1c99fc762653e7a"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.9.0/csvql-macos-x86_64.tar.gz"
      sha256 "7a4fff59abb22870fa9d5cb0b29d7b29991207d5a27d201579b42bfe3b6a7464"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.9.0/csvql-linux-x86_64.tar.gz"
      sha256 "0121ecbc27be8342dad305bd15ea4efc791f72027676da866cefb082f101067e"
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
