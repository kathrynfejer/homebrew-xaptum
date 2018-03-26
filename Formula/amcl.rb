class Amcl < Formula
  desc "A standards compliant C cryptographic library with no external dependencies, specifically designed to support the Internet of Things (IoT)."
  homepage "https://github.com/milagro-crypto/milagro-crypto-c"
  version "4.7.0"
  url "https://github.com/milagro-crypto/milagro-crypto-c/archive/42111ad79eb41bb198032902a78f7cc49826e1bd.tar.gz"
  sha256 "4e2e32ff6db36abe11ec2ab07acb4d1fb30a1ad656bf3cdef66ccbbc223ad750"

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
