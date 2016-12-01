cd ~
# If libwebsockets.org is not responding, just comment the github line below
#git clone git://git.libwebsockets.org/libwebsockets
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
# Uncomment next line for stable websockets version
git checkout v1.5-chrome47-firefox41
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" ..
make && make install
