# These instructions are an amalgamation of the following:
#   * https://github.com/Ensembl/linuxbrew-automation/blob/master/01-base-libraries.sh
#   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-basic-dependencies/dockerfile
#   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-compara-base/dockerfile
#   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-compara-proteintrees/dockerfile

git clone https://github.com/Linuxbrew/brew.git $ENSEMBL_LINUXBREW_DIR

brew analytics off 
brew tap denji/nginx 
brew tap ensembl/ensembl 
brew tap ensembl/external 
brew tap ensembl/moonshine 
brew tap ensembl/web 
brew tap ensembl/cask

brew install ensembl/cask/pre-flight 
brew install ensembl/cask/basic-dependencies 
brew install ensembl/cask/perl-clibs 
brew cleanup 
rm -rf $HOME/.cache/Homebrew

