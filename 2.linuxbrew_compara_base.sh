# clone ensembl repos and bioperl
mkdir -p $ENSEMBL_INSTALL_DIR 
git clone --depth 1 https://github.com/Ensembl/ensembl.git $ENSEMBL_INSTALL_DIR/ensembl 
git clone --depth 1 https://github.com/Ensembl/ensembl-io.git $ENSEMBL_INSTALL_DIR/ensembl-io 
git clone --depth 1 https://github.com/Ensembl/ensembl-compara.git $ENSEMBL_INSTALL_DIR/ensembl-compara 
git clone --depth 1 https://github.com/Ensembl/ensembl-test.git $ENSEMBL_INSTALL_DIR/ensembl-test 
git clone --depth 1 https://github.com/Ensembl/ensembl-hive.git $ENSEMBL_INSTALL_DIR/ensembl-hive 
git clone --depth 1 https://github.com/Ensembl/ensembl-hive-docker-swarm.git $ENSEMBL_INSTALL_DIR/ensembl-hive-docker-swarm 
git clone --branch dev/hive_master --depth 1 https://github.com/Ensembl/ensembl-analysis.git $ENSEMBL_INSTALL_DIR/ensembl-analysis 
git clone --branch v1.6.x --depth 1 https://github.com/bioperl/bioperl-live $ENSEMBL_INSTALL_DIR/bioperl-live 
git clone --branch release-1-6-9 --depth 1 https://github.com/bioperl/bioperl-run $ENSEMBL_INSTALL_DIR/bioperl-run

# other deps
brew install curl sqlite3 cpanminus
sudo yum install graphviz # brew version wouldn't build - problem compiling bison 

# install perl deps from cpan
cpanm --installdeps --with-recommends --notest $ENSEMBL_INSTALL_DIR/ensembl 
cpanm --installdeps --with-recommends --notest $ENSEMBL_INSTALL_DIR/ensembl-compara 
cpanm --installdeps --with-recommends --notest $ENSEMBL_INSTALL_DIR/ensembl-test 
cpanm --installdeps --with-recommends --notest $ENSEMBL_INSTALL_DIR/ensembl-hive 
rm -rf $HOME/.cpan $HOME/.cpanm

# python deps
pip3 install -r $ENSEMBL_INSTALL_DIR/ensembl-compara/requirements.txt

# symlink template files
ln -sf Blast.pm.example   $ENSEMBL_INSTALL_DIR/ensembl-analysis/modules/Bio/EnsEMBL/Analysis/Config/Blast.pm 
ln -sf Compara.pm.example $ENSEMBL_INSTALL_DIR/ensembl-analysis/modules/Bio/EnsEMBL/Analysis/Config/Compara.pm 
ln -sf General.pm.example $ENSEMBL_INSTALL_DIR/ensembl-analysis/modules/Bio/EnsEMBL/Analysis/Config/General.pm


