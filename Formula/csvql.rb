class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.1/csvql-macos-aarch64.tar.gz"
      sha256 "f1f96160c550be18fb29e5fcc8bf7b32f6a34cb59b0672ec06446f50f066100c"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.1/csvql-macos-x86_64.tar.gz"
      sha256 "d929d9c0a12ce1f2e21991fd6c84535c1ca49645386f50b6471ba17535f12c5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.1/csvql-linux-x86_64.tar.gz"
      sha256 "e044a2cb64f7c8dc392cc37717d3105fa025e9f5387ad734914f185ddc44ba06"
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
