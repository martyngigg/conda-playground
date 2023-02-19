:: Build on Windows
mkdir build && cd build

cmake -G Ninja ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_BUILD_TYPE=Release ^
  ..

ninja
ninja install
