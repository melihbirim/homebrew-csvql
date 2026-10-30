class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.10.0/csvql-macos-aarch64.tar.gz"
      sha256 "c498a17e99861cb78852bb061ad75c4a8de17951ba3f91b29eb3587761544da2"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.10.0/csvql-macos-x86_64.tar.gz"
      sha256 "3bced82ab2bd8a8ec85f77415e723eac976e5e07163a3bd7e88d857d68d107a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.10.0/csvql-linux-x86_64.tar.gz"
      sha256 "9e44e31a6b1788ada94365d57db85ad3ec14f5ed7cebc154ba1857c84e9817e5"
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
