class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v2.2.0/csvql-macos-aarch64.tar.gz"
      sha256 "5f26f50cd15edafb468b3bc11149946c8023d647f21495ec60502deb3927cde4"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.2.0/csvql-macos-x86_64.tar.gz"
      sha256 "265fdb448b3b05c1cffbf7a834ecc1c8c002d4c513be962ae041606dbf9b2398"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v2.2.0/csvql-linux-x86_64.tar.gz"
      sha256 "a1a35afc6d7875a1ebb57d3bd4d8022ac77c3bada35462cbbe0887d0b0205d08"
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
