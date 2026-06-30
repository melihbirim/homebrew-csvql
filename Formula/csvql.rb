class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.10/csvql-macos-aarch64.tar.gz"
      sha256 "ab900d96d163d5185bc09306fdd92cab4ce71bfad4891a81cb8c54202eda8aa4"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.10/csvql-macos-x86_64.tar.gz"
      sha256 "20e8df9c88ec50e060babcaa2d9aa684a591f9d4458a242e4b70e632ff999ba9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.10/csvql-linux-x86_64.tar.gz"
      sha256 "54cb17952a8e1b1fbfcb72405a6ea0336d27a5290a7d09f4ff30e5ddb0280af8"
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
