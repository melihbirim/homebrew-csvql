class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.1/csvql-macos-aarch64.tar.gz"
      sha256 "4f6f73e9d54a21608823da83bdba7035563eb08783c43f6dda5ebdebf0dfe669"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.1/csvql-macos-x86_64.tar.gz"
      sha256 "76114f3310421d0a508d18de53e2f9d58ccd5d96c0b69d575d3138a6a371f46b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.1/csvql-linux-x86_64.tar.gz"
      sha256 "521c9954c3fe09e5ed0f66aa54a3750b4c09f1923da844b1f2ba9113f9f7f875"
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
