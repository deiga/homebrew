require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Osxfuse < Formula
  homepage 'http://osxfuse.github.com/'
  url 'https://github.com/downloads/osxfuse/osxfuse/OSXFUSE-2.5.4.dmg'
  sha1 '2498408fdeab96c7d50d2a2bb83ff4c5e73ae0a7'

  def install

    mount_path = `hdiutil mount OSXFUSE-2.5.4.dmg | awk '/Volume/ {$1=""; gsub(/^ /, "", $0); printf "%s",$0;}'`
    system %Q{sudo installer -package "#{mount_path}/Install OSXFUSE 2.5.pkg" -target "/"}
    system %Q{hdiutil unmount "#{mount_path}"}
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test OSXFUSE`.
    `brew test osxfuse`
  end
end
