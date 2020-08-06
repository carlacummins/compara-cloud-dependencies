export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export ENSEMBL_SOFTWARE_DEPENDENCIES_DIR="/apps/compara"
export ENSEMBL_LINUXBREW_DIR="$ENSEMBL_SOFTWARE_DEPENDENCIES_DIR/linuxbrew"
export ENSEMBL_INSTALL_DIR="/apps/repos"

export PATH="$ENSEMBL_INSTALL_DIR/ensembl-hive/scripts:$ENSEMBL_LINUXBREW_DIR/bin:$PATH"
export PERL5LIB="/apps/repos/ensembl/modules:/apps/repos/ensembl-io/modules:/apps/repos/ensembl-compara/modules:/apps/repos/ensembl-test/modules:/apps/repos/ensembl-hive/modules:/apps/repos/ensembl-analysis/modules:/apps/repos/bioperl-live:/apps/repos/bioperl-run/lib:$ENSEMBL_LINUXBREW_DIR/Cellar/perl/5.32.0/lib/perl5/site_perl/5.32.0/:$PERL5LIB"

export EHIVE_ROOT_DIR="$ENSEMBL_INSTALL_DIR/ensembl-hive"
export ENSEMBL_CVS_ROOT_DIR="$ENSEMBL_INSTALL_DIR"

# settings to install DBD::mysql with cpanm
export DBD_MYSQL_CFLAGS=-I/usr/bin/mysql
export DBD_MYSQL_LIBS="-L/usr/bin/mysql"
export DBD_MYSQL_TESTDB=test_db
export DBD_MYSQL_TESTHOST=$MYSQL_HOST
export DBD_MYSQL_TESTPASSWORD=ensembl
export DBD_MYSQL_TESTPORT=3306
export DBD_MYSQL_TESTUSER=ensadmin

