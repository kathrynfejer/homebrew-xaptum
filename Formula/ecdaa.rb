class Ecdaa < Formula
  desc "C lib for Elliptic Curve Direct Anonymous Attestation (DAA) signatures"
  homepage "https://github.com/xaptum/ecdaa"
  url "https://github.com/xaptum/ecdaa/archive/v0.9.1.tar.gz"
  sha256 "ca7cfe0f24c013834682d782ce1dbc07c88dc13e228cff27cc9c4b7756d40d5b"

  depends_on "cmake" => :build
  depends_on "python" => :build
  depends_on "amcl"
  depends_on "xaptum-tpm" => :recommended

  def install
    args = std_cmake_args
    args << "-DECDAA_CURVES=BN254,BN254CX,BLS383,FP256BN"
    args << "-DBUILD_EXAMPLES=OFF"
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
