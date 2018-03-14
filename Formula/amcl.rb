class Amcl < Formula
  desc "A standards compliant C cryptographic library with no external dependencies, specifically designed to support the Internet of Things (IoT)."
  homepage "https://github.com/milagro-crypto/milagro-crypto-c"
  url "https://github.com/milagro-crypto/milagro-crypto-c/archive/7e0f5f9198dddd3d84c85e2aac720b318038c378.tar.gz"
  sha256 "c3905c74631694ccb51c12e02b0ef3163e920f648de25cd5f3b776c14356ff72"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args,
             "-DAMCL_HEADER_INSTALL_SUBDIR=amcl",
             "-DAMCL_CHUNK=64",
             "-DBUILD_MPIN=ON",
             "-DBUILD_WCC=ON",
             "-DAMCL_RSA=2048,3072,4096",
             "-DAMCL_CURVE=NIST256,C25519,ED25519,BRAINPOOL,ANSSI,NUMS256E,NUMS256W,NUMS384E,NUMS384W,NUMS512E,NUMS512W,HIFIVE,GOLDILOCKS,NIST384,C41417,NIST521,BN254,BN254CX,BLS383,FP256BN,FP512BN,BLS461"
      system "make"
      system "make", "install"
    end
  end

end
