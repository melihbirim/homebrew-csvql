class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.0/csvql-macos-aarch64.tar.gz"
      sha256 "9bbf0c8c44d71f5a04112a1ef81035443551aa7a1f82c4210f9aacb37cc300b6"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.0/csvql-macos-x86_64.tar.gz"
      sha256 "22a60eeb505a08cad4719282fabe0d22d31653dfee49804702856ef834eccda5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.4.0/csvql-linux-x86_64.tar.gz"
      sha256 "fab20298489d3133774c5c3aea5237e2d67635ba2724a7bc320079136722318a"
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
