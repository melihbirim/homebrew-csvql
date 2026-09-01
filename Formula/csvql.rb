class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-macos-aarch64.tar.gz"
      sha256 "f01a2f99b4ed7bfc999d63f683360115b6536a0f617878236bc9d30d40a15eeb"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-macos-x86_64.tar.gz"
      sha256 "217e890e16a3c51a3935f3bd21dfca02e3b41cdf3753c137205600a0d0e21bbb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-linux-x86_64.tar.gz"
      sha256 "6ff06cca42f0eb82483fc79848502eb7786b2c66775901c9ac5dea96b5154e0a"
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
