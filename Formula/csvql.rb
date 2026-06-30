class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.11/csvql-macos-aarch64.tar.gz"
      sha256 "581ace7951edab3222c4700219e653ab33133f9b23ce8034c0046b180f8ac3ed"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.11/csvql-macos-x86_64.tar.gz"
      sha256 "439e19b7d142afb4cdfc3c3d6c368fb5fcba4786ad64871043c7980597547b27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.11/csvql-linux-x86_64.tar.gz"
      sha256 "2913ad73c615582ac08fdc02deed2e6b5d805132d494d3e2567fad0c017524f0"
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
