class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.0/csvql-macos-aarch64.tar.gz"
      sha256 "d28e08501a24b26663d847aa59c5602ef76dc4f435f5c2bd4e519817786f22f2"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.0/csvql-macos-x86_64.tar.gz"
      sha256 "77a7645366a865be32b90bcbfe6f55d76cd1761e84d95549fa4f99e57028f508"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.0/csvql-linux-x86_64.tar.gz"
      sha256 "d23f32a46641e19b1cfe1daa40f6b4230cdbccfed059dcdaf58bbd5276a1ea6c"
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
