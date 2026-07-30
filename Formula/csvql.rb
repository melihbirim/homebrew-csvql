class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.0/csvql-macos-aarch64.tar.gz"
      sha256 "d314076d53ee2b1ba2cd6bb7bef0d58d607078555bd0ac26e19bb2e6b31cfbf9"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.0/csvql-macos-x86_64.tar.gz"
      sha256 "f7e3868b1e8c2aae2050d412a4556e9696ff336b566c54d0fcf90acf96f860a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.0/csvql-linux-x86_64.tar.gz"
      sha256 "f253364e9504750737309132672fb46b7b57247ee392dd65254c79b502c21848"
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
