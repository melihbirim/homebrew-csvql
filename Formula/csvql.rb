class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-aarch64.tar.gz"
      sha256 "135a4def1256adc78f6fd124f814206201ac1277da4ae6c8e01bd6aa5db7f24b"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-macos-x86_64.tar.gz"
      sha256 "9a3494843f824e8953f1d442608b696b940b1acedacfbfe4a8523ebfd09a8eb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.12/csvql-linux-x86_64.tar.gz"
      sha256 "d94797cd160f0be169a9c7448179346d7a7195f71b5d93b95f8371b6d3200a17"
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
