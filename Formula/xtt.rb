class Xtt < Formula
  desc "C lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt"
  url "https://github.com/xaptum/xtt/archive/v0.5.0.tar.gz"
  sha256 "4a2c1cffdb2b0a89d206a9984ac82d0822681d01244dc33c697652004f5f9b1e"

  depends_on "cmake" => :build
  depends_on "ecdaa"
  depends_on "libsodium"
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
