# compara-cloud-dependencies
After installing dependencies for running the protein trees pipeline to google cloud platform, a set of shell scripts were developed. These are those.

These instructions are an amalgamation of the following:
   * https://github.com/Ensembl/linuxbrew-automation/blob/master/01-base-libraries.sh
   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-basic-dependencies/dockerfile
   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-compara-base/dockerfile
   * https://hub.docker.com/r/muffato/ensembl-linuxbrew-compara-proteintrees/dockerfile

## Steps
1. source envs.sh
2. run shell scripts in order:
    * 1.linuxbrew_basic_dependencies.sh
    * 2.linuxbrew_compara_base.sh
	* 3.linuxbrew_compara_proteintrees.sh

## Notes / Known Issues

### xz
* `xz` was failing `make check` tests when installing through `brew install ensembl/cask/basic-dependencies`
	* solution was to manually install `xz` in the correct location: `./configure --prefix=$ENSEMBL_LINUXBREW_DIR/Cellar/xz/5.2.5 && make && make install`
	* `brew link xz`

### percona-client
* `percona-client` install failing: `$ENSEMBL_LINUXBREW_DIR/include/sys/types.h:33:9: error: unknown type name '__u_char' typedef __u_char u_char;`
	* tried editing formula (`$ENSEMBL_LINUXBREW_DIR/Library/Taps/ensembl/homebrew-external/percona-client.rb`) to include new CFLAGs: `-Du_char="unsigned char"`
	* these needed to be included in both the `cmake` and `make` commands : not successful
	* solution was to remove dependencies (and hope it doesn't bite later):
		* edit `/apps/compara/linuxbrew/Library/Taps/ensembl/homebrew-cask/yml/perl-clibs.yml` and remove `percona`, `kent` (as it has percona as a dependency)
		* regenerate the cask: `bin/create_cask --verbose --config yml/perl-clibs.yml --dir .`
		* remove cached files: `~/.cache/Homebrew/downloads/<SHA256>--<dep name>.rb`
		* `brew install ensembl/cask/perl-clibs` again

### graphviz / bison
* brew can't install graphviz : compilation error with dep `bison`
	* exact same issue as this: [Re: complain.c:(.text+0x6df): undefined reference to `ostream_printf'](https://lists.gnu.org/archive/html/bug-bison/2020-07/msg00045.html)
	* looks like either updating to super super new gettext-0.21 release fixes (first try `brew install gettext`)
	* or downgrade bison to 3.6.4

### hcluster
* trouble with `hcluster`: formula is set to use `svn` to download v0.5.0
	* `brew install svn` is breaking down due to `krb5` error
	* first try: edit formula to grab a v0.5.1 I found on github: https://github.com/douglasgscofield/hcluster
		* can then update the download strategy in the formula to `:using => :git`

### harfbuzz
* `harfbuzz` failing to compile:
	* [Harfbuzz fails to build on Ubuntu 20.04 (WSL 2) · Issue #20888 · Homebrew/linuxbrew-core · GitHub](https://github.com/Homebrew/linuxbrew-core/issues/20888)
	* disabled `glib`, `gobject`, `introspection`

### DBD::mysql
* `DBD::mysql` is a nightmare to install!!
	* in the end, some environment variables (see `envs.sh`) to set up mysql connection credentials helped
	* needed to set `export LD_LIBRARY_PATH=/usr/lib:/usr/lib64:/usr/lib64/mysql` so that all the libs were found
	* `cpanm DBD::mysql --force` had to be used because of testing failures
