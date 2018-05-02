class Ecdaa < Formula
  desc "C lib for Elliptic Curve Direct Anonymous Attestation (DAA) signatures"
  homepage "https://github.com/xaptum/ecdaa"
  url "https://github.com/xaptum/ecdaa/archive/v0.9.0.tar.gz"
  sha256 "cceb764ee6b0dbd26eb071ea0cf83f9b453c722d5006107f1dcc979d4a6617c3"

  depends_on "cmake" => :build
  depends_on "python" => :build
  depends_on "amcl"
  depends_on "xaptum-tpm" => :recommended

  def install
    args = std_cmake_args
    args << "-DECDAA_CURVES=BN254,BN254CX,BLS383,FP256BN"
    args << "-DBUILD_EXAMPLES=ON"
    args << "-DBUILD_TESTING=OFF"

    if build.without? "xaptum-tpm"
      args << "-DECDAA_TPM_SUPPORT=OFF"
    else
      args << "-DECDAA_TPM_SUPPORT=ON"
    end

    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *args
      system "make"
      system "make", "install"
    end
  end
end
