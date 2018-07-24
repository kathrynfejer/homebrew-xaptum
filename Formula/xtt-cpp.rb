class XttCpp < Formula
  desc "C++ wrappers for the XTT IoT Security Protocol"
  homepage "https://github.com/xaptum/xtt-cpp"
  url "https://github.com/xaptum/xtt-cpp/archive/v0.1.0.tar.gz"
  sha256 "b4a1574ccd0d6b9ffbf2b66a316013147b4f203f03ab96e5c908bedceda9e331"

  depends_on "cmake" => :build
  depends_on "xtt"
  depends_on "boost"

  def install
    args = std_cmake_args
    args << "-DBUILD_EXAMPLES=OFF"
    args << "-DBUILD_TESTING=OFF"

    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *args
      system "make"
      system "make", "install"
    end
  end
end
