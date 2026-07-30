class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.2/csvql-macos-aarch64.tar.gz"
      sha256 "0579481b632a13ef3962a13e17839e9517257c1f26285404be3f634c6f47be4f"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.2/csvql-macos-x86_64.tar.gz"
      sha256 "0ee9d06926752c92e939b4fbcbf9a584ef3b51bcf7e4f96435c1934188fd7acf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.2/csvql-linux-x86_64.tar.gz"
      sha256 "e34ff54069167ca54cc798f0b89c21deb2728b43687f104a2432e6d619927cd5"
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
