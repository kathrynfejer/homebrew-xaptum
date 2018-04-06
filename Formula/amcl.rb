class Amcl < Formula
  desc "A standards compliant C cryptographic library with no external dependencies, specifically designed to support the Internet of Things (IoT)."
  homepage "https://github.com/milagro-crypto/milagro-crypto-c"
  version "4.7.0"
  url "https://github.com/milagro-crypto/milagro-crypto-c/archive/4.7.0.tar.gz"
  sha256 "1c17bfbc384723b25a274091082c263ff87453a4e347a50d96c174defaddc979"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args,
             "-DAMCL_INCLUDE_SUBDIR=amcl",
             "-DBUILD_BENCHMARKS=OFF",
             "-DBUILD_DOCS=OFF",
             "-DBUILD_EXAMPLES=OFF",
             "-DBUILD_PYTHON=OFF",
             "-DBUILD_TESTING=OFF"
      system "make"
      system "make", "install"
    end
  end

end
