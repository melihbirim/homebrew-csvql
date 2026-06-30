class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.13/csvql-macos-aarch64.tar.gz"
      sha256 "633d1a8bdcd5fdb85cc10e7f1e955e6c5fed75162ab33de392af7e2d4ab7e25e"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.13/csvql-macos-x86_64.tar.gz"
      sha256 "bf6c9a27e5b43161f0183a45f9b07d4ca880573c7284220db94fa3a39d281faf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.13/csvql-linux-x86_64.tar.gz"
      sha256 "6fe5ea60fe37ce95f900421a52f07df8927c7407fd6a7329f3dfc00428efc204"
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
