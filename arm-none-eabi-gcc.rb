require 'formula'

class ArmNoneEabiGcc < Formula
  desc "GNU compiler collection for ARM embedded targets"
  homepage 'https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain'
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version '12.2.rel1'
  license 

  on_macos do
    on_intel do 
      url 'https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi.tar.xz'
    end

    on_arm do 
      url 'https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-arm64-arm-none-eabi.tar.xz'  
      sha256 '21a9e875250bcb0db8df4cb23dd43c94c00a1d3b98ecba9cdd6ed51586b12248'
    end
  end

  def install
    (prefix/"gcc").install Dir["./*"]
    Dir.glob(prefix/"gcc/bin/*") { |file| bin.install_symlink file }
  end
end
