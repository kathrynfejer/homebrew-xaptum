class Amcl < Formula
  desc "A standards compliant C cryptographic library with no external dependencies, specifically designed to support the Internet of Things (IoT)."
  homepage "https://github.com/milagro-crypto/milagro-crypto-c"
  url "https://github.com/milagro-crypto/milagro-crypto-c/archive/cf38b08480ef9ed546ff82b4939292bd0d218540.tar.gz"
  sha256 "06e4f46557da66e679e75b175765843a30c9c85b8048eb4c3b947fafb9369840"

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
