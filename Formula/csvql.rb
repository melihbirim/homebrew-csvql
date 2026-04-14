class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.0/csvql-macos-aarch64.tar.gz"
      sha256 "d62f06a24a7759957f62ac2985173e8701269536661a52d5cf3dee694631c138"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.0/csvql-macos-x86_64.tar.gz"
      sha256 "272f6f8a9b60dfdf074c2fbfe92d0223b04474bcec6f2a7b798497b62ed117b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.0/csvql-linux-x86_64.tar.gz"
      sha256 "ae315df57d3fc34fb04ae90fd48ecc36a2ae7076548d4d9e475194b64ef1121e"
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
