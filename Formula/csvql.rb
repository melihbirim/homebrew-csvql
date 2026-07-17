class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.0/csvql-macos-aarch64.tar.gz"
      sha256 "828b0de387318a0174781f1f64fe926f4679693881252aaf4f64adfbf37d413d"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.0/csvql-macos-x86_64.tar.gz"
      sha256 "2d989c8ee69871afd894d981c4ba88a2dbc1879472912c90ec1f093515871c10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.7.0/csvql-linux-x86_64.tar.gz"
      sha256 "71cd9af47e825b84260b4795a045dd9780f6a38dda1cd13beb1931f9118ccf7c"
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
