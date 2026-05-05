class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.4.0/csvql-macos-aarch64.tar.gz"
      sha256 "f88efc5281c9d4b17374340f0d524d9f189a4e126db63ef28b2fc46ce0354f59"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.4.0/csvql-macos-x86_64.tar.gz"
      sha256 "d4cabc0204ec1632b20734048071c8ec09e2cddfc816706581358c60ee02bed8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.4.0/csvql-linux-x86_64.tar.gz"
      sha256 "62f0cdcc27376483ee67365330138e9b76f207d6c4e222552bc756296706b723"
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
