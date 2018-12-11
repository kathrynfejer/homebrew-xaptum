class Xtt < Formula
  desc "C lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt"
  url "https://github.com/xaptum/xtt/archive/v0.10.1.tar.gz"
  sha256 "ec31a437a80b7da97bd3fa9c07cba0d6a9dd25559d0a41a898f5b0bf104439cb"

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
