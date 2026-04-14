class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.1/csvql-macos-aarch64.tar.gz"
      sha256 "13168a0f70bf3ae0569f1c86c118ba7035ac4171ecfc761b44005be4924f4481"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.1/csvql-macos-x86_64.tar.gz"
      sha256 "0733a5e19d5f316a69a5cef00d40b7effa8b0b2daf1c4aed301ca8dd872de74a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.2.1/csvql-linux-x86_64.tar.gz"
      sha256 "42a1cb11d7ff5f1a9def8d6fabb5a9ad25d84eec3554c080e72c04757349fd34"
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
