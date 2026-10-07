class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.1/csvql-macos-aarch64.tar.gz"
      sha256 "2b254afcf234060fb3513b58a35b645ad45072497c040e6f0ddc13356fca3043"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.1/csvql-macos-x86_64.tar.gz"
      sha256 "7087a3ae3bd64ef7559dc55b75dc3f7f0ba85bb2ad715aebcc3d0cc0cfcc54f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.1/csvql-linux-x86_64.tar.gz"
      sha256 "208d3164b886cbacd21146e0bac25d57684c95517d322c8598052a1b2e335c8e"
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
