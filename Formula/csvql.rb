class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.3.0/csvql-macos-aarch64.tar.gz"
      sha256 "9376a9ffef5d2d1fd8056e7204b7f902f4127301a0e0f94ffc0cc09c48d411d2"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.3.0/csvql-macos-x86_64.tar.gz"
      sha256 "f3141c3db173d635359fc6cfd616051a77ebbf0be66ea4fe6ef87bd2a03fbfe6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.3.0/csvql-linux-x86_64.tar.gz"
      sha256 "c4a30f8ef564cb0dfe5c8122472b12c804c5b64fe32cc61cc5bf26f9ac55b384"
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
