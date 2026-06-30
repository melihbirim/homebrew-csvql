class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.7/csvql-macos-aarch64.tar.gz"
      sha256 "03c3b3cc4110a7ec25d605b45df9d8077d9a4a58c1494c5b2dcf1bb9812f759f"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.7/csvql-macos-x86_64.tar.gz"
      sha256 "5e5709c168976015f228e58afd1c3d3e7d67c35e9bf6ff9bc48723fcc4be7b44"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.7/csvql-linux-x86_64.tar.gz"
      sha256 "1126ee3225e412071f3d552db294f6d98af54c94f8372f90f15a313e92ebbcad"
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
