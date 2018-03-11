class XaptumTpm < Formula
  desc "Utilities for interacting with the TPM 2.0 chip used to access the Xaptum Edge Network Fabric."
  homepage "https://github.com/xaptum/xaptum-tpm"
  url "https://github.com/xaptum/xaptum-tpm/archive/v0.4.1.tar.gz"
  sha256 "626b02f234ca281bc9808216a84f1100ba28a443d926ec3e607d738b0aed50cb"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

end
