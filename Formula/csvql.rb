class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.0/csvql-macos-aarch64.tar.gz"
      sha256 "d2f141c002868de4cbfee03ab93a6e2e6b8c11bc3f25d19cb1d37927e11568e9"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.0/csvql-macos-x86_64.tar.gz"
      sha256 "cf569f2eec621ec6b8d9cc4dffc77a1f1d7a0abf1f6e1dfa2bcbdaf76413caa6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.0/csvql-linux-x86_64.tar.gz"
      sha256 "f72cec2c32ef89e641e50caf7e232f9b508fb182c63eda527e6c7ef3a2ccc6e2"
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
