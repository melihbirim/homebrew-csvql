class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "3.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.2/csvql-macos-aarch64.tar.gz"
      sha256 "a133baa150bf9da38b00c6dca4de18b154a38f6f36d4bce2fd6db2956564731e"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.2/csvql-macos-x86_64.tar.gz"
      sha256 "7c3a69262bba3bc92f350bbaa9a1ca23c513832caddd05496123048fd0114184"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.2/csvql-linux-x86_64.tar.gz"
      sha256 "8fe90f0d61fecbec03f3150f29ee8e08044e045bd4a8d44a7fc9db2507cc5479"
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
