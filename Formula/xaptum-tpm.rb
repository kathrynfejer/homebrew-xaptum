class XaptumTpm < Formula
  desc "Utilities for interacting with the TPM 2.0 chip used to access the Xaptum Edge Network Fabric."
  homepage "https://github.com/xaptum/xaptum-tpm"
  url "https://github.com/xaptum/xaptum-tpm/archive/v0.5.1.tar.gz"
  sha256 "89c9087cf6cffe576144abe689f4a8c75c45c94360116cf22860f3b8d888ad1a"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

end
