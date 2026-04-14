class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.0/csvql-macos-aarch64.tar.gz"
      sha256 "751ab83ddaba5f00e9197e3e1791e6f8f81e529137c85d361e1409e410032889"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.0/csvql-macos-x86_64.tar.gz"
      sha256 "4f7b4a50927ab06d8ef3d3fbe853cd3d72793df0408181d2a723b2efd7d7fc0c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.1.0/csvql-linux-x86_64.tar.gz"
      sha256 "18bd25bcc761cc4a23f56c37b8e878811699a7748a7ca733b4e3dd20723a0401"
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
