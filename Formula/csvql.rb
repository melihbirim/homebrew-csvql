class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.0/csvql-macos-aarch64.tar.gz"
      sha256 "fe25ceea877975d5ce801aa5573c6014c2da79ceeee388f9a2aaf6726e2b9f25"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.0/csvql-macos-x86_64.tar.gz"
      sha256 "e8024ea3140566f1295157e83d5f8b2315b54414d00388c3367bfd470528423e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.8.0/csvql-linux-x86_64.tar.gz"
      sha256 "3d8d32aea19192341d185aae1315439ab1f79363d1d86e91ab92e52156d8a66c"
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
