class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.6/csvql-macos-aarch64.tar.gz"
      sha256 "d98bc57cd93850b0997a3154ac50b16f9dcf4ea443e28941faa86e180971fc23"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.6/csvql-macos-x86_64.tar.gz"
      sha256 "6035717cb5f1f62c7e46014d404cb50d0c2223e68e99ec8515f0dd101da93728"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.5.6/csvql-linux-x86_64.tar.gz"
      sha256 "44faf734a174534051d68ac7158290388d3cf3764dc807675013d7b7173cd00c"
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
