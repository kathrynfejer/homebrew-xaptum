class Xtt < Formula
  desc "C lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt"
  url "https://github.com/xaptum/xtt/archive/v0.5.3.tar.gz"
  sha256 "5160dab165250997c045828e24fe029243dfc43f8fdbd04bf044f0372dfbe32d"

  depends_on "cmake" => :build
  depends_on "ecdaa"
  depends_on "libsodium"
  depends_on "xaptum-tpm" => :recommended

  def install
    args = std_cmake_args
    args << "-DBUILD_EXAMPLES=ON"
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
