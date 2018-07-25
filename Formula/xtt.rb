class Xtt < Formula
  desc "C lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt"
  url "https://github.com/xaptum/xtt/archive/v0.9.1.tar.gz"
  sha256 "0991e11895b15c08096f53587b444c56647a050b5111fd4095140560452a44a9"

  depends_on "cmake" => :build
  depends_on "ecdaa"
  depends_on "libsodium"
  depends_on "amcl"
  depends_on "xaptum-tpm" => :recommended

  def install
    args = std_cmake_args
    args << "-DBUILD_EXAMPLES=OFF"
    args << "-DBUILD_TESTING=OFF"

    if build.without? "xaptum-tpm"
      args << "-DUSE_TPM=OFF"
    else
      args << "-DUSE_TPM=ON"
    end

    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *args
      system "make"
      system "make", "install"
    end
  end
end
