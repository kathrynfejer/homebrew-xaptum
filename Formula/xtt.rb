class Xtt < Formula
  desc "C lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt"
  url "https://github.com/xaptum/xtt/archive/v0.6.0.tar.gz"
  sha256 "ea4c4af234957dac5f703cd1e69aa8d4d68e584eebb704e00560f0071d20850f"

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
