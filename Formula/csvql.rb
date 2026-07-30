class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.1/csvql-macos-aarch64.tar.gz"
      sha256 "cadd7cdc9c6ff1c68e5f200c76b6b8e96c1ed79fa470fb9a79d6fbac57a70609"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.1/csvql-macos-x86_64.tar.gz"
      sha256 "c91b8c56f3921c720557f169b926cea9b4ed0e3738ea0dd3cb77f6bb3cf6b9cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.0.1/csvql-linux-x86_64.tar.gz"
      sha256 "56a26586cfd657ff2906c97cc96bc15222265dbc7d6347a7c9315d76876e7dee"
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
