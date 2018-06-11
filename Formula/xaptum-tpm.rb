class XaptumTpm < Formula
  desc "Utilities for interacting with the TPM 2.0 chip used to access the Xaptum Edge Network Fabric."
  homepage "https://github.com/xaptum/xaptum-tpm"
  url "https://github.com/xaptum/xaptum-tpm/archive/v0.5.5.tar.gz"
  sha256 "8631f6539c1e90e42deebba7c2095aa657b175542eb87e1a4e6478c8d89433db"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

end
