class XttCpp < Formula
<<<<<<< master
  desc "C++ wrappers for the XTT IoT Security Protocol"
  homepage "https://github.com/xaptum/xtt-cpp"
  url "https://github.com/xaptum/xtt-cpp/archive/v0.1.0.tar.gz"
  sha256 "b4a1574ccd0d6b9ffbf2b66a316013147b4f203f03ab96e5c908bedceda9e331"
=======
  desc "C++ lib for XTT Trusted Transit Protocol for securing the IoT"
  homepage "https://github.com/xaptum/xtt-cpp"
  url "https://github.com/xaptum/xtt-cpp/archive/v0.2.0.tar.gz"
  sha256 "b13e6832cfbe2125a49f71508400cf04028331c35417e3f69bedfa5a9bd17bd5"
>>>>>>> Upgrade to xtt v0.9.1 and xtt-cpp v0.2.0

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
