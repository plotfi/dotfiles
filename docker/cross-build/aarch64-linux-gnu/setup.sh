sudo apt install cmake ninja-build clang clang-format lldb lld gcc g++ vim cargo htop tmux git curl \
                 python3-distutils expect net-tools di tig wget \
                 libstdc++-8-dev-arm64-cross libstdc++6-arm64-cross libgcc1-arm64-cross libgcc-8-dev-arm64-cross

cd
git clone http://github.com/llvm/llvm-test-suite
git clone http://github.com/llvm/llvm-project
mkdir test-suite-build
mkdir bootstrap
cd bootstrap/
cmake -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_LLD=ON -DLLVM_ENABLE_PROJECTS=all ../llvm-project/llvm
ninja

ARCH=aarch64-linux-gnu
VERS=8

cd
mkdir -p sysroots/$ARCH
cd sysroots/$ARCH
wget https://raw.githubusercontent.com/plotfi/dotfiles/master/docker/cross-build/$ARCH/CMakeCache.txt
cp -r /usr/$ARCH/* .
cd lib/
cp -r /usr/lib/gcc-cross/$ARCH/$VERS/* .
mv include/* ../include/
rmdir include/

cd
cd test-suite-build
cmake -DLLVM_BUILT_ROOT=`pwd`/bootstrap -DCMAKE_SYSROOT=`pwd`/sysroots/$ARCH \
      -C`pwd`/sysroots/$ARCH/CMakeCache.txt -C../test-suite/cmake/caches/O3.cmake  ../llvm-test-suite/
make -j8
