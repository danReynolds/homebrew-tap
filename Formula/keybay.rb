class Keybay < Formula
  desc "Austere, local, run-scoped secret injection"
  homepage "https://github.com/danReynolds/keybay"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/danReynolds/keybay/releases/download/keybay_cli-v0.1.0/keybay-0.1.0-macos-arm64.tar.gz"
      sha256 "d9dc8d59c0e97d760b8e56652df737191522f93eb015b5f8674ef2f8cbec9394"
    else
      url "https://github.com/danReynolds/keybay/releases/download/keybay_cli-v0.1.0/keybay-0.1.0-macos-x64.tar.gz"
      sha256 "659d5c07218c34c9baf00459bf6f56bfba42515911d79693ab485a60cdab8cb6"
    end
  end

  on_linux do
    depends_on "libsecret"

    if Hardware::CPU.arm?
      url "https://github.com/danReynolds/keybay/releases/download/keybay_cli-v0.1.0/keybay-0.1.0-linux-arm64.tar.gz"
      sha256 "c500cf0a2ff3f4f3905f567108cc60fc77f6f02f39fe2a96c2dd7bc6cf008f25"
    else
      url "https://github.com/danReynolds/keybay/releases/download/keybay_cli-v0.1.0/keybay-0.1.0-linux-x64.tar.gz"
      sha256 "cb8b2c98beebd890f3b1724f1760ec380195ee62a278c54a9a9707cdb478ffc7"
    end
  end

  def install
    bin.install "keybay"
    prefix.install "README.md"
    pkgshare.install "example"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/keybay --version")
    assert_includes shell_output("#{bin}/keybay --help"), "run [-f FILE]"
  end
end
