#!/usr/bin/env sh

# This script is essentially based on work of the project LaTeX3
# Source: https://github.com/latex3/latex3/

# This script is used for testing using Travis
# It is intended to work on their VM set up: OS X 10.11
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH="/usr/local/texlive/2016basic/bin/universal-darwin":$PATH
if ! command -v latexmk > /dev/null; then

# Obtain BasicTeX with brew cask
brew cask install basictex

# Install a minimal system
sudo installer -pkg /usr/local/Caskroom/basictex/2016.1009/mactex-basictex-20161009.pkg -target /

# Updating the installation
sudo tlmgr update --self --all

fi

# Additional requirements for (u)pLaTeX, done with no dependencies to
# avoid large font payloads
sudo tlmgr install --no-depends ptex uptex ptex-base uptex-base ptex-fonts \
uptex-fonts platex uplatex

# Set up graphics: nowadays split over a few places and requiring
# HO's bundle
sudo tlmgr install graphics-def

# Other contrib packages: done as a block to avoid multiple calls to tlmgr
# Dependencies other than the core l3build set up, metafont, fontspec and the
# 'graphics stack' (itself needed by fontspec) are listed below
sudo tlmgr install --no-depends \
siunitx       \
tlmgr install \
adobemapping  \
biber         \
biblatex      \
latexmk       \
lm-math       \
logreq        \
units         \
xstring

# Keep no backups (not required, simply makes cache bigger)
sudo tlmgr option -- autobackup 0

cat /usr/local/texlive/2016basic/texmf-dist/web2c/updmap.cfg

# Update the TL install but add nothing new
sudo tlmgr update --self --all --no-auto-install