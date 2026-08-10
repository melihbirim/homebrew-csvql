class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.0/csvql-macos-aarch64.tar.gz"
      sha256 "76d6d512c44dea57a5bbe0854c237714c8d9682e9906a411236a90581ff7d83f"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.0/csvql-macos-x86_64.tar.gz"
      sha256 "b6434bdd5b118338b33d5d87f510abb0e17f8bdbd19987920831c89201457ffa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.1.0/csvql-linux-x86_64.tar.gz"
      sha256 "6c7978fee8a57a9e4c90d6b536e43c354f493a618031e88dec9e82391036d244"
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
