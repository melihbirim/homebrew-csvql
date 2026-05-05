class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.1/csvql-macos-aarch64.tar.gz"
      sha256 "a3e5648689a0f7fd4947bc44ab7596a764ad25866690688fb8d6ce04bdfe5ab9"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.1/csvql-macos-x86_64.tar.gz"
      sha256 "43f951730b7aaddb2aeabe21ab18b47c032dd26b96b6bb99db20623f50b4a438"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.1/csvql-linux-x86_64.tar.gz"
      sha256 "4a27eeacb3f869ed41bb81b74d9ef5852918f88d8d5fb36284efbab457366c42"
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
