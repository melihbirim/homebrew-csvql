class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.8/csvql-macos-aarch64.tar.gz"
      sha256 "c3c71c28e593213dda90ea6a3e9528c9a78994dfb54422a0b09ea1bb60625001"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.8/csvql-macos-x86_64.tar.gz"
      sha256 "51225eb7ad53c61acbe817e91d5fefac73ec28df74fb3411bbde02b30c4c5d87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.8/csvql-linux-x86_64.tar.gz"
      sha256 "32dc81a16aa2761e21204b8d3b7a863d0beb56a4080fdc17650f4ca621579cce"
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
