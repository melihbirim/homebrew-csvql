class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.2/csvql-macos-aarch64.tar.gz"
      sha256 "dc8922fcd3f85f8e2ec40d5c382b8893c34e238fc315be3b02a66d37665abf58"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.2/csvql-macos-x86_64.tar.gz"
      sha256 "f3e04832c9548368ec808ea476682f1565643fb343df1726a69ad490de2419ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.2/csvql-linux-x86_64.tar.gz"
      sha256 "0dd589b134d94d72d056a406d92ee2c5fcffe313bd75f4a23a60b367c269eaa3"
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
