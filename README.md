# ETNC Wallet GUI

Copyright (c) 2018, OT with Bare Hands

## About this Project


This is the GUI for the [core ETNC implementation](https://github.com/electroneumclassic/electroneum-classic). It is open source and completely free to use without restrictions, except for those specified in the license agreement below. There are no restrictions on anyone creating an alternative implementation of Monero that uses the protocol and network in a compatible manner.

As with many development projects, the repository on Github is considered to be the "staging" area for the latest changes. Before changes are merged into that branch on the main repository, they are tested by individual developers in their own branches, submitted as a pull request, and then subsequently tested by contributors who focus on testing and code reviews. That having been said, the repository should be carefully considered before using it in a production environment, unless there is a patch in the repository for a particular show-stopping issue you are experiencing. It is generally a better idea to use a tagged release for stability.


## Supporting the ETNC GUI Project

The ETNC GUI donation address is: `etncwvsWG1XDL6KWiFr6JXSGfrpZiQ4MMAS2XE9qW1Zx94GHEcvR5DQLSsmJHHa7fx3uASctBXKCaSvLnEu3spy8Y2n6cuqpU6U`

## License

See [LICENSE](LICENSE).


## Compiling ETNC GUI Core from Source

### On Linux:

(Tested on Ubuntu 17.10 x64)

1. Install Electroneum dependencies

  - For Ubuntu 17.10
  	`sudo apt-get install build-essential cmake pkg-config libboost-all-dev libssl-dev libunbound-dev libminiupnpc-dev libunwind8-dev liblzma-dev libldns-dev libexpat1-dev doxygen graphviz`
	
	`sudo apt-get install libgtest-dev`
	`cd /usr/src/gtest`
	`sudo cmake . `
	`sudo make`
	`sudo mv libg* /usr/lib/`

	`sudo apt install build-essential cmake libboost-all-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev`

  - For Gentoo

	`sudo emerge app-arch/xz-utils app-doc/doxygen dev-cpp/gtest dev-libs/boost dev-libs/expat dev-libs/openssl dev-util/cmake media-gfx/graphviz net-dns/unbound net-libs/ldns net-libs/miniupnpc sys-libs/libunwind`

2. Grab an up-to-date copy of the ETNC-Wallet-GUI repository

	`git clone https://github.com/OT-BareHands/ETNC-Wallet-GUI.git`

3. Go into the repository

	`cd ETNC-Wallet-GUI`

4. Install the GUI dependencies

  - For Ubuntu 17.10+ x64

    `sudo apt-get install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-dialogs qml-module-qtquick-xmllistmodel qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qttools5-dev-tools`
    
    `sudo apt-get install libreadline-dev qml-module-qtwebengine`

5. Build the GUI

  - For Ubuntu
  
  	`./get_libwallet_api.sh`
	`./build.sh`


The executable can be found in the build/release/bin folder.

### On OS X:

(Tested on macOS Sierra 10.12.6 - Running on a Late 2014 Mac Mini)

1. Install Xcode from AppStore
2. Install [homebrew](http://brew.sh/)
3. Install [electroneum](https://github.com/electroneumclassic/electroneum-classic) dependencies:

  `brew install boost --c++11`

  `brew install openssl` - to install openssl headers

  `brew install pkgconfig`

  `brew install cmake`

  `brew install qt5`  (or download QT 5.11.1+ from [qt.io](https://www.qt.io/download-open-source/))

  If you have an older version of Qt installed via homebrew, you can force it to use 5.x like so:
  
  `brew link --force --overwrite qt5`

5. Add the Qt bin directory to your path

    Example: `export PATH=$PATH:/usr/local/Cellar/qt/5.11.1/bin` (brew install qt5)
    Example: `export PATH=$PATH:$HOME/Qt/5.11.1/clang_64/bin` (install from website)

    This is the directory where Qt 5.x is installed on **your** system

6. Grab an up-to-date copy of the electroneum-core repository

  `git clone https://github.com/OT-BareHands/ETNC-Wallet-GUI.git`

7. Go into the repository

  `cd ETNC-Wallet-GUI`

8. Start the build

  `./get_libwallet_api.sh`
  `./build.sh`

The executable can be found in the `build/release/bin` folder.

**Note:** Workaround for "ERROR: Xcode not set up properly"

Edit `$HOME/Qt/5.11.1/clang_64/mkspecs/features/mac/default_pre.prf`

replace
`isEmpty($$list($$system("/usr/bin/xcrun -find xcrun 2>/dev/null")))`

with
`isEmpty($$list($$system("/usr/bin/xcrun -find xcodebuild 2>/dev/null")))`

More info: http://stackoverflow.com/a/35098040/1683164


### On Windows:

The ETNC Wallet GUI on Windows is 64 bits only; 32-bit Windows GUI builds are not officially supported anymore.

1. Install [MSYS2](https://www.msys2.org/), follow the instructions on that page on how to update system and packages to the latest versions

2. Open an 64-bit MSYS2 shell: Use the *MSYS2 MinGW 64-bit* shortcut, or use the `msys2_shell.cmd` batch file with a `-mingw64` parameter

3. Install MSYS2 packages for Monero dependencies; the needed 64-bit packages have `x86_64` in their names

    ```
    pacman -S mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake mingw-w64-x86_64-boost mingw-w64-x86_64-openssl mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium
    ```

    You find more details about those dependencies in the [Electroneum Classic documentation](https://github.com/electroneumclassic/electroneum-classic). Note that that there is no more need to compile Boost from source; like everything else, you can install it now with a MSYS2 package.

4. Install Qt5

    ```
    pacman -S mingw-w64-x86_64-qt5
    ```

    There is no more need to download some special installer from the Qt website, the standard MSYS2 package for Qt will do in almost all circumstances.

5. Install git

    ```
    pacman -S git
    ```

6. Clone repository

    ```
    git clone https://github.com/OT-BareHands/ETNC-Wallet-GUI.git
    ```

7. Build

    ```
    cd ETNC-Wallet-GUI
    ./build.sh
    cd build
    make deploy
    ```

The executable can be found in the `.\release\bin` directory.
