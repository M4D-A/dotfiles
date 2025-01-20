# JOHN THE RIPPER
CWD=$(pwd)

sudo apt-get -y install libssl-dev zlib1g-dev yasm libgmp-dev libpcap-dev libbz2-dev
git clone https://github.com/openwall/john -b bleeding-jumbo ~/john

cd ~/john/src
./configure && make -s clean && make -sj

cd ~/john/run
./john --test=0

cd $CWD
