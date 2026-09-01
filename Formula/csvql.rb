class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-macos-aarch64.tar.gz"
      sha256 "4e4fa4f0fa9a162c9c69932daa4f30a001a9faad49aba846534270c9f9d10ccf"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-macos-x86_64.tar.gz"
      sha256 "f0c54a931a6c5e195276321b1ba0eaa4e078231525c674ac2147443c8b906346"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.6.2/csvql-linux-x86_64.tar.gz"
      sha256 "5c248b82e65fc621ccb3abf413eb62b53f55109fb0da4e7a6aaacf236789e043"
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
