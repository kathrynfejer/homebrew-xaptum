class XaptumTpm < Formula
  desc "Utilities for interacting with the TPM 2.0 chip used to access the Xaptum Edge Network Fabric."
  homepage "https://github.com/xaptum/xaptum-tpm"
  url "https://github.com/xaptum/xaptum-tpm/archive/v0.5.2.tar.gz"
  sha256 "78985423adde92d7fd09f4c13653f48ae7abab953e1ed901663eb90acb3a8351"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

end
