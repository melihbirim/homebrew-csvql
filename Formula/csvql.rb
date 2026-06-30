class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-aarch64.tar.gz"
      sha256 "793b40a8c9727ffd4cf947b766e453a938f2bbe9c9b471107942684861f2d7af"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-x86_64.tar.gz"
      sha256 "ba9409bcf5879ed470259802839f9e25e235d37fe86fab9eb3788c96529d6b39"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-linux-x86_64.tar.gz"
      sha256 "2f24be891da935426b2d27f5cd150d6ebaf2642979843e94839ce82a93e8030e"
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
