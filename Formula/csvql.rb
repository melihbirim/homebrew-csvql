class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.1/csvql-macos-aarch64.tar.gz"
      sha256 "cc4313af1a60502471c561c4f13f627b586c84138f7687e261823b0a4b27d172"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.1/csvql-macos-x86_64.tar.gz"
      sha256 "d2f66937a4a0d27e82de1f421ce8bf561f2fe6cbade9590ac43f4f5f0646f765"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.1/csvql-linux-x86_64.tar.gz"
      sha256 "2b2224b171139160ccf692172f83ad184cf9de02b0fb0444eb7058bbcc0e5793"
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
