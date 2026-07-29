class Csvql < Formula
  desc "Ultra-fast SQL query engine for CSV files with SIMD parsing and parallel execution"
  homepage "https://github.com/melihbirim/csvql"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/melihbirim/csvql/releases/download/v1.9.0/csvql-macos-aarch64.tar.gz"
      sha256 "f477ccad4b3b905eef853b3ea5777f65570f0e0e76a371f7d5de730c869d5745"
    end
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.9.0/csvql-macos-x86_64.tar.gz"
      sha256 "462929fee2a9da7a06d8255935bc5bfd25742bf192a5f79b3ee94773ccfc8647"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/melihbirim/csvql/releases/download/v1.9.0/csvql-linux-x86_64.tar.gz"
      sha256 "5f9c52deb8f8534b76484f444d97255cb4d4624207b5419554931c98a91ea5ba"
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
