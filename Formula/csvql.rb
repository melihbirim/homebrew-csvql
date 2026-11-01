class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "3.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.1/csvql-macos-aarch64.tar.gz"
      sha256 "57aa7b86083f61c867d250588b3dda9d1bc827c9ed125b294d66271bb8c267f9"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.1/csvql-macos-x86_64.tar.gz"
      sha256 "1bac99c47b0f8507b3c7d13c34217958a97f5c117d1ba0ea8bd934aeab50ccc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v3.0.1/csvql-linux-x86_64.tar.gz"
      sha256 "d395d903e6a9a5591d84ce9e95b2930c264134a84733b5f417aec862b467b52e"
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
