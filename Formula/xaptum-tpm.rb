class XaptumTpm < Formula
  desc "Utilities for interacting with the TPM 2.0 chip used to access the Xaptum Edge Network Fabric."
  homepage "https://github.com/xaptum/xaptum-tpm"
  url "https://github.com/xaptum/xaptum-tpm/archive/v0.5.8.tar.gz"
  sha256 "701943cd0302592756407323c481ba83e76f62af3f676b947171db1b87974606"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

end
